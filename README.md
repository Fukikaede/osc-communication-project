# エントロピー音楽生成システム

本プロジェクトは、Max + Python によるリアルタイム OSC 生成システムです。現在は「全パラメータ独立制御」を基本にしつつ、必要な時だけ `/macro/complexity` で複数パラメータをまとめて動かせます。

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
  - メイン再生・可視化パッチ（grid、pdf、stat、連続 `cycle~` 3 声部、MIDI 和音）
- `max/OSC_param_control.maxpat`
  - ODOT パラメータ制御パネル（`o.pack /param/*`、`o.pack /macro/complexity`、`o.pack /pull`）。Preset 1-12 は性格別 scene 設計で、前半は安定した骨格を保ち、後半で rhythm disrupt と voice decorrelation を段階的に増やします。
- `max/m4l/OSC_MIDI_Recorder.maxpat`
  - Max for Live 用の MIDI 記録 patch（`/seq_low /seq_mid /seq_high /pad` を声部別 Session clip に保存し、採用 take を Arrangement にコピー）
- `src/entropy_lattice_server.py`
  - Python OSC サーバーおよび 3 声部生成エンジン

## OSC ポート

- Python -> Max: `127.0.0.1:8000`
- Max -> Python: `127.0.0.1:8001`
- Python -> Max for Live MIDI recorder: `127.0.0.1:8002`

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
- `/param/tempo <float BPM>`
- `/param/voice_decorrelation <float 0..1>`
- `/macro/complexity <float 0..1>`（音楽的複雑度の総合 macro。`rho`, `vel`, `seed_base`, `send_pdf`, `max_events_per_bar` は変更しません）

旧ルート `/entropy`, `/tempo`, `/mode`, `/rho`（旧独立版）は削除済みです。BPM は `/param/tempo` で指定します。

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
- `/tempo <float BPM>`（Max の `transport` 更新用）
- `/chord <bar low_freq mid_freq high_freq dur_ms vel>`（1 小節 1 回の MIDI 和音）
- `/macro_state/complexity <float>`、`/param_state/<name> <value>`（`OSC_param_control.maxpat` の表示同期用）

各イベント形式：`beat, i, j, freq_hz, dur_beat, vel`

`sigma_rhythm` と `rhythm_disrupt_max` はリズムパターン選択に反映されます。`voice_decorrelation` は既定値 `0.0` で、旧版と同じく 3 声部の小節内骨格を保ちます。`1.0` に近づけると声部間の開始位置ずれ、休符、ゲート長、軽いベロシティ差が加わり、より不安定なテクスチャになります。

Max 側の主音声は `freq_hz -> pipe -> cycle~ -> gain~ -> ezdac~` の連続 3 声部です。MIDI は `/chord` だけを受け、1 小節に 1 回 channel 4 へ柱式和音を出します。

## クイックスタート

1. 依存関係をインストール

```bash
cd /Users/kaede/Codex/osc-communication-project
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
- `macro_complexity` で全体の複雑度をまとめて調整
- 各 `o.pack /param/*` パラメータを調整

## テスト

```bash
python3 -m unittest tests/test_server_params.py
```

## 補足

- `OSC_communication.maxpat` の route は以下に拡張済みです：
  `route /grid /rgrid /seq /seq_low /seq_mid /seq_high /pdf /rpdf /pdf_low /pdf_high /stat /ack /tempo /chord`
- Max for Live で MIDI clip に記録し、Session から Arrangement に commit する手順は `docs/m4l_midi_recorder.md` を参照してください。
- `send_pdf=0` の場合、Python は pdf 系ルートを送信しません。
- `/pull` の引数不足・型不正は `/ack pull_error:...` として返します。
- `/param/tempo` は Python 側で clamp した後、Max 側へ `/tempo` として転送されます。
- `/macro/complexity` は Python 側で 0..1 に clamp し、既存の個別パラメータへ展開します。展開後も `/param/*` で個別に上書きできます。
- macro 展開後、Python は `/param_state/*` を返し、`OSC_param_control.maxpat` は `set $1` で UI 表示だけを更新します。

詳細設計は `docs/architecture.md` を参照してください。
