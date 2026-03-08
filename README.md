# エントロピー音楽生成システム

本プロジェクトは、Max + Python によるリアルタイム OSC 生成システムです。現在は「全パラメータ独立制御」方式（entropy の単一総合制御は不使用）で動作します。

## プロジェクト構成

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

## 主要コンポーネント

- `max/OSC_communication.maxpat`
  - メイン再生・可視化パッチ（grid、pdf、stat、audio）
- `max/OSC_param_control.maxpat`
  - ODOT パラメータ制御パネル（`o.pack /param/*`、`o.pack /pull`）
- `src/entropy_lattice_server.py`
  - Python OSC サーバーおよび 3 声部生成エンジン

## OSC ポート

- Python -> Max: `127.0.0.1:8000`
- Max -> Python: `127.0.0.1:8001`

## 主な OSC API

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

旧ルート `/entropy`, `/tempo`, `/mode`, `/rho`（旧独立版）は削除済みです。

### Python -> Max

- `/ack <string>`
- `/grid <imin imax jmin jmax nx ny>`
- `/rgrid <imin imax jmin jmax nx ny>`
- `/seq_low <bar + events...>`
- `/seq_mid <bar + events...>`
- `/seq_high <bar + events...>`
- `/seq <bar + events...>`（後方互換、`mid` と同等）
- `/pdf`, `/rpdf`, `/pdf_low`, `/pdf_high`
- `/stat <H sigma rho>`

各イベント形式：`beat, i, j, freq_hz, dur_beat, vel`

## クイックスタート

1. 依存関係をインストール

```bash
cd /Users/kaede/osc-communication-project
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

2. Python サーバーを起動

```bash
python src/entropy_lattice_server.py
```

3. Max パッチを開く

- 再生・可視化：`max/OSC_communication.maxpat`
- パラメータ制御：`max/OSC_param_control.maxpat`

4. `OSC_param_control.maxpat` で以下を実行

- `/hello` と `/grid_now` を送信
- `qmetro` を起動して `/pull` をトリガー
- 各 `o.pack /param/*` パラメータを調整

## テスト

```bash
python3 -m unittest tests/test_server_params.py
```

## 補足

- `OSC_communication.maxpat` の route は以下に拡張済みです：
  `route /grid /rgrid /seq /seq_low /seq_mid /seq_high /pdf /rpdf /pdf_low /pdf_high /stat /ack`
- `send_pdf=0` の場合、Python は pdf 系ルートを送信しません。

詳細設計は `docs/architecture.md` を参照してください。
