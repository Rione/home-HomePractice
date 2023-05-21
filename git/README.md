# Git

## 初期設定

### ユーザーの設定

```
git config --global user.name "自分の名前"
git config --global user.email "自分のメールアドレス"
```

Githubを使う場合は以下も必要

### SSHキーの生成

```
ssh-keygen -t ed25519
```

### GithubにSSHキーを追加

https://docs.github.com/ja/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

## 基本

```
# <ファイル名>をステージングエリアに追加
git add ファイル名

# ステージングエリアの内容をローカルリポジトリに保存
git commit -m "コミットメッセージ"

# リモートリポジトリに保存
git push リモートリポジトリ名 ブランチ名
```

## ブランチの新規作成

```
# <ブランチ名>を新しく作り、そのブランチに切り替える
# git checkout -b ブランチ名 でも可
git switch -c ブランチ名

# リモートリポジトリに保存
git push リモートリポジトリ名 ブランチ名
```

## ブランチの切り替え

```
# <ブランチ名>のブランチに切り替える
# git checkout ブランチ名 でも可
git switch ブランチ名
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

## 良い資料

- https://speakerdeck.com/silmin_/gitru-men
- https://youtu.be/E5nSiTIKGd8
