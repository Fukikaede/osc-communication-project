# OSC Communication Project (Max + Python)

此專案提供 Max + Python 的即時 OSC 生成系統，現在已改為「全參數獨立控制」（不使用 entropy 總控）。

## Project Structure

```text
osc-communication-project/
├─ README.md
├─ requirements.txt
├─ docs/
│  └─ architecture.md
├─ src/
│  └─ entropy_lattice_server.py
├─ tests/
│  └─ test_server_params.py
└─ max/
   ├─ OSC_communication.maxpat
   └─ OSC_param_control.maxpat
```

## Core Roles

- `max/OSC_communication.maxpat`
  - 主播放/視覺化 patch（grid、pdf、stat、audio）
- `max/OSC_param_control.maxpat`
  - ODOT 參數控制面板（`o.pack /param/*`、`o.pack /pull`）
- `src/entropy_lattice_server.py`
  - Python OSC 伺服器與三聲部生成引擎

## OSC Ports

- Python -> Max: `127.0.0.1:8000`
- Max -> Python: `127.0.0.1:8001`

## Main OSC API

### Max -> Python

- `/hello`
- `/pull <bar_id:int> <beats_per_bar:int>`
- `/grid_now`
- `/param/sigma_pitch <float>`
- `/param/sigma_rhythm <float>`
- `/param/rho <float>`
- `/param/rhythm_disrupt_max <float>`
- `/param/harmony_strength <float>`
- `/param/tau <float>`
- `/param/min_spacing_cents_mid <float>`
- `/param/min_spacing_cents_high <float>`
- `/param/vel <int>`
- `/param/send_pdf <int 0|1>`
- `/param/max_events_per_bar <int>`
- `/param/seed_base <int>`

已移除舊路由：`/entropy`, `/tempo`, `/mode`, `/rho`（舊獨立版）。

### Python -> Max

- `/ack <string>`
- `/grid <imin imax jmin jmax nx ny>`
- `/rgrid <imin imax jmin jmax nx ny>`
- `/seq_low <bar + events...>`
- `/seq_mid <bar + events...>`
- `/seq_high <bar + events...>`
- `/seq <bar + events...>`（backward compatibility，等同 mid）
- `/pdf`, `/rpdf`, `/pdf_low`, `/pdf_high`
- `/stat <H sigma rho>`

每個事件格式：`beat, i, j, freq_hz, dur_beat, vel`

## Quick Start

1. 安裝依賴

```bash
cd /Users/kaede/osc-communication-project
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

2. 啟動 Python server

```bash
python src/entropy_lattice_server.py
```

3. 開啟 Max patch

- 播放/視覺化：`max/OSC_communication.maxpat`
- 參數控制：`max/OSC_param_control.maxpat`

4. 在 `OSC_param_control.maxpat` 中：

- 點 `/hello`、`/grid_now` 按鈕
- 啟動 `qmetro` 觸發 `/pull`
- 調整各 `o.pack /param/*` 參數

## Test

```bash
python3 -m unittest tests/test_server_params.py
```

## Notes

- `OSC_communication.maxpat` 的 route 已同步擴充為：
  `route /grid /rgrid /seq /seq_low /seq_mid /seq_high /pdf /rpdf /pdf_low /pdf_high /stat /ack`
- `send_pdf=0` 時，Python 不再發送 pdf 類路由。

詳細設計見 `docs/architecture.md`。
