# コミュニケーション
- 日本語で応答する（コード・変数名は英語）
- ドキュメントは日本語で生成する
- 簡潔に回答し、自明な説明は省略する
- 複雑なタスクでは実装前に計画を提示し、承認後に着手する
- ファイルはUTF-8エンコーディング、LF形式で保存する

# トークン使用
- 私がアカウントの使用量を節約したいことを意識する
- 新チャットへの開始タイミングやトークン使用量削減等のヒントを適時助言する

## Wiki ナレッジベース
パス: ~/IKWELL/mybrain/
- `~/IKWELL` は `/mnt/c/Users/User/OneDrive - アイケーウェルパートナーズ` へのシンボリックリンク。vault は1つだが絶対パス形が2つある。参照は常に `~/IKWELL/mybrain/...` 形へ統一し、1セッション内で `/mnt/c/...` 形と混在させない（Read と Edit でパス形が違うと「File has not been read yet」で失敗する）
- 旧パス `/mnt/c/Users/takan/...`、`/mnt/c/Users/永原崇範/OneDrive - アイケーウェルコンサルティング/mybrain` は存在しない
- ファイル名に全角括弧 `（）` が使われる（例: `9月プレゼン 90分骨子（確定版）.md`）。半角 `()` で綴らず、Glob で実名を確認してから開く
このプロジェクトにまだない文脈が必要な場合:
1. まず wiki/hot.md を読む（最近の文脈、約500語）
2. それで足りなければ wiki/index.md を読む
3. 分野特有の情報が必要なら wiki/<domain>/index.md を読む
4. それでも足りない場合のみ、個別のwikiページを読む
一般的な質問や、既にこのプロジェクトにある内容についてはwikiを読まないこと。

# セッション引き継ぎ・wiki記録
- セッション開始時: プロジェクトルートの `.claude/handovers/` を確認し、最新ファイルがあれば読み込む
- セッション終了・区切り: `/handover <テーマ>`（引き継ぎノート＋wikiノート）。途中の気づきを1件だけ残すなら `/handover --save-only <テーマ>`
- wikiへの書き込み経路は `/handover` に一本化されている（`record-learning` は `/handover` と完全に重複していたため2026-07-26に廃止済み、同じものを作り直さないこと）。vault書き込みの実手順は `~/IKWELL/mybrain/.claude/skills/save/SKILL.md` が正

# ツール利用ルール
- `AskUserQuestion` は詰め込むとJSONが壊れて失敗する（cclens調査で確認済み、3プロジェクト・15件中10件）。次の上限を厳守: questions は最大2個、question 文字列は各100字以内、選択肢 label は各20字以内・description 必須。超えそうなら分割するか散文で聞く
- `~/dotclaude/settings.json` はサンドボックスの保護対象パスで、Editツールでは原理的に書き込めない（denyWithinAllow）。自動編集を試みて失敗を繰り返さず、変更が必要な場合はユーザーに `!` プレフィックスでの実行を依頼する
- `TaskCreate`は1タスク=1呼び出し（`subject`+`description`必須、旧TodoWriteの`todos`配列形式では呼ばない）。cclens調査で3プロジェクト計4件のInputValidationErrorを確認（直近2026-08-04）
- 完了待ちに`sleep N && command`は使わない。auto modeクラシファイアに毎回ブロックされる（cclens調査で2プロジェクト計5件、直近2026-08-09）。待つ場合はMonitorのuntil-loop、または`run_in_background`の完了通知を使う
- `crontab` はこの環境で使用不可（`crontab -l` → `crontabs/takanori/: fopen: Permission denied`）。存在確認を繰り返さず、cron 定義は各プロジェクトの `.claude/cron/` を参照する

