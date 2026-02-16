import importlib.util
import pathlib
import unittest


MODULE_PATH = pathlib.Path(__file__).resolve().parents[1] / "src" / "entropy_lattice_server.py"
spec = importlib.util.spec_from_file_location("entropy_lattice_server", MODULE_PATH)
mod = importlib.util.module_from_spec(spec)
spec.loader.exec_module(mod)


class ParamTests(unittest.TestCase):
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


if __name__ == "__main__":
    unittest.main()
