# Astro 導入手順書

本手順書は、コンテンツ指向の高速なWebサイトを構築するためのWebフレームワーク「Astro」の新規プロジェクト立ち上げから、ローカル開発環境の起動、本番ビルド確認までの手順を解説したマニュアルです。

---

## 1. 前提条件と動作環境

Astroの導入前に、以下の実行環境がローカル端末に整備されていることを確認します。

* **Node.js**: バージョン `v18.17.1` または `v20.3.0` 以上（LTS版を推奨）
* **パッケージマネージャー**: `npm`（Node.js同梱）、`pnpm`、または `yarn`
* **ターミナル環境**: bash, zsh, または PowerShell

現在のNode.jsバージョン確認コマンド:

```bash
node -v

```

---

## 2. プロジェクトの新規作成

Astro公式のセットアップウィザード `create-astro` を使用してプロジェクトを生成します。

### 手順 2-1: セットアップコマンドの実行

ターミナルを開き、プロジェクトを作成したいディレクトリで次のコマンドを実行します。

```bash
npm create astro@latest

```

*(pnpmを使用する場合は `pnpm create astro@latest`)*

### 手順 2-2: 対話型プロンプトの設定

コマンド実行後、端末上に設定項目が順次表示されます。要件に応じて選択・入力してください。

1. **ディレクトリの指定**
```text
Where should we create your new project?
./my-astro-project

```


*新規作成するフォルダ名を入力します。*
2. **スターターテンプレートの選択**
```text
How would you like to start your new project?
> Include sample files (recommended)
  Use minimal template
  Use blog template

```


*基本構成を把握するためには `Include sample files` の選択を推奨します。*
3. **依存パッケージのインストール**
```text
Install dependencies? (recommended)
> Yes

```


*`Yes` を選択すると、`npm install` が自動実行されます。*
4. **TypeScriptの使用有無**
```text
Do you plan to write TypeScript?
> Yes

```


*型安全な開発を行うため `Yes` を推奨します。*
5. **TypeScriptの厳格度設定**
```text
How strict should TypeScript be?
> Strict (recommended)
  Strictest
  Relaxed

```


*標準的な開発では `Strict` を選択します。*
6. **Gitリポジトリの初期化**
```text
Initialize a new git repository? (recommended)
> Yes

```


*バージョン管理を行う場合は `Yes` を選択します。*

---

## 3. ディレクトリ構成の確認

生成されたプロジェクトの標準構成は以下の通りです。

```text
my-astro-project/
├── public/              # 画像やファビコンなど、静的アセットを配置
│   └── favicon.svg
├── src/                 # アプリケーションのソースコード
│   ├── components/      # 再利用可能なUIコンポーネント（.astroなど）
│   ├── layouts/         # 共通レイアウト定義（HTMLの基本骨格）
│   └── pages/           # ルーティング対象ページ（ファイルベースルーティング）
│       └── index.astro  # トップページ (http://localhost:4321/)
├── astro.config.mjs     # Astroの設定ファイル（インテグレーション追加時などに編集）
├── package.json         # プロジェクト構成情報・依存パッケージ一覧
└── tsconfig.json        # TypeScriptの設定ファイル

```

---

## 4. 開発サーバーの起動

プロジェクトディレクトリへ移動し、ローカル開発サーバーを立ち上げます。

```bash
cd my-astro-project
npm run dev

```

起動後、ターミナルに以下のようなURLが表示されます。

```text
  🚀  astro  v4.x.x ready in 350 ms

  ┃ Local    http://localhost:4321/
  ┃ Network  use --host to expose

```

ブラウザで `http://localhost:4321/` にアクセスし、Astroの初期画面が正常に表示されることを確認します。

---

## 5. 主要なインテグレーションの追加（任意）

Astroは、React/Tailwind CSS/VueなどのフレームワークやツールをCLIコマンド1行で統合できます。

### Tailwind CSS の導入

```bash
npx astro add tailwind

```

### React の導入

```bash
npx astro add react

```

*コマンド実行時に設定ファイル（`astro.config.mjs`）の変更確認プロンプトが表示されるため、`Y` を入力して承認します。*

---

## 6. 本番用ビルドとプレビュー

開発完了後、静的ファイルの書き出し（またはSSR用ビルド）と動作検証を行います。

### ビルドの実行

```bash
npm run build

```

実行が成功すると、ルート直下に `dist/` ディレクトリが生成され、最適化されたHTML・CSS・JavaScriptが出力されます。

### ビルド成果物のローカルプレビュー

```bash
npm run preview

```

本番環境相当の状態でローカルサーバーが立ち上がり、出力結果の表示・動作テストが行えます。