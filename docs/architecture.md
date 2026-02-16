# Architecture Overview

## 1. High-Level

```text
Max patch (OSC_param_control.maxpat)
  ├─ Parameter UI: number/flonum -> o.pack /param/*
  ├─ Pull loop    : qmetro -> counter -> o.pack /pull
  ├─ Network Out  : udpsend 127.0.0.1:8001
  └─ Network In   : udpreceive 8000 -> o.route ... -> print

Max patch (OSC_communication.maxpat)
  ├─ Playback/visualization
  ├─ route /grid /rgrid /seq /seq_low /seq_mid /seq_high /pdf /rpdf /pdf_low /pdf_high /stat /ack
  └─ audio chain (cycle~/line~/gain~/ezdac~)

Python server (entropy_lattice_server.py)
  ├─ OSC In  : /hello, /pull, /grid_now, /param/*
  ├─ State   : independent parameter store + last indices
  ├─ Sampler : rhythm lattice + pitch lattice + harmony constraints
  └─ OSC Out : /ack, /grid, /rgrid, /seq*, /pdf*, /stat
```

## 2. Control Model

系統已移除 entropy 總控，改為全參數獨立控制。

可控參數（Python 端 `state.params`）：

- `sigma_pitch`
- `sigma_rhythm`
- `rho`
- `rhythm_disrupt_max`
- `harmony_strength`
- `tau`
- `min_spacing_cents_mid`
- `min_spacing_cents_high`
- `vel`
- `send_pdf`
- `max_events_per_bar`
- `seed_base`

## 3. Data Flow (Per Pull)

1. Max 發送 `/pull bar_id beats_per_bar`。
2. Python 讀取當前參數（不經 entropy 映射）。
3. 生成 low -> mid -> high 三聲部事件。
4. Python 回傳 `/seq_low /seq_mid /seq_high` 與相容 `/seq`。
5. 視 `send_pdf` 決定是否回傳 `/pdf*`。
6. 回傳 `/stat`（H, sigma, rho）。

## 4. ODOT Usage Notes

- `o.pack`：將 Max 值綁定到指定 OSC 地址並輸出 FullPacket（左 inlet 觸發）。
- `o.route`：按 OSC 地址分派資料，並移除匹配到的地址前綴。
- 本專案控制 patch 採一參數一個 `o.pack /param/<name>`，便於除錯與單獨調參。

## 5. Compatibility

- 保留 `/seq`（mid 的相容輸出）避免舊鏈路中斷。
- 舊輸入路由 `/entropy`, `/tempo`, `/mode`, `/rho`（獨立）已移除。

## 6. Testing

- `tests/test_server_params.py` 覆蓋：
  - 參數 clamp
  - `seed_base` 重播種
  - 舊路由移除檢查
