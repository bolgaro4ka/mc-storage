# MC Storage
A web application for managing item storage

## Contents
- 🖼 Demo
- 🗝 How to run
- 🎮 Storage building examples
- 💊 Potential issues

## Demo
<div align-center><video src="https://github.com/user-attachments/assets/bee5d73c-0750-4021-84f1-d5320f1fcbf1"></video></div>

## How to run
1. Install Python
2. Install dependencies
`cd server` and `pip install -r req.txt`
3. Start the WebSocket server
`uvicorn main:app --reload --host 0.0.0.0 --port 8000`
4. Navigate to the web folder
`cd web`
5. Run using your preferred method A static server, for example using Python
`python -m http.server 5500 --bind 0.0.0.0`
6. In web/app.js, change the WebSocket server domain to yours
7. Install the Minecraft mod (version 1.20.1 recommended) CC Tweaked (https://www.curseforge.com/minecraft/mc-mods/cc-tweaked)
8. Set up a computer and run the CC Tweaked command in the terminal
`mkdir some`
9. A folder will be created in the folder with your version
`\saves\[world_name]\computercraft\computer\[computer_number]\`
10. Move the client.lua file to this folder
11. Change the WebSocket server address in this file
12. Connect more than 2 chests using wires and connectors (one of the chests will be One is the import chest, the other is the export chest)
13. Change the variables in the client.lua file
```
local INPUT_CHEST_NAME = "minecraft:chest_5"
local OUTPUT_CHEST_NAME = "minecraft:chest_4"
```
14. Paste the names of your import and export chests into them (the chest name is written when the adjacent connector is enabled).
15. In the CC Tweaked terminal, type client.lua

<img width="1906" height="1080" alt="Screenshot 2026-05-01 230458" src="https://github.com/user-attachments/assets/91245f33-6a82-4a2b-a671-74ff8d334dfd" />
Done! Now, at the static HTML server address, you'll find a web panel for managing the storage system.

## Storage system construction example
<img width="1920" height="1080" alt="2026-05-01_23 03 43" src="https://github.com/user-attachments/assets/6eda34e8-0a84-42cd-8f02-5acd33ddeb08" />
<img width="1920" height="1080" alt="2026-05-01_23 03 26" src="https://github.com/user-attachments/assets/259945fe-c54f-470e-bf97-18a222e3bac0" />
<img width="1920" height="1080" alt="2026-05-01_23 02 36" src="https://github.com/user-attachments/assets/f2423fcb-a94d-4e40-8321-f7980d141f23" />

## Potential Issues
### Q: My computer and chests/monitor aren't connecting.

A: Disable Optifine; it's not compatible with CC Tweaked.

### Q: The web interface isn't opening on other devices.

A: 1. Make sure you're not running the server on localhost.

2. If you're using a proxy, check "Do not use for internal servers" and add your IP address to the exceptions.
<img width="476" height="409" alt="image" src="https://github.com/user-attachments/assets/79d9d758-5f7a-4070-a18d-0ac7d9055816" />


By Bolgaro4ka 2026
