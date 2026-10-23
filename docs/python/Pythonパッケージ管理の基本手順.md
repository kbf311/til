Pythonでインストール済みのパッケージを `requirements-lock.txt` に出力し、それを別の環境で取り込む（インストールする）手順です。

---

## 1. パッケージ一覧をファイルに出力する

現在アクティブなPython環境にインストールされているパッケージとそのバージョンを、指定のファイル名で保存します。

**コマンド:**

```bash
pip freeze > requirements-lock.txt

```

> 💡 **ポイント:** コマンドを実行したディレクトリに `requirements-lock.txt` というファイルが生成され、中身に `package-name==1.0.0` のような形式で書き込まれます。

---

## 2. 出力したファイルからパッケージを取り込む

作成した `requirements-lock.txt` を使って、別の環境（または初期化した環境）に一括でパッケージをインストールします。

**コマンド:**

```bash
pip install -r requirements-lock.txt

```

> 💡 **ポイント:** `-r` オプションは「指定したテキストファイル（requirements）を読み込む」という意味です。ファイルに記載されたバージョンがそのまま正確に再現されます。

---

### 補足：出力の確認方法（おまけ）

正しく出力されたか中身を確認したい場合は、以下のコマンドでターミナル上に見出しを表示できます。

* **Windows (PowerShell):** `cat requirements-lock.txt`
* **Mac / Linux:** `cat requirements-lock.txt`