// web/app.js

const ws = new WebSocket("ws://192.168.0.97:8000/ws/web");

let items = {};

ws.onopen = () => {
    document.getElementById("ws-status").innerText = "Подключено";
    document.getElementById("ws-status").className = "connected";
};

ws.onclose = () => {
    document.getElementById("ws-status").innerText = "Отключено";
    document.getElementById("ws-status").className = "disconnected";
};

ws.onmessage = (event) => {
    const data = JSON.parse(event.data);
    if (data.type === "items") {
        items = data.items;
        render();
    }
};

ws.onerror = (error) => {
    console.error("WebSocket error:", error);
    document.getElementById("ws-status").innerText = "Ошибка";
    document.getElementById("ws-status").className = "error";
    document.getElementById("items").innerHTML = "<p>Connection lost. Refresh page.</p>";
};

function requestItem(name, count) {
    ws.send(JSON.stringify({ type: "request", name, count }));
}

function render() {
  const container = document.getElementById("items");
  const search = document.getElementById("search").value.toLowerCase();

  container.innerHTML = "";

  for (let name in items) {
    if (!name.toLowerCase().includes(search)) continue;

    const div = document.createElement("div");
    div.className = "item";

    const title = document.createElement("div");
    title.className = "item-title";
    title.innerText = `${name} x${items[name]}`;
    div.appendChild(title);

    const buttons = document.createElement("div");
    buttons.className = "item-buttons";
    const amounts = [1, 5, 10, 32, 64, "all"];
    for (let amt of amounts) {
      const btn = document.createElement("button");
      btn.className = "quick-btn";
      btn.innerText = amt === "all" ? "Всё" : `+${amt}`;
      btn.onclick = () => {
        const count = amt === "all" ? items[name] : amt;
        requestItem(name, count);
      };
      buttons.appendChild(btn);
    }
    div.appendChild(buttons);

    container.appendChild(div);
  }
}

document.getElementById("search").oninput = render;