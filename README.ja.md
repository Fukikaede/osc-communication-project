# OSC Communication Project (Max + Python) 日本語版

このプロジェクトは、Max と Python を使ったリアルタイム OSC 音楽生成システムです。  
現在は「全パラメータ独立制御」方式で動作し、`entropy` による一括制御は使いません。

## 構成

```text
osc-communication-project/
├─ README.md
├─ README.ja.md
├─ requirements.txt
├─ docs/
│  ├─ architecture.md
│  └─ work_intro_ja.md
├─ src/
│  └─ entropy_lattice_server.py
├─ tests/
│  └─ test_server_params.py
└─ max/
   ├─ OSC_communication.maxpat
   └─ OSC_param_control.maxpat
```

## 各ファイルの役割

- `max/OSC_communication.maxpat`
  - 再生・可視化用パッチ（grid / pdf / stat / audio）
- `max/OSC_param_control.maxpat`
  - ODOT ベースのパラメータ操作パッチ（`o.pack /param/*`, `o.pack /pull`）
- `src/entropy_lattice_server.py`
  - Python 側 OSC サーバーと 3 声部生成エンジン

## OSC ポート

- Python -> Max: `127.0.0.1:8000`
- Max -> Python: `127.0.0.1:8001`

## OSC API

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

削除済み旧ルート：`/entropy`, `/tempo`, `/mode`, `/rho`（旧単独ルート）。

### Python -> Max

- `/ack <string>`
- `/grid <imin imax jmin jmax nx ny>`
- `/rgrid <imin imax jmin jmax nx ny>`
- `/seq_low <bar + events...>`
- `/seq_mid <bar + events...>`
- `/seq_high <bar + events...>`
- `/seq <bar + events...>`（後方互換、mid と同等）
- `/pdf`, `/rpdf`, `/pdf_low`, `/pdf_high`
- `/stat <H sigma rho>`

イベント 1 件の形式：`beat, i, j, freq_hz, dur_beat, vel`

## クイックスタート

1. 依存をインストール

```bash
cd /Users/kaede/osc-communication-project
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

2. Python サーバー起動

```bash
python src/entropy_lattice_server.py
```

3. Max パッチを開く

- 再生・可視化：`max/OSC_communication.maxpat`
- パラメータ制御：`max/OSC_param_control.maxpat`

4. `OSC_param_control.maxpat` 側で

- `/hello` と `/grid_now` を送信
- `qmetro` を ON にして `/pull` を周期送信
- 各 `o.pack /param/*` で音響パラメータを調整

## テスト

```bash
python3 -m unittest tests/test_server_params.py
```

## 補足

- `OSC_communication.maxpat` の route は以下に統一済みです。  
  `route /grid /rgrid /seq /seq_low /seq_mid /seq_high /pdf /rpdf /pdf_low /pdf_high /stat /ack`
- `send_pdf=0` の場合、Python は pdf 系ルートを送信しません。
- システム概要は `docs/architecture.md`、ワーク紹介は `docs/work_intro_ja.md` を参照してください。
