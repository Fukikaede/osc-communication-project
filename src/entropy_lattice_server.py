# OSC server for 3-line lattice generation with independent parameter control.

import threading
import time
from typing import Any

import numpy as np
from pythonosc.dispatcher import Dispatcher
from pythonosc.osc_server import BlockingOSCUDPServer
from pythonosc.udp_client import SimpleUDPClient

# ---------------- Network ----------------
MAX_HOST = "127.0.0.1"
MAX_PORT = 8000  # Python -> Max
PY_HOST = "127.0.0.1"
PY_PORT = 8001  # Max -> Python

client = SimpleUDPClient(MAX_HOST, MAX_PORT)

# ---------------- Core constants ----------------
RHO_LIMIT = 0.95
BEAT_QUANT = 1.0 / 12.0
VOICE_COUNT = 3
ADDR_MAP = ["/seq_low", "/seq_mid", "/seq_high"]

VOICE_BANDS = [
    ("low", 110.0, 220.0),
    ("mid", 220.0, 440.0),
    ("high", 440.0, 1760.0),
]

CONSONANT_OFFSETS = np.array(
    [
        [0, 0],
        [1, 0],
        [-1, 1],
        [2, -1],
    ],
    dtype=np.int32,
)

RHY_PATTERNS = [
    (1.0, 1.0, 1.0, 1.0),
    (0.75, 1.5, 0.75, 1.0),
    (1.0, 0.75, 1.5, 0.75),
    (0.75, 0.75, 1.5, 1.0),
    (1.0, 1.5, 0.75, 0.75),
    (1.5, 0.75, 0.75, 1.0),
    (0.75, 1.0, 1.5, 0.75),
]

DEFAULT_PARAMS: dict[str, Any] = {
    "sigma_pitch": 1.0,
    "sigma_rhythm": 1.0,
    "rho": 0.0,
    "rhythm_disrupt_max": 0.35,
    "harmony_strength": 0.6,
    "tau": 1.0,
    "min_spacing_cents_mid": 260.0,
    "min_spacing_cents_high": 260.0,
    "vel": 96,
    "send_pdf": 1,
    "max_events_per_bar": 16,
    "seed_base": 42,
}

PARAM_RULES: dict[str, tuple[type, float, float]] = {
    "sigma_pitch": (float, 0.05, 4.0),
    "sigma_rhythm": (float, 0.05, 4.0),
    "rho": (float, -RHO_LIMIT, RHO_LIMIT),
    "rhythm_disrupt_max": (float, 0.0, 0.95),
    "harmony_strength": (float, 0.0, 1.0),
    "tau": (float, 0.05, 4.0),
    "min_spacing_cents_mid": (float, 0.0, 1200.0),
    "min_spacing_cents_high": (float, 0.0, 1200.0),
    "vel": (int, 1, 127),
    "send_pdf": (int, 0, 1),
    "max_events_per_bar": (int, 1, 64),
    "seed_base": (int, 0, 2_147_483_647),
}

VERBOSE = False


def log(*a: Any) -> None:
    if VERBOSE:
        print(*a)


class Engine:
    def __init__(self, params: dict[str, Any]):
        self.params = params
        self._build_lattices()
        self._reseed_rngs(int(params["seed_base"]))

    def _build_lattices(self) -> None:
        f0 = 440.0
        pitch_i = range(-6, 7)
        pitch_j = range(-6, 7)
        min_f = 110.0
        max_f = 1760.0

        coords, freqs = [], []
        for i in pitch_i:
            for j in pitch_j:
                f = f0 * (2.0**i) * (3.0**j)
                if min_f <= f <= max_f:
                    coords.append((i, j))
                    freqs.append(f)

        self.p_coords = np.asarray(coords, dtype=np.int32)
        self.p_freqs = np.asarray(freqs, dtype=np.float64)
        self.p_coords_f64 = self.p_coords.astype(np.float64)

        self.p_imin, self.p_imax = int(min(pitch_i)), int(max(pitch_i))
        self.p_jmin, self.p_jmax = int(min(pitch_j)), int(max(pitch_j))
        self.px = self.p_imax - self.p_imin + 1
        self.py = self.p_jmax - self.p_jmin + 1

        rhy_u = range(-3, 4)
        rhy_v = range(-2, 3)
        dur_min, dur_max = 0.25, 2.0

        rcoords, rdur = [], []
        for u in rhy_u:
            for v in rhy_v:
                r = (2.0**u) * (3.0**v)
                d = 1.0 / r
                if dur_min <= d <= dur_max:
                    rcoords.append((u, v))
                    rdur.append(d)

        self.r_coords = np.asarray(rcoords, dtype=np.int32)
        self.r_dur = np.asarray(rdur, dtype=np.float64)

        self.r_imin, self.r_imax = int(min(rhy_u)), int(max(rhy_u))
        self.r_jmin, self.r_jmax = int(min(rhy_v)), int(max(rhy_v))
        self.rx = self.r_imax - self.r_imin + 1
        self.ry = self.r_jmax - self.r_jmin + 1

        self.voice_pmask = []
        for (name, fmin, fmax) in VOICE_BANDS:
            m = (self.p_freqs >= fmin) & (self.p_freqs < fmax)
            if int(m.sum()) < 8:
                logf = np.log2(self.p_freqs)
                q1, q2 = np.quantile(logf, [1 / 3, 2 / 3])
                if name == "low":
                    m = logf < q1
                elif name == "mid":
                    m = (logf >= q1) & (logf < q2)
                else:
                    m = logf >= q2
            self.voice_pmask.append(m)

    def _reseed_rngs(self, seed_base: int) -> None:
        self.rngs = [np.random.default_rng(seed_base + 1000 * v) for v in range(VOICE_COUNT)]


class State:
    def __init__(self):
        self.lock = threading.RLock()
        self.params = dict(DEFAULT_PARAMS)
        self.engine = Engine(self.params)
        self.beats_per_bar = 4
        self.last_pitch_idx = [None, None, None]
        self.last_rhy_idx = [None, None, None]
        self.last_grid = None
        self.last_rgrid = None


state = State()


def qbeat(x: float) -> float:
    return float(np.round(x / BEAT_QUANT) * BEAT_QUANT)


def to_pylist_int(xs) -> list[int]:
    return [int(x) for x in xs]


def to_pylist_float(xs) -> list[float]:
    return [float(x) for x in xs]


def cov_from_params(sigma: float, rho: float) -> np.ndarray:
    s = float(max(1e-6, sigma))
    r = float(np.clip(rho, -RHO_LIMIT, RHO_LIMIT))
    return np.array([[s * s, r * s * s], [r * s * s, s * s]], dtype=np.float64)


def inv_safe(cov: np.ndarray) -> np.ndarray:
    try:
        return np.linalg.inv(cov)
    except np.linalg.LinAlgError:
        return np.linalg.inv(cov + 1e-8 * np.eye(2))


def discrete_gauss(coords_f64: np.ndarray, mu: np.ndarray, inv_cov: np.ndarray) -> np.ndarray:
    diff = coords_f64 - mu[None, :]
    quad = np.einsum("...i,ij,...j", diff, inv_cov, diff)
    p = np.exp(-0.5 * quad)
    s = float(p.sum())
    if s <= 0:
        p[:] = 1.0 / len(p)
    else:
        p /= s
    return p


def roulette_choice(p: np.ndarray, rng: np.random.Generator) -> int:
    cdf = np.cumsum(p, dtype=np.float64)
    r = rng.random() * float(cdf[-1])
    return int(np.searchsorted(cdf, r, side="right"))


def normalize_prob(p: np.ndarray, fallback_mask: np.ndarray | None = None) -> np.ndarray:
    s = float(p.sum())
    if s > 0:
        return p / s
    if fallback_mask is not None and np.any(fallback_mask):
        p2 = np.zeros_like(p, dtype=np.float64)
        idxs = np.where(fallback_mask)[0]
        p2[idxs] = 1.0 / len(idxs)
        return p2
    return np.ones_like(p, dtype=np.float64) / len(p)


def spacing_mask(candidate_freqs: np.ndarray, active_freqs: list[float], min_cents: float) -> np.ndarray:
    if not active_freqs:
        return np.ones(len(candidate_freqs), dtype=bool)
    m = np.ones(len(candidate_freqs), dtype=bool)
    for af in active_freqs:
        c = np.abs(1200.0 * np.log2(candidate_freqs / float(af)))
        m &= c >= min_cents
    return m


def consonance_weight(coords_int: np.ndarray, ref_ij: np.ndarray, tau: float) -> np.ndarray:
    tau = float(max(1e-6, tau))
    delta = coords_int - ref_ij[None, :]
    d = delta[:, None, :] - CONSONANT_OFFSETS[None, :, :]
    d2 = np.sum(d * d, axis=2)
    d2min = np.min(d2, axis=1)
    w = np.exp(-0.5 * d2min / (tau * tau))
    return w.astype(np.float64)


def find_active_note(events, t):
    for (b, i, j, f, dur, vel) in reversed(events):
        if b <= t < b + dur - 1e-9:
            return (i, j, f)
    return None


def probs_to_grid(coords_int: np.ndarray, p_vec: np.ndarray, xmin, ymin, nx, ny):
    grid = np.zeros((nx, ny), dtype=np.float32)
    for k, (a, b) in enumerate(coords_int):
        r = int(a - xmin)
        c = int(b - ymin)
        if 0 <= r < nx and 0 <= c < ny:
            grid[r, c] = float(p_vec[k])
    return grid


def pitch_grid_tuple(engine: Engine):
    return (engine.p_imin, engine.p_imax, engine.p_jmin, engine.p_jmax, engine.px, engine.py)


def rhythm_grid_tuple(engine: Engine):
    return (engine.r_imin, engine.r_imax, engine.r_jmin, engine.r_jmax, engine.rx, engine.ry)


def send_grid_if_changed(force=False):
    engine = state.engine
    tpl = pitch_grid_tuple(engine)
    if force or state.last_grid != tpl:
        client.send_message("/grid", to_pylist_int(tpl))
        state.last_grid = tpl

    rtpl = rhythm_grid_tuple(engine)
    if force or state.last_rgrid != rtpl:
        client.send_message("/rgrid", to_pylist_int(rtpl))
        state.last_rgrid = rtpl


def sample_rhythm_bar(
    engine: Engine,
    beats_per_bar: int,
    sigma_rhythm: float,
    rhythm_disrupt_max: float,
    max_events_per_bar: int,
    last_r,
    rng: np.random.Generator,
):
    sr = float(sigma_rhythm)
    k_patterns = len(RHY_PATTERNS)
    disrupt = float(np.clip(rhythm_disrupt_max, 0.0, 0.95))

    w = np.ones(k_patterns, dtype=np.float64) * 1e-9
    w[0] = 1.0 - disrupt
    if k_patterns > 1:
        w[1:] = disrupt / (k_patterns - 1)

    if last_r is not None and 0 <= int(last_r) < k_patterns:
        w[int(last_r)] += 0.25

    w = w / float(w.sum())
    pid = roulette_choice(w, rng)

    iois = RHY_PATTERNS[pid]
    events = []
    t = 0.0
    for d in iois:
        beat = qbeat(t)
        dur = qbeat(float(d))
        events.append((beat, dur))
        t += float(d)

    total = sum(d for _, d in events)
    drift = float(beats_per_bar) - float(total)
    if abs(drift) > 1e-6:
        b_last, d_last = events[-1]
        d_fix = qbeat(float(d_last) + drift)
        d_fix = max(float(np.min(engine.r_dur)), min(d_fix, float(beats_per_bar) - float(b_last)))
        events[-1] = (b_last, d_fix)

    max_events_per_bar = int(max(1, max_events_per_bar))
    if len(events) > max_events_per_bar:
        events = events[:max_events_per_bar]

    p0_rhy = np.zeros(len(engine.r_dur), dtype=np.float64)
    for _, d in events:
        idx = int(np.argmin(np.abs(engine.r_dur - float(d))))
        p0_rhy[idx] += 1.0
    if float(p0_rhy.sum()) > 0:
        p0_rhy /= float(p0_rhy.sum())
    else:
        p0_rhy[:] = 1.0 / len(p0_rhy)

    return events, int(pid), p0_rhy, sr


def sample_pitch_voice_indep(
    engine: Engine,
    events_bd,
    sigma_pitch: float,
    rho: float,
    last_p,
    voice_mask: np.ndarray,
    rng: np.random.Generator,
    vel: int,
    harmony_strength: float,
    tau: float,
    ref_events_low=None,
    ref_events_mid=None,
    min_spacing_cents: float = 0.0,
    use_harmony: bool = False,
):
    sp = float(sigma_pitch)
    invp = inv_safe(cov_from_params(sp, rho))

    if last_p is None:
        mu_p = np.array([0.0, 0.0], dtype=np.float64)
    else:
        i0, j0 = engine.p_coords[int(last_p)]
        mu_p = np.array([float(i0), float(j0)], dtype=np.float64)

    p0_pitch = discrete_gauss(engine.p_coords_f64, mu_p, invp)

    out = []
    cur_p = last_p

    for (beat, dur) in events_bd:
        pp = p0_pitch if cur_p is None else discrete_gauss(engine.p_coords_f64, mu_p, invp)

        pp2 = np.zeros_like(pp, dtype=np.float64)
        pp2[voice_mask] = pp[voice_mask]

        active_freqs = []
        ref_ij = None

        if use_harmony and ref_events_low is not None:
            low = find_active_note(ref_events_low, beat)
            if low is not None:
                li, lj, lf = low
                ref_ij = np.array([li, lj], dtype=np.int32)
                active_freqs.append(float(lf))

        if use_harmony and ref_events_mid is not None:
            mid = find_active_note(ref_events_mid, beat)
            if mid is not None:
                _, _, mf = mid
                active_freqs.append(float(mf))

        if min_spacing_cents > 0.0 and len(active_freqs) > 0:
            sm = spacing_mask(engine.p_freqs, active_freqs, min_spacing_cents)
            pp2[~sm] = 0.0

        if use_harmony and ref_ij is not None:
            w = consonance_weight(engine.p_coords, ref_ij, tau)
            h = float(np.clip(harmony_strength, 0.0, 1.0))
            pp2 *= ((1.0 - h) + h * w)

        pp2 = normalize_prob(pp2, fallback_mask=voice_mask)
        ip = roulette_choice(pp2, rng)

        i, j = map(int, engine.p_coords[ip])
        f = float(engine.p_freqs[ip])
        out.append((beat, i, j, f, dur, float(vel)))

        cur_p = ip
        mu_p = np.array([float(i), float(j)], dtype=np.float64)

    return out, cur_p, p0_pitch, sp


def sample_bar_3line_indep_harmony(
    engine: Engine,
    bar_id: int,
    beats_per_bar: int,
    params: dict[str, Any],
    last_p_list,
    last_r_list,
):
    sigma_pitch = float(params["sigma_pitch"])
    sigma_rhythm = float(params["sigma_rhythm"])
    rho = float(params["rho"])
    rhythm_disrupt_max = float(params["rhythm_disrupt_max"])
    harmony_strength = float(params["harmony_strength"])
    tau = float(params["tau"])
    min_spacing_mid = float(params["min_spacing_cents_mid"])
    min_spacing_high = float(params["min_spacing_cents_high"])
    vel = int(params["vel"])
    max_events = int(params["max_events_per_bar"])

    rng0 = engine.rngs[0]
    ev_bd_l, last_r2_l, p0r_l, sr_l = sample_rhythm_bar(
        engine, beats_per_bar, sigma_rhythm, rhythm_disrupt_max, max_events, last_r_list[0], rng0
    )
    ev_l, last_p2_l, p0p_l, sp_l = sample_pitch_voice_indep(
        engine,
        ev_bd_l,
        sigma_pitch,
        rho,
        last_p_list[0],
        engine.voice_pmask[0],
        rng0,
        vel,
        harmony_strength,
        tau,
        use_harmony=False,
    )

    rng1 = engine.rngs[1]
    ev_bd_m, last_r2_m, p0r_m, sr_m = sample_rhythm_bar(
        engine, beats_per_bar, sigma_rhythm, rhythm_disrupt_max, max_events, last_r_list[1], rng1
    )
    ev_m, last_p2_m, p0p_m, sp_m = sample_pitch_voice_indep(
        engine,
        ev_bd_m,
        sigma_pitch,
        rho,
        last_p_list[1],
        engine.voice_pmask[1],
        rng1,
        vel,
        harmony_strength,
        tau,
        ref_events_low=ev_l,
        min_spacing_cents=min_spacing_mid,
        use_harmony=True,
    )

    rng2 = engine.rngs[2]
    ev_bd_h, last_r2_h, p0r_h, sr_h = sample_rhythm_bar(
        engine, beats_per_bar, sigma_rhythm, rhythm_disrupt_max, max_events, last_r_list[2], rng2
    )
    ev_h, last_p2_h, p0p_h, sp_h = sample_pitch_voice_indep(
        engine,
        ev_bd_h,
        sigma_pitch,
        rho,
        last_p_list[2],
        engine.voice_pmask[2],
        rng2,
        vel,
        harmony_strength,
        tau,
        ref_events_low=ev_l,
        ref_events_mid=ev_m,
        min_spacing_cents=min_spacing_high,
        use_harmony=True,
    )

    voice_events = [ev_l, ev_m, ev_h]
    last_p2_list = [last_p2_l, last_p2_m, last_p2_h]
    last_r2_list = [last_r2_l, last_r2_m, last_r2_h]
    p0p_list = [p0p_l, p0p_m, p0p_h]
    p0r_list = [p0r_l, p0r_m, p0r_h]
    sp_list = [sp_l, sp_m, sp_h]
    sr_list = [sr_l, sr_m, sr_h]

    return voice_events, last_p2_list, last_r2_list, p0p_list, p0r_list, sp_list, sr_list


def clamp_param(name: str, raw_val: Any) -> Any:
    if name not in PARAM_RULES:
        raise KeyError(name)
    typ, lo, hi = PARAM_RULES[name]
    v = float(raw_val)
    v = float(np.clip(v, lo, hi))
    if typ is int:
        return int(round(v))
    return float(v)


def apply_param(name: str, raw_val: Any) -> Any:
    v = clamp_param(name, raw_val)
    with state.lock:
        state.params[name] = v
        if name == "seed_base":
            state.engine._reseed_rngs(int(v))
    return v


# ---------------- OSC Handlers ----------------
def on_hello(address, *args):
    send_grid_if_changed(force=True)
    client.send_message("/ack", "hello")


def on_grid_now(address, *args):
    send_grid_if_changed(force=True)
    client.send_message("/ack", "grid_now")


def on_param(address, *args):
    try:
        if not args:
            client.send_message("/ack", "param_error:missing_value")
            return
        name = address.split("/", 2)[-1]
        if name.startswith("param/"):
            name = name.split("/", 1)[1]
        if name not in PARAM_RULES:
            client.send_message("/ack", f"param_error:unknown:{name}")
            return
        v = apply_param(name, args[0])
        client.send_message("/ack", f"param:{name}={v}")
    except Exception as e:
        client.send_message("/ack", f"param_error:{type(e).__name__}")
        log("on_param error:", e)


def on_pull(address, bar_id, beats_per_bar):
    try:
        send_grid_if_changed(False)

        with state.lock:
            params = dict(state.params)
            bpb = int(beats_per_bar)
            state.beats_per_bar = bpb
            last_p_list = list(state.last_pitch_idx)
            last_r_list = list(state.last_rhy_idx)
            engine = state.engine

        (
            voice_events,
            last_p2_list,
            last_r2_list,
            p0p_list,
            p0r_list,
            sp_list,
            _sr_list,
        ) = sample_bar_3line_indep_harmony(engine, int(bar_id), bpb, params, last_p_list, last_r_list)

        for v in range(VOICE_COUNT):
            payload = [int(bar_id)]
            for (beat, i, j, f, dur, vel) in voice_events[v]:
                payload += [float(beat), int(i), int(j), float(f), float(dur), float(vel)]
            client.send_message(ADDR_MAP[v], payload)

        mid_payload = [int(bar_id)]
        for (beat, i, j, f, dur, vel) in voice_events[1]:
            mid_payload += [float(beat), int(i), int(j), float(f), float(dur), float(vel)]
        client.send_message("/seq", mid_payload)

        if int(params["send_pdf"]) == 1:
            gp = probs_to_grid(engine.p_coords, p0p_list[1], engine.p_imin, engine.p_jmin, engine.px, engine.py)
            client.send_message(
                "/pdf",
                to_pylist_int([engine.p_imin, engine.p_imax, engine.p_jmin, engine.p_jmax])
                + to_pylist_float(gp.flatten().tolist()),
            )

            gr = probs_to_grid(engine.r_coords, p0r_list[1], engine.r_imin, engine.r_jmin, engine.rx, engine.ry)
            client.send_message(
                "/rpdf",
                to_pylist_int([engine.r_imin, engine.r_imax, engine.r_jmin, engine.r_jmax])
                + to_pylist_float(gr.flatten().tolist()),
            )

            gp_l = probs_to_grid(engine.p_coords, p0p_list[0], engine.p_imin, engine.p_jmin, engine.px, engine.py)
            gp_h = probs_to_grid(engine.p_coords, p0p_list[2], engine.p_imin, engine.p_jmin, engine.px, engine.py)
            client.send_message(
                "/pdf_low",
                to_pylist_int([engine.p_imin, engine.p_imax, engine.p_jmin, engine.p_jmax])
                + to_pylist_float(gp_l.flatten().tolist()),
            )
            client.send_message(
                "/pdf_high",
                to_pylist_int([engine.p_imin, engine.p_imax, engine.p_jmin, engine.p_jmax])
                + to_pylist_float(gp_h.flatten().tolist()),
            )

        h = float(-(p0p_list[1] * np.log(p0p_list[1] + 1e-12)).sum())
        client.send_message("/stat", [float(h), float(sp_list[1]), float(params["rho"])])

        with state.lock:
            state.last_pitch_idx = list(last_p2_list)
            state.last_rhy_idx = list(last_r2_list)

    except Exception as e:
        client.send_message("/ack", f"pull_error:{type(e).__name__}")
        log("on_pull error:", e)


# ---------------- Server ----------------
def osc_server():
    disp = Dispatcher()
    disp.map("/hello", on_hello)
    disp.map("/pull", on_pull)
    disp.map("/grid_now", on_grid_now)
    disp.map("/param/*", on_param)

    server = BlockingOSCUDPServer((PY_HOST, PY_PORT), disp)
    print(f"[PythonOSC] listening on {PY_HOST}:{PY_PORT}")
    server.serve_forever()


if __name__ == "__main__":
    t = threading.Thread(target=osc_server, daemon=True)
    t.start()
    try:
        while True:
            time.sleep(1.0)
    except KeyboardInterrupt:
        print("bye")
