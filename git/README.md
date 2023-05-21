# Git

## 初期設定

### ユーザーの設定

```
git config --global user.name "自分の名前"
git config --global user.email "自分のメールアドレス"
```

Githubを使う場合は以下も必要

### SSH鍵の生成

```
ssh-keygen -t ed25519
```

### Githubに鍵を登録

## 基本

```
# "ファイル名"をGitに追加する
git add ファイル名

# コミットメッセージの入力
git commit -m "コミットメッセージ"

# リモートにプッシュする
git push origin ブランチ名
```

## ブランチの新規作成

```
# "ブランチ名"を新しく作り、そのブランチに切り替える
git checkout -b ブランチ名

# リモートに新しく"ブランチ名"のブランチを作る
git push origin ブランチ名
```

## 各種確認コマンド

```
# ファイルの状態
git status

# ブランチ一覧
git branch

# コミット履歴
git log
```
