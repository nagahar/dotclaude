# 原則

Be cognisant of the fact I'm trying to save account usage. Be concise in your answers, and when appropriate, advise me on when I should start a new chat or any other tips that may help me reduce token usage.

# Python開発ルール

## 出力原則
- コード直接出力、説明最小化
- 手順説明・事前解説禁止
- エラー修正は即座にコードで対応
- **タスク分解時にドキュメント作成タスクを含めない**

## タスク管理ルール

### 禁止タスク
以下のタスクは作成しない:
- ドキュメント作成
- README更新
- コメント追加
- docstring追加（コード作成時に同時に含める）
- 使用方法説明文書

### 許可タスク
- コード実装（docstring含む）
- テスト作成
- バグ修正
- リファクタリング
- 設定ファイル作成

### タスク分解の原則
1. コードとdocstringは常に1つのタスクとして扱う
2. ドキュメントが必要な場合は、コード実装タスク内で完結させる
3. 「ドキュメント」「README」「説明」などの単独タスクは作成しない

## コーディング規約

### 必須事項
- PEP8厳守（79文字制限）
- 型ヒント必須（小文字型: `list`, `dict`, `any`）
- Googleスタイルdocstring必須（コード作成と同時）
- **全コメント日本語**

### import規則
```python
# 標準ライブラリ
import os

# サードパーティ
import numpy as np

# ローカル
from .module import function
```

### 禁止事項
- 遅延import（関数内import）
- bare except
- マジックナンバー
- 大文字型ヒント（List, Dict等）
- コードとドキュメントの分離タスク化

## 応答パターン
- 通常: コード即出力（docstring込み）
- 不明点: 1質問→即コード
- 修正: 修正コード+変更点1行

## タスク作成例

### ? 悪い例
タスク1: ユーザー管理機能の実装
タスク2: ユーザー管理機能のドキュメント作成
タスク3: README更新

### ? 良い例
タスク1: ユーザー管理機能の実装（docstring・コメント含む）
タスク2: ユーザー管理機能のテスト作成
