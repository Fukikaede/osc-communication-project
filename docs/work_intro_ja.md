# ワーク紹介: OSC Communication Project

## 1. このワークの目的

このワークは、Max/MSP のライブ操作性と Python の生成ロジックを OSC で接続し、  
「演奏しながら生成パラメータを細かく操作できる」3 声部音楽システムを実現することを目的としています。

## 2. 何ができるか

- low / mid / high の 3 声部をリアルタイム生成
- ピッチ分布・リズム分布・協和性・密度などを独立パラメータで制御
- 生成結果を Max 側で音として再生しながら可視化（grid / pdf / stat）
- ODOT (`o.pack`, `o.route`) を使った明確な OSC データフロー

## 3. システムの見どころ

- `entropy` 一括制御を廃止し、全パラメータを独立操作へ移行
- パラメータ変更がそのまま次の `/pull` サイクルに反映
- `/seq` 後方互換を残しつつ `/seq_low` `/seq_mid` `/seq_high` を正式運用

## 4. 想定ユースケース

- 即興演奏での生成補助
- 生成音楽アルゴリズムのパラメータ検証
- Max + Python + OSC の教育用途

## 5. 操作フロー（実演向け）

1. Python サーバーを起動
2. Max で `OSC_communication.maxpat` と `OSC_param_control.maxpat` を開く
3. `/hello` と `/grid_now` を送信して接続確認
4. `qmetro` を有効化し `/pull` を定期送信
5. パラメータを調整しながら音と可視化の変化を確認

## 6. 主要パラメータ例

- `sigma_pitch`: 音高候補の広がり
- `sigma_rhythm`: リズム候補の広がり
- `rhythm_disrupt_max`: リズム崩しの強さ
- `harmony_strength`: 協和ガイドの強さ
- `tau`: 協和オフセットへの吸着幅
- `rho`: 分布の相関傾向

## 7. 今後の発展案

- 声部ごとの個別パラメータ（low/mid/high 分離）
- パターン保存・呼び出し（preset / scene 管理）
- 外部センサー入力との OSC 連携
