# MC Storage
Web-приложение для управление хранилицем предметов

## Содержание
- 🖼 Демострация
- 🗝 Как запустить
- 🎮 Примеры постройки хранилища
- 💊 Возможные проблемы

## Демонстрация
<div align-center><video  src="https://github.com/user-attachments/assets/bee5d73c-0750-4021-84f1-d5320f1fcbf1"></video></div>


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

<img width="1906" height="1080" alt="Снимок экрана 2026-05-01 230458" src="https://github.com/user-attachments/assets/91245f33-6a82-4a2b-a671-74ff8d334dfd" />
Готово! Теперь по адресу статического HTML сервера вы найдёте Web-панель для управления системой хранения

## Пример постройки хранилица
<img width="1920" height="1080" alt="2026-05-01_23 03 43" src="https://github.com/user-attachments/assets/6eda34e8-0a84-42cd-8f02-5acd33ddeb08" />
<img width="1920" height="1080" alt="2026-05-01_23 03 26" src="https://github.com/user-attachments/assets/259945fe-c54f-470e-bf97-18a222e3bac0" />
<img width="1920" height="1080" alt="2026-05-01_23 02 36" src="https://github.com/user-attachments/assets/f2423fcb-a94d-4e40-8321-f7980d141f23" />

## Возможные  проблемы
### Q: У меня не соединяется компьютер и сундуки/монитор

A: Отключите Optifine, он не совместим с CC Tweaked

### Q: Не открывается веб-интерфейс на других устройствах

A: 1. Убедитесь что вы запустили сервер не на localhost
   
   2. Если вы используете прокси поставьте галочку на "не использовать для внутренних ардесов" и добавьте ваш IP в исключения
   <img width="476" height="409" alt="image" src="https://github.com/user-attachments/assets/79d9d758-5f7a-4070-a18d-0ac7d9055816" />


By Bolgaro4ka 2026




