"""Max/MSP と連携する 3 声部リアルタイム生成用 OSC サーバー。

このファイルだけを読んでも全体像が追えるように、ここでシステムの役割をまとめる。

システム概要:
    - Max 側は UI、再生、可視化を担当する。
    - Python 側は OSC を受け取り、現在のパラメータから 1 小節ぶんの音楽イベントを生成する。
    - 生成結果は low / mid / high の 3 声部として Max に返される。

通信方向:
    - Python -> Max: 127.0.0.1:8000
    - Max -> Python: 127.0.0.1:8001
    - Python -> Max for Live MIDI recorder: 127.0.0.1:8002

基本的な流れ:
    1. Max が /pull <bar_id> <beats_per_bar> を Python に送る。
    2. Python が音高格子とリズムパターンから 3 声部をサンプリングする。
    3. Python が /seq_low, /seq_mid, /seq_high, /seq, /pdf*, /stat, /chord を Max に返す。
    4. Max が cycle~ で連続音を鳴らし、必要に応じて確率分布や統計値を表示する。

現在の設計では、sigma_pitch, sigma_rhythm, rho, harmony_strength などを
/param/* で独立に操作する。必要な時だけ /macro/complexity で複数パラメータを
段階的な曲線へまとめて反映できる。
"""

import threading
import time
from typing import Any

import numpy as np
from pythonosc.dispatcher import Dispatcher
from pythonosc.osc_server import BlockingOSCUDPServer
from pythonosc.udp_client import SimpleUDPClient

# ---------------- OSC ネットワーク設定 ----------------
MAX_HOST = "127.0.0.1"
MAX_PORT = 8000  # Python -> Max
PY_HOST = "127.0.0.1"
PY_PORT = 8001  # Max -> Python
M4L_HOST = "127.0.0.1"
M4L_PORT = 8002  # Python -> Max for Live MIDI recorder

client = SimpleUDPClient(MAX_HOST, MAX_PORT)
m4l_client = SimpleUDPClient(M4L_HOST, M4L_PORT)

# ---------------- 生成モデルの基本設定 ----------------
# rho は 2 次元ガウス分布の相関係数として使うため、特異行列を避ける範囲に制限する。
RHO_LIMIT = 0.95

# Max 側のスケジューリングが扱いやすいよう、発音位置と長さを 1/12 拍単位に丸める。
BEAT_QUANT = 1.0 / 12.0

VOICE_COUNT = 3
ADDR_MAP = ["/seq_low", "/seq_mid", "/seq_high"]

# cycle~ の周波数切り替え時に隙間が出にくいよう、次イベントに少し重なる長さへ補正する。
LEGATO_OVERLAP_BEATS = 0.02

# /chord はメイン声部より少し弱めの MIDI ベロシティで送る。
MIDI_CHORD_CHANNEL_VEL_SCALE = 0.8

# 3 声部の音域。音高候補はこの帯域で low / mid / high に分ける。
VOICE_BANDS = [
    ("low", 110.0, 220.0),
    ("mid", 220.0, 440.0),
    ("high", 440.0, 1760.0),
]

# 中高声部を低声部に寄せるための「協和的」とみなす格子上の相対位置。
# 完全同度、オクターブ的な近傍、5 度系の近傍をゆるく優先する。
CONSONANT_OFFSETS = np.array(
    [
        [0, 0],
        [1, 0],
        [-1, 1],
        [2, -1],
    ],
    dtype=np.int32,
)

# 1 小節内の IOI(inter-onset interval) パターン。
# sigma_rhythm と rhythm_disrupt_max によって、単純な 1 拍刻みから崩した型へ重みが移る。
RHY_PATTERNS = [
    (1.0, 1.0, 1.0, 1.0),
    (0.75, 1.5, 0.75, 1.0),
    (1.0, 0.75, 1.5, 0.75),
    (0.75, 0.75, 1.5, 1.0),
    (1.0, 1.5, 0.75, 0.75),
    (1.5, 0.75, 0.75, 1.0),
    (0.75, 1.0, 1.5, 0.75),
]

# Max から /param/<name> で上書きされる初期値。
# ここにある値だけが外部から直接操作できる「独立パラメータ」。
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
    "tempo": 120.0,
    "voice_decorrelation": 0.0,
}

# /macro/complexity で更新する音楽的な複雑度パラメータ。
# seed_base, send_pdf, max_events_per_bar, vel, rho は macro では触らず、個別操作に残す。
COMPLEXITY_ANCHORS: tuple[tuple[float, dict[str, float]], ...] = (
    (
        0.0,
        {
            "sigma_pitch": 0.18,
            "sigma_rhythm": 0.22,
            "rhythm_disrupt_max": 0.02,
            "harmony_strength": 1.0,
            "tau": 0.25,
            "min_spacing_cents_mid": 520.0,
            "min_spacing_cents_high": 720.0,
            "tempo": 78.0,
            "voice_decorrelation": 0.0,
        },
    ),
    (
        0.18,
        {
            "sigma_pitch": 0.42,
            "sigma_rhythm": 0.42,
            "rhythm_disrupt_max": 0.06,
            "harmony_strength": 0.9,
            "tau": 0.55,
            "min_spacing_cents_mid": 420.0,
            "min_spacing_cents_high": 560.0,
            "tempo": 96.0,
            "voice_decorrelation": 0.0,
        },
    ),
    (
        0.36,
        {
            "sigma_pitch": 0.75,
            "sigma_rhythm": 0.65,
            "rhythm_disrupt_max": 0.12,
            "harmony_strength": 0.8,
            "tau": 0.85,
            "min_spacing_cents_mid": 320.0,
            "min_spacing_cents_high": 420.0,
            "tempo": 112.0,
            "voice_decorrelation": 0.0,
        },
    ),
    (
        0.55,
        {
            "sigma_pitch": 1.1,
            "sigma_rhythm": 1.05,
            "rhythm_disrupt_max": 0.22,
            "harmony_strength": 0.65,
            "tau": 1.1,
            "min_spacing_cents_mid": 240.0,
            "min_spacing_cents_high": 320.0,
            "tempo": 128.0,
            "voice_decorrelation": 0.0,
        },
    ),
    (
        0.68,
        {
            "sigma_pitch": 1.25,
            "sigma_rhythm": 1.2,
            "rhythm_disrupt_max": 0.28,
            "harmony_strength": 0.58,
            "tau": 1.25,
            "min_spacing_cents_mid": 220.0,
            "min_spacing_cents_high": 280.0,
            "tempo": 136.0,
            "voice_decorrelation": 0.03,
        },
    ),
    (
        0.8,
        {
            "sigma_pitch": 1.75,
            "sigma_rhythm": 1.7,
            "rhythm_disrupt_max": 0.46,
            "harmony_strength": 0.42,
            "tau": 1.7,
            "min_spacing_cents_mid": 180.0,
            "min_spacing_cents_high": 220.0,
            "tempo": 158.0,
            "voice_decorrelation": 0.18,
        },
    ),
    (
        0.9,
        {
            "sigma_pitch": 2.2,
            "sigma_rhythm": 2.3,
            "rhythm_disrupt_max": 0.6,
            "harmony_strength": 0.35,
            "tau": 2.1,
            "min_spacing_cents_mid": 150.0,
            "min_spacing_cents_high": 190.0,
            "tempo": 172.0,
            "voice_decorrelation": 0.32,
        },
    ),
    (
        1.0,
        {
            "sigma_pitch": 2.7,
            "sigma_rhythm": 3.2,
            "rhythm_disrupt_max": 0.86,
            "harmony_strength": 0.25,
            "tau": 2.6,
            "min_spacing_cents_mid": 120.0,
            "min_spacing_cents_high": 160.0,
            "tempo": 190.0,
            "voice_decorrelation": 0.65,
        },
    ),
)

# 各パラメータの型と安全範囲。
# Max UI から極端な値が来ても、生成が破綻しないよう clamp してから使う。
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
    "tempo": (float, 20.0, 300.0),
    "voice_decorrelation": (float, 0.0, 1.0),
}

VERBOSE = False


def log(*a: Any) -> None:
    if VERBOSE:
        print(*a)


class Engine:
    """音高格子、リズム格子、声部ごとの乱数生成器を保持する生成エンジン。"""

    def __init__(self, params: dict[str, Any]):
        self.params = params
        self._build_lattices()
        self._reseed_rngs(int(params["seed_base"]))

    def _build_lattices(self) -> None:
        """音高とリズムの離散格子を作る。

        音高格子:
            f = 440 * 2^i * 3^j
            2 と 3 の冪で構成される単純な just intonation 風の格子。

        リズム格子:
            d = 1 / (2^u * 3^v)
            拍長 0.25 から 2.0 の範囲に収まる候補だけを使う。
        """
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
                # 格子の密度が足りない場合だけ、全候補を 3 分位で分ける保険を使う。
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
        """seed_base から 3 声部ぶんの独立乱数系列を作り直す。"""
        self.rngs = [np.random.default_rng(seed_base + 1000 * v) for v in range(VOICE_COUNT)]


class State:
    """OSC ハンドラ間で共有する現在状態。

    params は現在の制御値、last_* は前小節の最後の格子位置。
    直前位置を覚えることで、音高とリズムが小節ごとに完全リセットされず、連続性を持つ。
    """

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
    """拍位置や長さを BEAT_QUANT 単位に量子化する。"""
    return float(np.round(x / BEAT_QUANT) * BEAT_QUANT)


def to_pylist_int(xs) -> list[int]:
    return [int(x) for x in xs]


def to_pylist_float(xs) -> list[float]:
    return [float(x) for x in xs]


def cov_from_params(sigma: float, rho: float) -> np.ndarray:
    """sigma と rho から、格子上の 2 次元ガウス分布の共分散行列を作る。"""
    s = float(max(1e-6, sigma))
    r = float(np.clip(rho, -RHO_LIMIT, RHO_LIMIT))
    return np.array([[s * s, r * s * s], [r * s * s, s * s]], dtype=np.float64)


def inv_safe(cov: np.ndarray) -> np.ndarray:
    """数値的に不安定な共分散行列でも逆行列を返せるようにする。"""
    try:
        return np.linalg.inv(cov)
    except np.linalg.LinAlgError:
        return np.linalg.inv(cov + 1e-8 * np.eye(2))


def discrete_gauss(coords_f64: np.ndarray, mu: np.ndarray, inv_cov: np.ndarray) -> np.ndarray:
    """離散格子上で正規化されたガウス確率分布を計算する。"""
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
    """確率ベクトル p に従って 1 つのインデックスを選ぶ。"""
    cdf = np.cumsum(p, dtype=np.float64)
    r = rng.random() * float(cdf[-1])
    return int(np.searchsorted(cdf, r, side="right"))


def normalize_prob(p: np.ndarray, fallback_mask: np.ndarray | None = None) -> np.ndarray:
    """確率ベクトルを正規化する。全ゼロの場合は fallback_mask 内で一様分布に戻す。"""
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
    """すでに鳴っている音から min_cents 以上離れた候補だけを許可する。"""
    if not active_freqs:
        return np.ones(len(candidate_freqs), dtype=bool)
    m = np.ones(len(candidate_freqs), dtype=bool)
    for af in active_freqs:
        c = np.abs(1200.0 * np.log2(candidate_freqs / float(af)))
        m &= c >= min_cents
    return m


def consonance_weight(coords_int: np.ndarray, ref_ij: np.ndarray, tau: float) -> np.ndarray:
    """低声部の格子位置 ref_ij に対する協和度の重みを計算する。"""
    tau = float(max(1e-6, tau))
    delta = coords_int - ref_ij[None, :]
    d = delta[:, None, :] - CONSONANT_OFFSETS[None, :, :]
    d2 = np.sum(d * d, axis=2)
    d2min = np.min(d2, axis=1)
    w = np.exp(-0.5 * d2min / (tau * tau))
    return w.astype(np.float64)


def find_active_note(events, t):
    """時刻 t で鳴っているイベントを後ろから探す。"""
    for (b, i, j, f, dur, vel) in reversed(events):
        if b <= t < b + dur - 1e-9:
            return (i, j, f)
    return None


def legato_voice_events(events, beats_per_bar: int):
    """同一声部のイベント間に無音が出にくいよう、dur を次イベント直前まで伸ばす。"""
    if not events:
        return events

    bpb = float(beats_per_bar)
    out = []
    for idx, (beat, i, j, f, dur, vel) in enumerate(events):
        if idx + 1 < len(events):
            next_beat = float(events[idx + 1][0])
            dur2 = max(float(dur), next_beat - float(beat) + LEGATO_OVERLAP_BEATS)
        else:
            dur2 = max(float(dur), bpb - float(beat))
        dur2 = min(dur2, bpb - float(beat))
        if dur2 <= 1e-9:
            dur2 = float(dur)
        out.append((beat, i, j, f, float(dur2), vel))
    return out


def chord_payload_for_bar(
    bar_id: int,
    voice_events,
    beats_per_bar: int,
    tempo: float,
    vel: int,
) -> list[float]:
    """各声部の小節冒頭音から、Max 側 MIDI 用の /chord payload を作る。"""
    freqs = []
    for events in voice_events:
        if events:
            freqs.append(float(events[0][3]))
    if len(freqs) != VOICE_COUNT:
        return []

    beat_ms = 60000.0 / float(max(1e-9, tempo))
    dur_ms = float(beats_per_bar) * beat_ms
    chord_vel = int(np.clip(round(float(vel) * MIDI_CHORD_CHANNEL_VEL_SCALE), 1, 127))
    return [int(bar_id), *freqs, dur_ms, chord_vel]


def pad_payload_for_bar(
    bar_id: int,
    low_events,
    beats_per_bar: int,
    vel: int,
) -> list[float]:
    """low 声部の小節冒頭音を root として、M4L pad 用 payload を作る。"""
    if not low_events:
        return []
    root_freq = float(low_events[0][3])
    pad_vel = int(np.clip(round(float(vel) * 0.65), 1, 127))
    return [int(bar_id), root_freq, float(beats_per_bar), pad_vel]


def probs_to_grid(coords_int: np.ndarray, p_vec: np.ndarray, xmin, ymin, nx, ny):
    """格子点ごとの確率ベクトルを、Max で表示しやすい 2 次元 grid に詰める。"""
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
    """Max 側の可視化に必要な格子サイズを送る。変化がない場合は送信を省略する。"""
    engine = state.engine
    tpl = pitch_grid_tuple(engine)
    if force or state.last_grid != tpl:
        client.send_message("/grid", to_pylist_int(tpl))
        state.last_grid = tpl

    rtpl = rhythm_grid_tuple(engine)
    if force or state.last_rgrid != rtpl:
        client.send_message("/rgrid", to_pylist_int(rtpl))
        state.last_rgrid = rtpl


def send_m4l_sequence(address: str, payload: list[Any]) -> None:
    """Max for Live の MIDI 記録デバイスへ各声部をミラー送信する。

    メインの Max パッチが 8000 番ポートを使うため、M4L 側は 8002 番で別受信にする。
    これにより、従来の可視化/再生パッチと Ableton Live への記録を同時に走らせられる。
    """
    try:
        m4l_client.send_message(address, payload)
    except Exception as e:
        log("send_m4l_sequence error:", e)


def send_m4l_status(message: str) -> None:
    """M4L 側の 8002 受信確認用に短い状態メッセージを送る。"""
    try:
        m4l_client.send_message("/m4l_status", message)
    except Exception as e:
        log("send_m4l_status error:", e)


def rhythm_pattern_weights(sigma_rhythm: float, rhythm_disrupt_max: float, last_r) -> np.ndarray:
    """リズムパターンの選択確率を作る。

    rhythm_disrupt_max が大きいほど崩したパターンに重みが分配される。
    sigma_rhythm が大きいほど分布が平らになり、パターンが揺れやすくなる。
    last_r には少し重みを足し、前小節からの連続性を残す。
    """
    sr = float(np.clip(sigma_rhythm, PARAM_RULES["sigma_rhythm"][1], PARAM_RULES["sigma_rhythm"][2]))
    k_patterns = len(RHY_PATTERNS)
    disrupt = float(np.clip(rhythm_disrupt_max, 0.0, 0.95))

    w = np.ones(k_patterns, dtype=np.float64) * 1e-9
    w[0] = 1.0 - disrupt
    if k_patterns > 1:
        w[1:] = disrupt / (k_patterns - 1)

    if last_r is not None and 0 <= int(last_r) < k_patterns:
        w[int(last_r)] += 0.25

    w = np.power(w, 1.0 / sr)
    return w / float(w.sum())


def rhythm_complexity(sigma_rhythm: float, rhythm_disrupt_max: float) -> float:
    """リズムの複雑さを 0..1 にまとめる。ベロシティ揺れや声部ずれにも使う。"""
    sr_lo, sr_hi = PARAM_RULES["sigma_rhythm"][1], PARAM_RULES["sigma_rhythm"][2]
    sr = float(np.clip(sigma_rhythm, sr_lo, sr_hi))
    disrupt = float(np.clip(rhythm_disrupt_max, 0.0, PARAM_RULES["rhythm_disrupt_max"][2]))
    sr_norm = (sr - sr_lo) / (sr_hi - sr_lo)
    disrupt_norm = disrupt / PARAM_RULES["rhythm_disrupt_max"][2]
    return float(np.clip(0.35 * sr_norm + 0.65 * sr_norm * disrupt_norm, 0.0, 1.0))


def rhythm_events_for_bar(iois, beats_per_bar: int, max_events_per_bar: int, min_dur: float):
    """選ばれた IOI パターンから、1 小節内の beat/dur イベント列を作る。"""
    events = []
    bpb = float(beats_per_bar)
    max_events = int(max(1, max_events_per_bar))
    t = 0.0
    k = 0

    while t < bpb - 1e-9 and len(events) < max_events:
        beat = qbeat(t)
        remaining = bpb - beat
        if remaining <= 1e-9:
            break

        raw_dur = qbeat(float(iois[k % len(iois)]))
        dur = min(raw_dur, remaining)
        if len(events) == max_events - 1:
            dur = remaining
        if dur < min_dur and remaining >= min_dur:
            dur = min(min_dur, remaining)

        dur = qbeat(dur)
        if beat + dur > bpb:
            dur = bpb - beat
        if dur <= 1e-9:
            break

        events.append((float(beat), float(dur)))
        t = beat + dur
        k += 1

    return events


def decorrelate_voice_rhythm(
    events,
    beats_per_bar: int,
    voice_index: int,
    sigma_rhythm: float,
    rhythm_disrupt_max: float,
    amount: float,
    rng: np.random.Generator,
    min_dur: float,
):
    """声部間のリズムを必要に応じてずらす。

    voice_decorrelation が 0 の場合は旧版に近い同一骨格を保つ。
    値を上げると、声部ごとの開始位置ずれ、休符、短い gate が入ってテクスチャが不安定になる。
    """
    if not events:
        return events

    amount = float(np.clip(amount, 0.0, 1.0))
    if amount <= 1e-9:
        return events

    complexity = rhythm_complexity(sigma_rhythm, rhythm_disrupt_max) * amount
    if complexity <= 1e-9:
        return events

    bpb = float(beats_per_bar)
    if voice_index <= 0:
        offset_steps = 0
    else:
        max_offset = min(0.75, 0.25 + 0.75 * complexity)
        max_steps = max(1, int(round(max_offset / BEAT_QUANT)))
        min_steps = voice_index if complexity >= 0.5 else 0
        offset_steps = int(rng.integers(min_steps, max_steps + 1))
    offset = qbeat(offset_steps * BEAT_QUANT)

    drop_prob = min(0.42, 0.04 + 0.34 * complexity)
    gate_min = max(0.45, 0.95 - 0.45 * complexity)

    out = []
    for beat, dur in events:
        if len(events) - len(out) > 1 and rng.random() < drop_prob:
            continue

        beat2 = qbeat(float(beat) + offset)
        if beat2 >= bpb - 1e-9:
            continue

        gate = float(rng.uniform(gate_min, 1.0))
        remaining = bpb - beat2
        dur2 = qbeat(min(float(dur) * gate, remaining))
        if dur2 < min_dur and remaining >= min_dur:
            dur2 = min(min_dur, remaining)
        if dur2 <= 1e-9:
            continue
        out.append((float(beat2), float(dur2)))

    if out:
        return out

    beat, dur = events[0]
    beat2 = min(qbeat(float(beat) + offset), bpb - min_dur)
    dur2 = min(float(dur), bpb - beat2)
    if dur2 <= 1e-9:
        return [(0.0, min(float(min_dur), bpb))]
    return [(float(beat2), float(qbeat(dur2)))]


def sample_rhythm_bar(
    engine: Engine,
    beats_per_bar: int,
    voice_index: int,
    sigma_rhythm: float,
    rhythm_disrupt_max: float,
    voice_decorrelation: float,
    max_events_per_bar: int,
    last_r,
    rng: np.random.Generator,
):
    """1 声部ぶんのリズムをサンプリングし、可視化用のリズム PDF も返す。"""
    sr = float(sigma_rhythm)
    w = rhythm_pattern_weights(sigma_rhythm, rhythm_disrupt_max, last_r)
    pid = roulette_choice(w, rng)

    iois = RHY_PATTERNS[pid]
    min_dur = float(np.min(engine.r_dur))
    events = rhythm_events_for_bar(iois, beats_per_bar, max_events_per_bar, min_dur)
    events = decorrelate_voice_rhythm(
        events,
        beats_per_bar,
        voice_index,
        sigma_rhythm,
        rhythm_disrupt_max,
        voice_decorrelation,
        rng,
        min_dur,
    )

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
    velocity_complexity: float = 0.0,
):
    """リズムイベントに音高を割り当てて、1 声部の発音イベントを作る。

    low 声部は独立にサンプリングする。
    mid / high 声部では、低声部や中声部の同時発音を参照し、
    min_spacing_cents と harmony_strength によって近すぎる音や不協和を抑える。
    """
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
    first_effective_pitch = None

    for (beat, dur) in events_bd:
        pp = p0_pitch if cur_p is None else discrete_gauss(engine.p_coords_f64, mu_p, invp)

        # 声部ごとの音域マスクをかけ、low/mid/high がそれぞれの帯域から選ばれるようにする。
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
            # 同時に鳴る参照音と近すぎる候補を除外する。
            sm = spacing_mask(engine.p_freqs, active_freqs, min_spacing_cents)
            pp2[~sm] = 0.0

        if use_harmony and ref_ij is not None:
            # 低声部の格子位置を基準に、協和的な相対位置を優先する。
            w = consonance_weight(engine.p_coords, ref_ij, tau)
            h = float(np.clip(harmony_strength, 0.0, 1.0))
            pp2 *= ((1.0 - h) + h * w)

        pp2 = normalize_prob(pp2, fallback_mask=voice_mask)
        if first_effective_pitch is None:
            first_effective_pitch = pp2.copy()
        ip = roulette_choice(pp2, rng)

        i, j = map(int, engine.p_coords[ip])
        f = float(engine.p_freqs[ip])
        if velocity_complexity > 0.0:
            # リズムが複雑な時だけ、軽いベロシティ差を付けて平坦さを避ける。
            c = float(np.clip(velocity_complexity, 0.0, 1.0))
            lo = max(1.0, float(vel) * (1.0 - 0.30 * c))
            hi = min(127.0, float(vel) * (1.0 + 0.12 * c))
            vout = float(int(round(rng.uniform(lo, hi))))
        else:
            vout = float(vel)
        out.append((beat, i, j, f, dur, vout))

        cur_p = ip
        mu_p = np.array([float(i), float(j)], dtype=np.float64)

    if first_effective_pitch is None:
        pp2 = np.zeros_like(p0_pitch, dtype=np.float64)
        pp2[voice_mask] = p0_pitch[voice_mask]
        first_effective_pitch = normalize_prob(pp2, fallback_mask=voice_mask)

    return out, cur_p, first_effective_pitch, sp


def sample_bar_3line_indep_harmony(
    engine: Engine,
    bar_id: int,
    beats_per_bar: int,
    params: dict[str, Any],
    last_p_list,
    last_r_list,
):
    """1 小節ぶんの low / mid / high をまとめて生成する。

    生成順序は low -> mid -> high。
    mid は low を参照し、high は low と mid を参照するため、
    低声部を土台にした 3 声部の関係が作られる。
    """
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
    voice_decorrelation = float(params["voice_decorrelation"])
    rhy_complexity = rhythm_complexity(sigma_rhythm, rhythm_disrupt_max)

    rng0 = engine.rngs[0]
    # low: 和声参照なし。小節の土台になる声部。
    ev_bd_l, last_r2_l, p0r_l, sr_l = sample_rhythm_bar(
        engine,
        beats_per_bar,
        0,
        sigma_rhythm,
        rhythm_disrupt_max,
        voice_decorrelation,
        max_events,
        last_r_list[0],
        rng0,
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
        velocity_complexity=rhy_complexity,
    )

    rng1 = engine.rngs[1]
    # mid: low の同時発音を参照し、間隔と協和度を調整する。
    ev_bd_m, last_r2_m, p0r_m, sr_m = sample_rhythm_bar(
        engine,
        beats_per_bar,
        1,
        sigma_rhythm,
        rhythm_disrupt_max,
        voice_decorrelation,
        max_events,
        last_r_list[1],
        rng1,
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
        velocity_complexity=rhy_complexity,
    )

    rng2 = engine.rngs[2]
    # high: low と mid の両方を参照し、上声部として配置する。
    ev_bd_h, last_r2_h, p0r_h, sr_h = sample_rhythm_bar(
        engine,
        beats_per_bar,
        2,
        sigma_rhythm,
        rhythm_disrupt_max,
        voice_decorrelation,
        max_events,
        last_r_list[2],
        rng2,
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
        velocity_complexity=rhy_complexity,
    )

    voice_events = [ev_l, ev_m, ev_h]
    voice_events = [legato_voice_events(events, beats_per_bar) for events in voice_events]
    last_p2_list = [last_p2_l, last_p2_m, last_p2_h]
    last_r2_list = [last_r2_l, last_r2_m, last_r2_h]
    p0p_list = [p0p_l, p0p_m, p0p_h]
    p0r_list = [p0r_l, p0r_m, p0r_h]
    sp_list = [sp_l, sp_m, sp_h]
    sr_list = [sr_l, sr_m, sr_h]

    return voice_events, last_p2_list, last_r2_list, p0p_list, p0r_list, sp_list, sr_list


def clamp_param(name: str, raw_val: Any) -> Any:
    """外部入力を PARAM_RULES の範囲に丸める。"""
    if name not in PARAM_RULES:
        raise KeyError(name)
    typ, lo, hi = PARAM_RULES[name]
    v = float(raw_val)
    v = float(np.clip(v, lo, hi))
    if typ is int:
        return int(round(v))
    return float(v)


def apply_param(name: str, raw_val: Any) -> Any:
    """パラメータを状態へ反映する。seed_base だけは乱数系列を作り直す。"""
    v = clamp_param(name, raw_val)
    with state.lock:
        state.params[name] = v
        if name == "seed_base":
            state.engine._reseed_rngs(int(v))
    return v


def complexity_to_params(raw_val: Any) -> tuple[float, dict[str, Any]]:
    """0..1 の complexity macro を既存パラメータ群に展開する。"""
    c = float(np.clip(float(raw_val), 0.0, 1.0))
    anchors = COMPLEXITY_ANCHORS

    lo_x, lo_vals = anchors[0]
    hi_x, hi_vals = anchors[-1]
    for idx in range(len(anchors) - 1):
        cur_x, cur_vals = anchors[idx]
        nxt_x, nxt_vals = anchors[idx + 1]
        if cur_x <= c <= nxt_x:
            lo_x, lo_vals = cur_x, cur_vals
            hi_x, hi_vals = nxt_x, nxt_vals
            break

    if hi_x <= lo_x:
        t = 0.0
    else:
        t = (c - lo_x) / (hi_x - lo_x)

    out: dict[str, Any] = {}
    for name in lo_vals:
        v = float(lo_vals[name]) + (float(hi_vals[name]) - float(lo_vals[name])) * t
        out[name] = clamp_param(name, v)
    return c, out


def apply_complexity_macro(raw_val: Any) -> tuple[float, dict[str, Any]]:
    """complexity macro を現在状態へ反映する。個別パラメータは後から上書きできる。"""
    c, updates = complexity_to_params(raw_val)
    with state.lock:
        for name, val in updates.items():
            state.params[name] = val
    return c, updates


def send_macro_state(name: str, value: Any) -> None:
    """Max 側 UI 表示用に、macro の clamp 後の値を返す。"""
    client.send_message(f"/macro_state/{name}", value)


def send_param_state(name: str, value: Any) -> None:
    """Max 側 UI 表示用に、Python 内部で確定した parameter 値を返す。"""
    client.send_message(f"/param_state/{name}", value)


def send_param_states(updates: dict[str, Any]) -> None:
    for name, value in updates.items():
        send_param_state(name, value)


# ---------------- OSC ハンドラ ----------------
def on_hello(address, *args):
    """Max からの接続確認。格子情報も強制送信して表示側を初期化する。"""
    send_grid_if_changed(force=True)
    send_m4l_status("hello")
    client.send_message("/ack", "hello")


def on_grid_now(address, *args):
    """Max 側から手動で格子情報を再送してほしい時に使う。"""
    send_grid_if_changed(force=True)
    send_m4l_status("grid_now")
    client.send_message("/ack", "grid_now")


def on_param(address, *args):
    """Max の /param/<name> 入力を受け取り、現在パラメータを更新する。"""
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
        if name == "tempo":
            # tempo は Python で clamp した値を Max の transport に戻す。
            client.send_message("/tempo", float(v))
        client.send_message("/ack", f"param:{name}={v}")
    except Exception as e:
        client.send_message("/ack", f"param_error:{type(e).__name__}")
        log("on_param error:", e)


def on_macro(address, *args):
    """上位 macro 入力。今は /macro/complexity だけを受ける。"""
    try:
        if not args:
            client.send_message("/ack", "macro_error:missing_value")
            return
        name = address.split("/", 2)[-1]
        if name.startswith("macro/"):
            name = name.split("/", 1)[1]
        if name != "complexity":
            client.send_message("/ack", f"macro_error:unknown:{name}")
            return
        c, updates = apply_complexity_macro(args[0])
        if "tempo" in updates:
            client.send_message("/tempo", float(updates["tempo"]))
        send_macro_state("complexity", c)
        send_param_states(updates)
        client.send_message("/ack", f"macro:complexity={c:.3f}")
    except Exception as e:
        client.send_message("/ack", f"macro_error:{type(e).__name__}")
        log("on_macro error:", e)


class PullArgError(ValueError):
    """Max から来た /pull 引数の検証エラー。"""

    pass


def parse_pull_args(args):
    """OSC の /pull payload を bar_id と beats_per_bar に変換する。"""
    if len(args) < 2:
        raise PullArgError("missing_args")
    try:
        bar_id = int(args[0])
        beats_per_bar = int(args[1])
    except (TypeError, ValueError):
        raise PullArgError("invalid_args") from None
    beats_per_bar = int(np.clip(beats_per_bar, 1, 32))
    return bar_id, beats_per_bar


def on_pull(address, *args):
    """1 小節ぶんの生成要求。

    この関数がリアルタイム生成の中心。
    Max の qmetro などから周期的に呼ばれ、現在パラメータで次の小節を生成して返す。
    """
    try:
        bar_id, bpb = parse_pull_args(args)
        send_grid_if_changed(False)

        with state.lock:
            # 生成中に Max からパラメータ変更が来ても、この小節はスナップショットで固定する。
            params = dict(state.params)
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
        ) = sample_bar_3line_indep_harmony(engine, bar_id, bpb, params, last_p_list, last_r_list)

        # 3 声部それぞれを専用 OSC ルートに送る。
        # payload 形式: [bar, beat, i, j, freq_hz, dur_beat, vel, ...]
        voice_payloads = []
        for v in range(VOICE_COUNT):
            payload = [bar_id]
            for (beat, i, j, f, dur, vel) in voice_events[v]:
                payload += [float(beat), int(i), int(j), float(f), float(dur), float(vel)]
            voice_payloads.append(payload)
            client.send_message(ADDR_MAP[v], payload)
            send_m4l_sequence(ADDR_MAP[v], payload)

        # 旧 patch 互換のため、mid 声部を /seq としても送る。
        mid_payload = voice_payloads[1]
        client.send_message("/seq", mid_payload)

        chord_payload = chord_payload_for_bar(
            bar_id,
            voice_events,
            bpb,
            float(params["tempo"]),
            int(params["vel"]),
        )
        if chord_payload:
            client.send_message("/chord", chord_payload)

        pad_payload = pad_payload_for_bar(
            bar_id,
            voice_events[0],
            bpb,
            int(params["vel"]),
        )
        if pad_payload:
            send_m4l_sequence("/pad", pad_payload)

        if int(params["send_pdf"]) == 1:
            # 可視化用の確率分布。/pdf は mid、/pdf_low と /pdf_high は各声部専用。
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

        # /stat は Max 側の簡易表示用。H は mid 声部の音高分布エントロピー。
        h = float(-(p0p_list[1] * np.log(p0p_list[1] + 1e-12)).sum())
        client.send_message("/stat", [float(h), float(sp_list[1]), float(params["rho"])])

        with state.lock:
            # 次小節の連続性のため、最後に選ばれた格子位置を保存する。
            state.last_pitch_idx = list(last_p2_list)
            state.last_rhy_idx = list(last_r2_list)

    except PullArgError as e:
        client.send_message("/ack", f"pull_error:{e}")
    except Exception as e:
        client.send_message("/ack", f"pull_error:{type(e).__name__}")
        log("on_pull error:", e)


# ---------------- OSC サーバー起動 ----------------
def osc_server():
    """python-osc の Dispatcher に、このシステムで使う OSC ルートを登録する。"""
    disp = Dispatcher()
    disp.map("/hello", on_hello)
    disp.map("/pull", on_pull)
    disp.map("/grid_now", on_grid_now)
    disp.map("/param/*", on_param)
    disp.map("/macro/*", on_macro)

    server = BlockingOSCUDPServer((PY_HOST, PY_PORT), disp)
    print(f"[PythonOSC] listening on {PY_HOST}:{PY_PORT}")
    print(f"[PythonOSC] listening on {M4L_HOST}:{M4L_PORT}")
    server.serve_forever()



if __name__ == "__main__":
    t = threading.Thread(target=osc_server, daemon=True)
    t.start()
    try:
        while True:
            time.sleep(1.0)
    except KeyboardInterrupt:
        print("bye")
