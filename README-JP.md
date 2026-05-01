# MC Storage
アイテムストレージ管理用Webアプリケーション
## 目次
- 🖼 デモ
- 🗝 実行方法
- 🎮 ストレージ構築例
- 💊 潜在的な問題

## デモ
<div align-center><video src="https://github.com/user-attachments/assets/bee5d73c-0750-4021-84f1-d5320f1fcbf1"></video></div>

## 実行方法
1. Pythonをインストールします
2. 依存関係をインストールします
`cd server` と `pip install -r req.txt`
3. WebSocketサーバーを起動します
`uvicorn main:app --reload --host 0.0.0.0 --port 8000`
4. webフォルダに移動します
`cd web`
5. お好みの方法で実行します。静的サーバーの場合、例えばPythonを使用する場合は
`python -m http.server` 5500 --bind 0.0.0.0`
6. web/app.js で、WebSocket サーバーのドメインを自分のドメインに変更します。
7. Minecraft の mod である CC Tweaked (バージョン 1.20.1 を推奨) をインストールします (https://www.curseforge.com/minecraft/mc-mods/cc-tweaked)
8. コンピューターをセットアップし、ターミナルで CC Tweaked コマンドを実行します。
`mkdir some`
9. お使いのバージョンのフォルダー内にフォルダーが作成されます。
`\saves\[world_name]\computercraft\computer\[computer_number]\`
10. client.lua ファイルをこのフォルダーに移動します。
11. このファイルで WebSocket サーバーのアドレスを変更します。
12. ワイヤーとコネクタを使用して 2 つ以上のチェストを接続します (1 つのチェストはインポート用、もう 1 つはエクスポート用です)。
13. client.lua ファイルの変数を変更します。
```
local INPUT_CHEST_NAME = "minecraft:chest_5"
local OUTPUT_CHEST_NAME = "minecraft:chest_4"
```
インポートチェストとエクスポートチェストの名前をここに貼り付けてください（チェスト名は、隣接するコネクタが有効になっているときに書き込まれます）。

15. CC Tweakedのターミナルで、client.luaと入力します。

<img width="1906" height="1080" alt="Screenshot 2026-05-01 230458" src="https://github.com/user-attachments/assets/91245f33-6a82-4a2b-a671-74ff8d334dfd" />
完了です！これで、静的HTMLサーバーのアドレスにアクセスすると、ストレージシステムを管理するためのWebパネルが表示されます。

## ストレージシステム構築例
<img width="1920" height="1080" alt="2026-05-01_23 03 43" src="https://github.com/user-attachments/assets/6eda34e8-0a84-42cd-8f02-5acd33ddeb08" />
<img width="1920" height="1080" alt="2026-05-01_23 03 26" src="https://github.com/user-attachments/assets/259945fe-c54f-470e-bf97-18a222e3bac0" />
<img width="1920" height="1080" alt="2026-05-01_23 02 36" src="https://github.com/user-attachments/assets/f2423fcb-a94d-4e40-8321-f7980d141f23" />

## 考えられる問題
### Q: コンピューターとチェスト/モニターが接続されません。

A: Optifineを無効にしてください。CC Tweakedとは互換性がありません。

### Q: 他のデバイスでWebインターフェースが開きません。

A: 1. サーバーがlocalhostで実行されていないことを確認してください。

2. プロキシを使用している場合は、「内部サーバーには使用しない」にチェックを入れ、例外にIPアドレスを追加してください。

<img width="476" height="409" alt="image" src="https://github.com/user-attachments/assets/79d9d758-5f7a-4070-a18d-0ac7d9055816" />

Bolgaro4ka 2026 作成
