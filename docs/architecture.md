# Architecture Overview

## 1. High-Level

```text
Max patch (OSC_param_control.maxpat)
  ├─ Parameter UI: number/flonum -> o.pack /param/*
  ├─ Macro UI    : macro_complexity -> o.pack /macro/complexity
  ├─ State Sync  : /macro_state/*, /param_state/* -> set $1 -> UI only
  ├─ Manual pull  : button -> counter -> o.pack /pull
  ├─ Presets      : 12 character scenes; early scenes stay stable, late scenes add rhythm disrupt and voice decorrelation
  ├─ Network Out  : udpsend 127.0.0.1:8001
  └─ Network In   : udpreceive 8000 -> o.route ... -> print / UI sync

Max patch (OSC_communication.maxpat)
  ├─ Playback/visualization
  ├─ route /grid /rgrid /seq /seq_low /seq_mid /seq_high /pdf /rpdf /pdf_low /pdf_high /stat /ack /tempo /chord
  ├─ main audio chain (freq -> pipe -> cycle~ -> gain~ -> ezdac~)
  └─ MIDI chord chain (/chord -> ftom -> makenote -> noteout, ch 4)

Python server (entropy_lattice_server.py)
  ├─ OSC In  : /hello, /pull, /grid_now, /param/*, /macro/*
  ├─ State   : independent parameter store + last indices
  ├─ Sampler : rhythm lattice + pitch lattice + harmony constraints
  └─ OSC Out : /ack, /grid, /rgrid, /seq*, /pdf*, /stat, /tempo, /chord, /macro_state*, /param_state*
```

## 2. Control Model

系統以全參數獨立控制為基本。`/macro/complexity` 是追加的上位 macro，會把 0..1 的值展開到複数個既存參數。

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
- `tempo`
- `voice_decorrelation`

Macro `complexity` 會更新：

- `sigma_pitch`
- `sigma_rhythm`
- `rhythm_disrupt_max`
- `harmony_strength`
- `tau`
- `min_spacing_cents_mid`
- `min_spacing_cents_high`
- `tempo`
- `voice_decorrelation`

Macro 不會更新 `rho`, `vel`, `seed_base`, `send_pdf`, `max_events_per_bar`，這些仍作為個別調整保留。

## 3. Data Flow (Per Pull)

1. Max 發送 `/pull bar_id beats_per_bar`。
2. Python 讀取當前參數。若之前收到 `/macro/complexity`，該 macro 已被展開成既存參數。
3. 生成 low -> mid -> high 三聲部事件；`sigma_rhythm` 與 `rhythm_disrupt_max` 控制節奏型選擇。`voice_decorrelation` 預設為 `0.0`，保留舊版小節內平均骨架；提高到 `1.0` 時才增加聲部錯位、休符、gate 變化與輕微 velocity 差異。
4. Python 回傳 `/seq_low /seq_mid /seq_high` 與相容 `/seq`，驅動 Max 端連續 `cycle~` 三聲部。
5. 視 `send_pdf` 決定是否回傳 `/pdf*`。
6. 回傳 `/stat`（H, sigma, rho）。
7. Max 發送 `/param/tempo` 時，Python clamp 後回傳 `/tempo` 供 Max `transport` 更新 BPM。
8. Python 另外回傳 `/chord`，Max 每小節一次輸出 MIDI 柱式和音作為伴奏。
9. Max 發送 `/macro/complexity` 時，Python 展開參數後回傳 `/macro_state/complexity` 與 `/param_state/*`，控制 patch 只更新 UI 顯示，不重新送出 `/param/*`。

## 4. ODOT Usage Notes

- `o.pack`：將 Max 值綁定到指定 OSC 地址並輸出 FullPacket（左 inlet 觸發）。
- `o.route`：按 OSC 地址分派資料，並移除匹配到的地址前綴。
- 本專案控制 patch 採一參數一個 `o.pack /param/<name>`，便於除錯與單獨調參。
- `o.pack /macro/complexity` 只送一個總控值；Python 端負責曲線展開，展開後仍可用 `/param/*` 微調。
- `/param_state/*` 走 `set $1` 訊息更新 number/flonum，因此不會造成 OSC 回送迴圈。

## 5. Compatibility

- 保留 `/seq`（mid 的相容輸出）避免舊鏈路中斷。
- 舊輸入路由 `/entropy`, `/tempo`, `/mode`, `/rho`（獨立）已移除；tempo 改由 `/param/tempo` 管理。

## 6. Testing

- `tests/test_server_params.py` 覆蓋：
  - 參數 clamp
  - `seed_base` 重播種
  - 舊路由移除檢查
