from fastapi import FastAPI, WebSocket, WebSocketDisconnect
from typing import Dict

app = FastAPI()
minecraft_clients = []
web_clients = []
items: Dict[str, int] = {}

async def safe_send_json(client, data):
    try:
        await client.send_json(data)
    except:
        if client in minecraft_clients:
            minecraft_clients.remove(client)
        elif client in web_clients:
            web_clients.remove(client)

@app.websocket("/ws/minecraft")
async def minecraft_ws(ws: WebSocket):
    await ws.accept()
    minecraft_clients.append(ws)
    try:
        while True:
            data = await ws.receive_json()
            if data["type"] == "update":
                global items
                items = data["items"]
                # рассылка всем веб-клиентам
                for client in web_clients[:]:
                    await safe_send_json(client, {"type": "items", "items": items})
    except WebSocketDisconnect:
        if ws in minecraft_clients:
            minecraft_clients.remove(ws)

@app.websocket("/ws/web")
async def web_ws(ws: WebSocket):
    await ws.accept()
    web_clients.append(ws)
    await safe_send_json(ws, {"type": "items", "items": items})
    try:
        while True:
            data = await ws.receive_json()
            if data["type"] == "request":
                print("Forwarding request to minecraft:", data)
                for client in minecraft_clients[:]:
                    await safe_send_json(client, data)
    except WebSocketDisconnect:
        if ws in web_clients:
            web_clients.remove(ws)