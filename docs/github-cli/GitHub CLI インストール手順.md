# GitHub CLI インストール手順 (Windows版)

Windows環境にGitHub CLI（`gh`）をインストールし、初期設定を行うための手順書です。

---

## 1. インストール方法

Windowsでは、複数の方法でGitHub CLIをインストールできます。お使いの環境に合わせて、いずれか**1つの方法**を選択して実行してください。

### 方法A: Windows パッケージ マネージャー (`winget`) 【推奨】
Windows 10 / 11 に標準搭載されているコマンドラインツールを使用する方法です。管理者権限のコマンドプロンプトまたはPowerShellで以下を実行します。

```cmd
winget install GitHub.cli
```

### 方法B: インストーラー (MSI) を使用する
GUIインストーラーを使用して手動でインストールする方法です。

1. GitHub CLIの公式リリースページ（または以下URL）から最新の `.msi` ファイルをダウンロードします。
   - URL: [https://cli.github.com/](https://cli.github.com/)
2. ダウンロードしたインストーラーを実行し、画面の指示に従ってインストールを完了させます。

### 方法C: その他のパッケージマネージャー
すでに `scoop` や `chocolatey` を利用している場合は、以下のコマンドでもインストール可能です。

**Scoopの場合:**
```powershell
scoop bucket add main
scoop install gh
```

**Chocolateyの場合:**
```powershell
choco install gh
```

---

## 2. インストールの確認

インストールが完了したら、新しいコマンドプロンプトまたはPowerShellのウィンドウを開き、以下のコマンドを実行して正常に認識されているか確認します。

```cmd
gh --version
```

**出力例:**
```text
gh version 2.x.x (202x-xx-xx)
https://github.com/cli/cli/releases/tag/v2.x.x
```
※バージョン番号が表示されれば、インストールは成功しています。

---

## 3. 初期設定（GitHubへの認証）

GitHub CLIを使用するには、GitHubアカウントとの連携（認証）が必要です。以下のコマンドを実行します。

```cmd
gh auth login
```

コマンドを実行すると、対話形式で質問が表示されるので、以下のように選択・入力します。

1. **What account do you want to log into?**
   - `GitHub.com` を選択してEnter。
2. **What is your preferred protocol for Git operations on this host?**
   - リポジトリのクローン等で使うプロトコル（`HTTPS` または `SSH`）を選択します。分からなければ `HTTPS` で問題ありません。
3. **Authenticate Git with your GitHub credentials?**
   - `Y` (Yes) を選択。
4. **How would you like to authenticate GitHub CLI?**
   - `Login with a web browser`（ブラウザ経由でのログイン）を選択してEnter。
5. **ワンタイムコードの表示とブラウザの起動:**
   - 画面に8桁のパスコード（例: `XXXX-XXXX`）が表示されます。
   - Enterキーを押すとブラウザが開くので、表示されたコードを入力し、GitHub上での権限を承認（Authorize）します。

認証が完了すると、ターミナルに `✓ Logged in as [ユーザー名]` と表示され、GitHub CLIが利用可能になります。

---

## 4. 動作確認

正しく連携できているか、自分のリポジトリ一覧を表示して確認してみましょう。

```cmd
gh repo list
```
リポジトリの一覧が表示されれば、すべての設定が完了です。
