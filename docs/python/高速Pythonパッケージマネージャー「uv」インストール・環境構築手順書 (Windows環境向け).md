# 高速Pythonパッケージマネージャー「uv」インストール・環境構築手順書 (Windows環境向け)

本書は、Rust製で極めて高速に動作するPythonパッケージ・プロジェクトマネージャー「uv」をWindows環境へ導入し、初期動作確認および基本的なプロジェクト立ち上げを行うための標準手順書です。

---

## 1. 前提条件とシステム要件

 OS Windows 10 (Build 19041以上) または Windows 11 (64-bit版)
 シェル PowerShell (推奨) または Windows ターミナル
 権限 標準ユーザー権限（グローバル管理者権限は不要）
 ネットワーク環境 インターネット接続（GitHubおよびPyPIへのHTTPS通信が可能であること）

---

## 2. インストール手順

Windows環境への推奨導入方法は、公式が提供するPowerShellインストールスクリプトの実行です。

### 手順 2-1 PowerShellの起動

1. `Windowsキー + R` を押し、「ファイル名を指定して実行」を開きます。
2. `powershell` または `wt` と入力し、Enterキーを押してPowerShellを起動します。

### 手順 2-2 インストーラーの実行

以下のコマンドをコピーし、PowerShellウィンドウに貼り付けて実行します。

```powershell
powershell -ExecutionPolicy ByPass -c irm httpsastral.shuvinstall.ps1  iex

```

 代替導入手段（パッケージマネージャーを利用する場合）
  Winget `winget install --id=astral-sh.uv -e`
  Scoop `scoop install uv`
  Chocolatey `choco install uv`
 
 

---

## 3. 環境変数の確認とパスの適用

公式スクリプトを実行した場合、実行バイナリは通常以下のパスに自動配置され、ユーザー環境変数 `PATH` に登録されます。

```text
%USERPROFILE%.localbin
（例 CUsersユーザー名.localbin）

```

### パスの即時反映

インストールを実行したPowerShellセッションには新しい環境変数が即時反映されない場合があります。
一度PowerShellウィンドウを閉じ、再度新しいウィンドウを起動してください。

PowerShellを再起動せずに現在のセッションへ反映させる場合は、以下のコマンドを実行します。

```powershell
$envPath = [System.Environment]GetEnvironmentVariable(Path,User) + ; + [System.Environment]GetEnvironmentVariable(Path,Machine)

```

---

## 4. インストール確認

PowerShellで以下のコマンドを実行し、バージョン情報が正しく返ることを確認します。

```powershell
uv --version

```

想定出力例

```text
uv 0.6.x (xxxxxxxxx 202x-xx-xx)

```

---

## 5. 基本動作確認（クイックスタート）

### 5-1. Pythonの自動インストールとワンライナー実行

uvはシステム上の既存Python環境に依存せず、必要なバージョンのスタンドアロンPythonバイナリを自動取得して実行できます。

```powershell
# Python 3.12 を自動取得してスクリプトを実行
uv run --python 3.12 -c import sys; print(sys.version)

```

### 5-2. 新規プロジェクトの作成

独立した仮想環境を伴うプロジェクトディレクトリを初期化します。

```powershell
# プロジェクト作成と移動
uv init my-uv-project
cd my-uv-project

# 依存パッケージの追加（例 requests）
uv add requests

# 仮想環境内での実行
uv run main.py

```

---

## 6. メンテナンス手順

### 本体のアップデート

uv自身を最新バージョンへ更新するには、以下のコマンドを実行します。

```powershell
uv self update

```

### アンインストール手順

環境からuvを完全に削除する場合は、以下の手順を実行します。

1. バイナリ保存ディレクトリ（`%USERPROFILE%.localbinuv.exe` および `uvx.exe`）を手動削除します。
2. キャッシュディレクトリ（`%LOCALAPPDATA%uv`）を削除します。
3. システムのプロパティ「環境変数」を開き、ユーザー環境変数 `PATH` から `%USERPROFILE%.localbin` のエントリを削除します。