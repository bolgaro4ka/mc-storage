MC Storage
A web application for managing Minecraft storage

<video align-center src="https://github.com/user-attachments/assets/bee5d73c-0750-4021-84f1-d5320f1fcbf1"></video>


## Как запустить
1. Установите Python
2. Установите зависимости
   `cd server` и `pip install -r req.txt`
3. Запустите WebSoket сервер
   `uvicorn main:app --reload --host 0.0.0.0 --port 8000`
4. Перейдите в папку web
   `cd web`
5. Запустите удобным для вас способом статиеский сервер, например с помощью Python
   `python -m http.server 5500 --bind 0.0.0.0`
6. В web/app.js измените домен WebSoket сервера на свой
7. Установите мод для Minecraft (рекомендуется версия 1.20.1) CC Tweaked (https://www.curseforge.com/minecraft/mc-mods/cc-tweaked)
8. Установите компьютер и выполните команду в терминале CC Tweaked
   `mkdir some`
9. В папке с вашей версией будет создана папка 
   `\saves\[название_мира]\computercraft\computer\[номер_компьютера]\`
10. В эту папку необходимо перекинуть файл client.lua
11. Измените в этом файле адрес WebSoket сервера
12. Подключите с помощью проводов и коннекторов более 2 сундуков (один из сундуков будет сундуком импорта, другой сундуком экспорта)
13. Измените в файле client.lua переменные
    ```
    local INPUT_CHEST_NAME = "minecraft:chest_5"
    local OUTPUT_CHEST_NAME = "minecraft:chest_4"
    ```
    Вставьте в них названия ваших сундуков импорта и экспорта (название сундуков пишется при включении, прилегающего к нему, коннектора)
15. В терминале CC Tweaked напишите client.lua

Готово! Теперь по адресу статического HTML сервера вы найдёте Web-панель для управления системой хранения

## Пример постройки хранилица
<img width="1920" height="1080" alt="2026-05-01_23 03 43" src="https://github.com/user-attachments/assets/6eda34e8-0a84-42cd-8f02-5acd33ddeb08" />
<img width="1920" height="1080" alt="2026-05-01_23 03 26" src="https://github.com/user-attachments/assets/259945fe-c54f-470e-bf97-18a222e3bac0" />
<img width="1920" height="1080" alt="2026-05-01_23 02 36" src="https://github.com/user-attachments/assets/f2423fcb-a94d-4e40-8321-f7980d141f23" />






