import importlib.util
import pathlib
import unittest


MODULE_PATH = pathlib.Path(__file__).resolve().parents[1] / "src" / "entropy_lattice_server.py"
spec = importlib.util.spec_from_file_location("entropy_lattice_server", MODULE_PATH)
mod = importlib.util.module_from_spec(spec)
spec.loader.exec_module(mod)


class CaptureClient:
    def __init__(self):
        self.messages = []

    def send_message(self, address, payload):
        self.messages.append((address, payload))


class ParamTests(unittest.TestCase):
    def setUp(self):
        self.old_client = mod.client
        self.old_m4l_client = mod.m4l_client
        self.capture_client = CaptureClient()
        self.capture_m4l_client = CaptureClient()
        mod.client = self.capture_client
        mod.m4l_client = self.capture_m4l_client

        with mod.state.lock:
            self.old_params = dict(mod.state.params)
            self.old_last_pitch_idx = list(mod.state.last_pitch_idx)
            self.old_last_rhy_idx = list(mod.state.last_rhy_idx)
            self.old_last_grid = mod.state.last_grid
            self.old_last_rgrid = mod.state.last_rgrid

    def tearDown(self):
        with mod.state.lock:
            mod.state.params.clear()
            mod.state.params.update(self.old_params)
            mod.state.last_pitch_idx = list(self.old_last_pitch_idx)
            mod.state.last_rhy_idx = list(self.old_last_rhy_idx)
            mod.state.last_grid = self.old_last_grid
            mod.state.last_rgrid = self.old_last_rgrid
            mod.state.engine._reseed_rngs(int(mod.state.params["seed_base"]))
        mod.client = self.old_client
        mod.m4l_client = self.old_m4l_client

    def test_clamp_float(self):
        self.assertEqual(mod.clamp_param("sigma_pitch", -1.0), 0.05)
        self.assertEqual(mod.clamp_param("sigma_pitch", 9.0), 4.0)

    def test_clamp_int(self):
        self.assertEqual(mod.clamp_param("vel", -100), 1)
        self.assertEqual(mod.clamp_param("vel", 999), 127)

    def test_seed_reseed(self):
        old = mod.state.params["seed_base"]
        try:
            v = mod.apply_param("seed_base", 777)
            self.assertEqual(v, 777)
            self.assertEqual(mod.state.params["seed_base"], 777)
            self.assertEqual(len(mod.state.engine.rngs), 3)
        finally:
            mod.apply_param("seed_base", old)

    def test_removed_routes_not_mapped(self):
        text = MODULE_PATH.read_text(encoding="utf-8")
        self.assertNotIn('disp.map("/entropy"', text)
        self.assertNotIn('disp.map("/tempo"', text)
        self.assertNotIn('disp.map("/mode"', text)
        self.assertNotIn('disp.map("/rho"', text)
        self.assertIn('disp.map("/param/*"', text)
        self.assertIn('disp.map("/macro/*"', text)

    def test_on_param_unknown(self):
        mod.on_param("/param/not_exist", 1)
        self.assertIn(("/ack", "param_error:unknown:not_exist"), self.capture_client.messages)

    def test_on_param_missing_value(self):
        mod.on_param("/param/sigma_pitch")
        self.assertIn(("/ack", "param_error:missing_value"), self.capture_client.messages)

    def test_on_param_applies_clamp_and_ack(self):
        mod.on_param("/param/vel", 999)
        self.assertEqual(mod.state.params["vel"], 127)
        self.assertIn(("/ack", "param:vel=127"), self.capture_client.messages)

    def test_on_param_tempo_clamps_and_forwards_to_max(self):
        mod.on_param("/param/tempo", 999)
        self.assertEqual(mod.state.params["tempo"], 300.0)
        self.assertIn(("/tempo", 300.0), self.capture_client.messages)
        self.assertIn(("/ack", "param:tempo=300.0"), self.capture_client.messages)

    def test_complexity_macro_clamps_and_expands_params(self):
        c_low, low = mod.complexity_to_params(-1)
        c_high, high = mod.complexity_to_params(2)

        self.assertEqual(c_low, 0.0)
        self.assertEqual(c_high, 1.0)
        self.assertEqual(low["sigma_pitch"], 0.18)
        self.assertEqual(low["voice_decorrelation"], 0.0)
        self.assertEqual(high["rhythm_disrupt_max"], 0.86)
        self.assertEqual(high["voice_decorrelation"], 0.65)
        self.assertNotIn("rho", high)
        self.assertNotIn("seed_base", high)

    def test_on_macro_complexity_applies_bundle_and_forwards_tempo(self):
        mod.apply_param("rho", 0.77)

        mod.on_macro("/macro/complexity", 0.8)

        self.assertEqual(mod.state.params["sigma_pitch"], 1.75)
        self.assertEqual(mod.state.params["sigma_rhythm"], 1.7)
        self.assertEqual(mod.state.params["rhythm_disrupt_max"], 0.46)
        self.assertEqual(mod.state.params["voice_decorrelation"], 0.18)
        self.assertEqual(mod.state.params["rho"], 0.77)
        self.assertIn(("/tempo", 158.0), self.capture_client.messages)
        self.assertIn(("/macro_state/complexity", 0.8), self.capture_client.messages)
        self.assertIn(("/param_state/sigma_pitch", 1.75), self.capture_client.messages)
        self.assertIn(("/param_state/voice_decorrelation", 0.18), self.capture_client.messages)
        self.assertIn(("/ack", "macro:complexity=0.800"), self.capture_client.messages)

    def test_on_macro_rejects_missing_or_unknown(self):
        mod.on_macro("/macro/complexity")
        mod.on_macro("/macro/unknown", 0.5)

        self.assertIn(("/ack", "macro_error:missing_value"), self.capture_client.messages)
        self.assertIn(("/ack", "macro_error:unknown:unknown"), self.capture_client.messages)

    def test_on_hello_sends_m4l_status_probe(self):
        mod.on_hello("/hello")

        self.assertIn(("/ack", "hello"), self.capture_client.messages)
        self.assertIn(("/m4l_status", "hello"), self.capture_m4l_client.messages)

    def test_on_pull_send_pdf_toggle(self):
        mod.apply_param("seed_base", 1234)
        mod.apply_param("send_pdf", 0)
        mod.on_pull("/pull", 7, 4)

        addresses = [addr for addr, _ in self.capture_client.messages]
        for route in ("/seq_low", "/seq_mid", "/seq_high", "/seq", "/stat"):
            self.assertIn(route, addresses)
        self.assertIn("/chord", addresses)
        for route in ("/pdf", "/rpdf", "/pdf_low", "/pdf_high"):
            self.assertNotIn(route, addresses)
        self.assertFalse(
            any(msg == ("/ack", "pull_error:TypeError") for msg in self.capture_client.messages),
            "on_pull should not raise and emit pull_error ACK",
        )

    def test_on_pull_mirrors_all_voice_sequences_to_m4l_port(self):
        mod.apply_param("seed_base", 42)
        mod.apply_param("send_pdf", 0)
        mod.on_pull("/pull", 2, 4)

        for route in ("/seq_low", "/seq_mid", "/seq_high"):
            self.assertIn((route, self._message_payload(route)), self.capture_m4l_client.messages)

    def test_on_pull_sends_pad_payload_to_m4l_port(self):
        mod.apply_param("seed_base", 42)
        mod.apply_param("send_pdf", 0)
        mod.apply_param("vel", 100)
        mod.on_pull("/pull", 3, 4)

        pad_payload = self._m4l_message_payload("/pad")
        low_events = self._sequence_events(self._message_payload("/seq_low"))
        self.assertEqual(pad_payload[0], 3)
        self.assertEqual(pad_payload[1], low_events[0][3])
        self.assertEqual(pad_payload[2], 4.0)
        self.assertEqual(pad_payload[3], 65)

    def test_on_pull_missing_args(self):
        mod.on_pull("/pull", 7)
        self.assertIn(("/ack", "pull_error:missing_args"), self.capture_client.messages)

    def test_on_pull_invalid_args(self):
        mod.on_pull("/pull", "bar", 4)
        self.assertIn(("/ack", "pull_error:invalid_args"), self.capture_client.messages)

    def test_on_pull_clamps_beats_per_bar(self):
        mod.on_pull("/pull", 1, 0)
        self.assertEqual(mod.state.beats_per_bar, 1)
        addresses = [addr for addr, _ in self.capture_client.messages]
        self.assertIn("/seq_mid", addresses)

    def test_on_pull_events_stay_inside_short_bars(self):
        for beats_per_bar in (1, 2, 3):
            with self.subTest(beats_per_bar=beats_per_bar):
                self.capture_client.messages.clear()
                mod.apply_param("seed_base", 42)
                mod.apply_param("send_pdf", 0)
                mod.on_pull("/pull", 1, beats_per_bar)

                for route in ("/seq_low", "/seq_mid", "/seq_high"):
                    payload = self._message_payload(route)
                    events = self._sequence_events(payload)
                    self.assertTrue(events)
                    for beat, _i, _j, _freq, dur, _vel in events:
                        self.assertGreater(dur, 0.0)
                        self.assertGreaterEqual(beat, 0.0)
                        self.assertLessEqual(beat + dur, float(beats_per_bar) + 1e-9)

    def test_voice_pdfs_are_voice_specific(self):
        mod.apply_param("seed_base", 42)
        mod.apply_param("send_pdf", 1)
        mod.on_pull("/pull", 1, 4)

        route_to_mask = {
            "/pdf_low": mod.state.engine.voice_pmask[0],
            "/pdf": mod.state.engine.voice_pmask[1],
            "/pdf_high": mod.state.engine.voice_pmask[2],
        }
        pdfs = {}
        for route, mask in route_to_mask.items():
            vals = self._pitch_pdf_values(self._message_payload(route))
            pdfs[route] = vals
            inside = sum(v for v, is_inside in zip(vals, mask) if is_inside)
            outside = sum(v for v, is_inside in zip(vals, mask) if not is_inside)
            self.assertAlmostEqual(inside, 1.0, places=6)
            self.assertAlmostEqual(outside, 0.0, places=6)

        self.assertNotEqual(pdfs["/pdf_low"], pdfs["/pdf"])
        self.assertNotEqual(pdfs["/pdf_high"], pdfs["/pdf"])

    def test_sigma_rhythm_shapes_pattern_weights(self):
        low_sigma = mod.rhythm_pattern_weights(0.05, 0.35, None)
        default_sigma = mod.rhythm_pattern_weights(1.0, 0.35, None)
        high_sigma = mod.rhythm_pattern_weights(4.0, 0.35, None)

        self.assertGreater(low_sigma[0], default_sigma[0])
        self.assertLess(high_sigma[0], default_sigma[0])

    def test_high_rhythm_complexity_decorrelates_voice_onsets(self):
        mod.apply_param("seed_base", 42)
        mod.apply_param("send_pdf", 0)
        mod.apply_param("sigma_rhythm", 4.0)
        mod.apply_param("rhythm_disrupt_max", 0.95)
        mod.apply_param("voice_decorrelation", 1.0)
        mod.on_pull("/pull", 1, 4)

        first_beats = []
        event_counts = []
        for route in ("/seq_low", "/seq_mid", "/seq_high"):
            events = self._sequence_events(self._message_payload(route))
            self.assertTrue(events)
            first_beats.append(events[0][0])
            event_counts.append(len(events))

        self.assertGreater(len(set(first_beats)), 1)
        self.assertGreater(len(set(event_counts)), 1)

    def test_default_voice_decorrelation_keeps_old_bar_skeleton(self):
        mod.apply_param("seed_base", 42)
        mod.apply_param("send_pdf", 0)
        mod.apply_param("sigma_rhythm", 4.0)
        mod.apply_param("rhythm_disrupt_max", 0.95)
        mod.apply_param("voice_decorrelation", 0.0)
        mod.on_pull("/pull", 1, 4)

        for route in ("/seq_low", "/seq_mid", "/seq_high"):
            events = self._sequence_events(self._message_payload(route))
            self.assertEqual(events[0][0], 0.0)
            self.assertEqual(len(events), 4)

    def test_voice_events_are_legato_to_next_event(self):
        mod.apply_param("seed_base", 42)
        mod.apply_param("send_pdf", 0)
        mod.apply_param("sigma_rhythm", 1.0)
        mod.apply_param("rhythm_disrupt_max", 0.0)
        mod.on_pull("/pull", 1, 4)

        for route in ("/seq_low", "/seq_mid", "/seq_high"):
            events = self._sequence_events(self._message_payload(route))
            self.assertGreaterEqual(len(events), 2)
            for idx, event in enumerate(events[:-1]):
                beat = event[0]
                dur = event[4]
                next_beat = events[idx + 1][0]
                self.assertGreaterEqual(beat + dur + 1e-9, next_beat)

    def test_chord_payload_is_one_bar_midi_accompaniment(self):
        mod.apply_param("seed_base", 42)
        mod.apply_param("send_pdf", 0)
        mod.apply_param("tempo", 120.0)
        mod.apply_param("vel", 100)
        mod.on_pull("/pull", 1, 4)

        payload = self._message_payload("/chord")
        self.assertEqual(payload[0], 1)
        self.assertEqual(len(payload), 6)
        self.assertGreater(payload[1], 0.0)
        self.assertGreater(payload[2], 0.0)
        self.assertGreater(payload[3], 0.0)
        self.assertAlmostEqual(payload[4], 2000.0)
        self.assertEqual(payload[5], 80)

    def _message_payload(self, route):
        for addr, payload in self.capture_client.messages:
            if addr == route:
                return payload
        self.fail(f"missing OSC route {route}")

    def _m4l_message_payload(self, route):
        for addr, payload in self.capture_m4l_client.messages:
            if addr == route:
                return payload
        self.fail(f"missing M4L OSC route {route}")

    def _sequence_events(self, payload):
        return [payload[i : i + 6] for i in range(1, len(payload), 6)]

    def _pitch_pdf_values(self, payload):
        xmin, xmax, ymin, ymax = [int(x) for x in payload[:4]]
        ny = ymax - ymin + 1
        flat = payload[4:]
        vals = []
        for i, j in mod.state.engine.p_coords:
            row = int(i) - xmin
            col = int(j) - ymin
            vals.append(float(flat[row * ny + col]))
        return vals


if __name__ == "__main__":
    unittest.main()
