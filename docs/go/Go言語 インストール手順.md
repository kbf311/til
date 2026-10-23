# Go言語 インストール手順 (Windows版)

Windows環境にGo言語（Golang）をインストールし、動作確認を行うための手順書です。

> [!NOTE]  
> `winget` 経由でのGoのインストールでは、インストーラー（MSI）の実行権限が必要となるため、**管理者として実行したPowerShellまたはコマンドプロンプト**で作業を行ってください。

---

## 1. インストール方法

### 方法A: Windows パッケージ マネージャー (`winget`) 【推奨】

管理者権限で起動したPowerShell（またはコマンドプロンプト）で以下のコマンドを実行します。

```powershell
winget install GoLang.Go
```

**実行時の出力例:**
```text
Found Go Programming Language [GoLang.Go] Version 1.27.0
This application is licensed to you by its owner.
Microsoft is not responsible for, nor does it grant any licenses to, third-party packages.
Downloading https://go.dev/dl/go1.27.0.windows-amd64.msi
  ██████████████████████████████  63.0 MB / 63.0 MB
Successfully verified installer hash
Starting package install...
Successfully installed
```

---

### 方法B: 公式インストーラー (MSI) を使用する場合

GUIインストーラーを利用して手動でインストールすることも可能です。

1. Go言語の公式サイトからWindows用のインストーラー（`.msi`）をダウンロードします。
   - URL: [https://go.dev/dl/](https://go.dev/dl/)
2. ダウンロードした `.msi` ファイルをダブルクリックして起動し、画面の指示に従ってインストールを完了させます（ユーザーアカウント制御のポップアップで許可が必要です）。

---

## 2. インストールの確認

インストールが完了したら、環境変数（PATH）を反映させるため、**ターミナル（PowerShell / コマンドプロンプト）を一度閉じて新しく開き直します**。

以下のコマンドを実行して、Goのバージョンが表示されることを確認します。

```powershell
go version
```

**出力例:**
```text
go version go1.27.0 windows/amd64
```

バージョン情報が表示されれば、正常にインストールが完了しています。