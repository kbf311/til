# Git ユーティリティスクリプト

このディレクトリには、Git の操作を自動化・効率化するための Windows 用バッチファイル（`.bat`）が格納されています。

## スクリプト一覧

| ファイル名 | 概要 |
| :--- | :--- |
| [bulk-update.bat](./bulk-update.bat) | カレントディレクトリ配下にあるすべての Git リポジトリを一括で `git pull` します。 |
| [force-pull.bat](./force-pull.bat) | ローカルの変更をすべて破棄し、リモート（`origin/main`）の状態を強制的に同期します。 |
| [reset-history.bat](./reset-history.bat) | コミット履歴を完全にリセット（削除）し、現在のファイル状態でコミット履歴を1つに統合してリモートに強制プッシュします。 |
| [wip.bat](./wip.bat) | 現在の変更をすべてステージングし、"wip" コミットメッセージで `origin main` にプッシュします。 |
