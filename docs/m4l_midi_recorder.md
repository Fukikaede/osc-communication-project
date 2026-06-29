# Max for Live MIDI Recorder

このメモは、Python 生成システムを Ableton Live に接続し、生成された MIDI を Live の clip として声部別に保存するための手順です。

## 現在の実装範囲

- Python は従来通り `127.0.0.1:8000` へ Max 再生・可視化用 OSC を送ります。
- 追加で `127.0.0.1:8002` へ `/seq_low`, `/seq_mid`, `/seq_high`, `/pad` をミラー送信します。
- `max/m4l/OSC_MIDI_Recorder.maxpat` は 8002 番ポートを受信し、low / mid / high / pad を別々の Ableton Live MIDI clip に書き込みます。

## ファイル

- `max/m4l/OSC_MIDI_Recorder.maxpat`
  - Max for Live 側の最小 patch。
  - `udpreceive 8002 -> route /seq_low /seq_mid /seq_high /pad -> js osc_midi_recorder.js`
- `max/m4l/osc_midi_recorder.js`
  - LiveAPI で Session View の MIDI clip を作成し、`add_new_notes` で note を追加します。
  - LiveAPI の `Track.duplicate_clip_to_arrangement` で、採用した Session clip を Arrangement View にコピーします。
  - 参考: <https://docs.cycling74.com/apiref/lom/track/>

## Ableton Live 側の使い方

1. Ableton Live で MIDI track を作成します。
2. Max for Live の MIDI Effect として `OSC_MIDI_Recorder.maxpat` を開きます。
3. `track` は base track として使います。現在の推奨レイアウトでは `EEG_M4L_Gen` が `track 0`、その右に `Seq_High`, `Seq_Mid`, `Seq_Low`, `Pad_Root` を置きます。
4. M4L recorder は `track+1` に high、`track+2` に mid、`track+3` に low、`track+4` に pad を書き込みます。
5. 記録先の Session slot を `slot` で指定します。
6. `length beats` を記録したい clip 長に設定します。例: 16 beats = 4/4 の 4 小節。
7. `New Take` を押します。low / mid / high / pad の Session clip を作り直し、録音状態を ON にします。
8. 既存の Max control/playback patch から `/pull` を走らせます。
9. 採用したい生成結果になったら `Commit to Arrangement` を押します。

最初に受信した `bar_id` が clip 内の 0 beat として扱われます。以後、`bar_id` と `beat` から clip 内の `start_time` を計算します。

## Session から Arrangement へのワークフロー

Session View 側の clip は「作業中の一時 take」として使います。Arrangement View 側には、採用した take だけを順番にコピーして残します。

1. 最初は `arr start beat` を `0` にします。4/4 の 4 小節単位なら、次の take は `length beats` の値だけ後ろに置かれます。
2. `New Take` を押します。
   - 現在の Session slot にある high / mid / low / pad clip を削除して作り直します。
   - 録音状態を ON にします。
3. Python 側で生成します。通常は既存の control patch から `/pull` を実行します。
4. その take を残したい場合は `Commit to Arrangement` を押します。
   - high / mid / low / pad の4つの Session clip を同じ Arrangement beat にコピーします。
   - コピー後、次の commit 位置は `length beats` だけ進みます。
   - 録音状態は OFF になり、対象 track は Arrangement playback に戻されます。
5. 次のフレーズを作る場合は、もう一度 `New Take` を押してから生成します。

`stop_take` は、Session clip は残したまま録音状態だけ止めたい時に使います。`reset_arrangement` は、次の commit 位置を beat 0 に戻します。途中から Arrangement に置きたい場合は、`arr start beat` に beat 単位の開始位置を入れてください。

Arrangement 側を再生しても音が出ない時は、Session clip がまだ track の再生を奪っている可能性があります。Live の Back to Arrangement を押すか、対象 track の Session clip を止めてください。この patch は `Commit to Arrangement` 時に各 voice track の `back_to_arranger` を 0 に戻しますが、Live 側の状態によっては手動確認が必要です。

## 8002 受信の確認

Python を更新した後は、必ず Python サーバーを再起動してください。古い Python プロセスのままだと 8002 番ポートには何も送られません。

`OSC_MIDI_Recorder.maxpat` には確認用 print を入れています。

- `OSC_MIDI_8002_RAW`
  - 8002 番ポートに届いた OSC をすべて表示します。
- `OSC_MIDI_8002_UNMATCHED`
  - 8002 には届いているが `/seq_low`, `/seq_mid`, `/seq_high` ではないメッセージを表示します。

Python サーバー起動後、既存の control patch から `/hello` を送ると、M4L 側に `/m4l_status hello` が届きます。これが `OSC_MIDI_8002_RAW` に出れば、Python -> M4L の UDP 接続は通っています。`/pull` 実行時に `/seq_low`, `/seq_mid`, `/seq_high`, `/pad` が表示されれば全入力が通っています。

## 注意

- `freq_hz` は MIDI note number に丸めます。純律・微分音の細かい差は通常の MIDI note には保存されません。
- `track` と `slot` は 0 始まりです。Ableton 上で 1 番左の track は LiveAPI では `track 0` です。
- 声部別 track と pad track にはそれぞれ楽器を置くか、別の楽器 track へ MIDI route してください。
- `clear` は現在の clip 内の note を消します。
- `recreate` は low / mid / high / pad の各 clip slot の clip を削除して作り直します。
- `New Take` は `recreate` を実行してから録音状態を ON にします。
- `Commit to Arrangement` は現在の Session clip を Arrangement にコピーし、次の commit 位置を進めます。

## 次の段階

- 声部数が増えても扱えるように、Python から `/seq_voice <voice_index> ...` のような汎用 OSC 形式を追加する。
- 必要なら Arrangement 上の古い commit を自動削除・上書きする安全な管理機能を追加する。
