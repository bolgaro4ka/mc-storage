-- =========================
-- CONFIG
-- =========================
local WS_URL = "ws://192.168.0.97:8000/ws/minecraft"
local INPUT_CHEST_NAME = "minecraft:chest_5"
local OUTPUT_CHEST_NAME = "minecraft:chest_4"

-- =========================
-- INIT PERIPHERALS
-- =========================
local function initPeripherals()
    local inputChest = peripheral.wrap(INPUT_CHEST_NAME)
    local outputChest = peripheral.wrap(OUTPUT_CHEST_NAME)
    if not inputChest then error("Input chest not found") end
    if not outputChest then error("Output chest not found") end

    local storageChests = {}
    for _, name in ipairs(peripheral.getNames()) do
        if peripheral.getType(name) == "minecraft:chest"
            and name ~= INPUT_CHEST_NAME
            and name ~= OUTPUT_CHEST_NAME then
            table.insert(storageChests, peripheral.wrap(name))
        end
    end
    print("Storage chests:", #storageChests)
    return inputChest, outputChest, storageChests
end

local inputChest, outputChest, storageChests = initPeripherals()

-- =========================
-- SCAN ITEMS
-- =========================
local function scanItems()
    local items = {}
    for _, chest in ipairs(storageChests) do
        for _, item in pairs(chest.list()) do
            items[item.name] = (items[item.name] or 0) + item.count
        end
    end
    return items
end

-- =========================
-- IMPORT ITEMS (input → storage)
-- =========================
local function importItems()
    for slot, item in pairs(inputChest.list()) do
        local remaining = item.count
        for _, chest in ipairs(storageChests) do
            local moved = inputChest.pushItems(peripheral.getName(chest), slot, remaining)
            if moved > 0 then
                remaining = remaining - moved
            end
            if remaining <= 0 then break end
        end
    end
end

-- =========================
-- SEND ITEMS (storage → output)
-- =========================
local function sendItem(name, count)
    print("Sending:", name, count)
    local remaining = count
    for _, chest in ipairs(storageChests) do
        for slot, item in pairs(chest.list()) do
            if item.name == name then
                local moved = chest.pushItems(peripheral.getName(outputChest), slot, remaining)
                if moved > 0 then
                    remaining = remaining - moved
                end
                if remaining <= 0 then
                    print("Done")
                    return true
                end
            end
        end
    end
    print("Not enough items")
    return false
end

-- =========================
-- WS CONNECT (auto reconnect)
-- =========================
local ws = nil

local function connect()
    while true do
        print("Connecting to WS...")
        local newWs, err = http.websocket(WS_URL)
        if newWs then
            print("Connected to WS (D)")
            return newWs
        else
            print("WS error:", err)
            sleep(3)
        end
    end
end

-- Безопасная отправка (не падает при ошибке)
local function safeSend(message)
    if not ws then return false end
    local ok, err = pcall(function()
        ws.send(message)
    end)
    if not ok then
        print("Send error:", err)
        -- Пытаемся переподключиться
        ws = connect()
    end
    return ok
end

-- =========================
-- SEND UPDATE
-- =========================
local function sendUpdate()
    safeSend(textutils.serializeJSON({
        type = "update",
        items = scanItems()
    }))
end

-- =========================
-- MAIN LOOP (EVENT DRIVEN with error recovery)
-- =========================
ws = connect()
os.startTimer(1)

while true do
    local event, p1, p2, p3 = os.pullEvent()

    -- === WebSocket message ===
    if event == "websocket_message" then
        local message = p3 or p2
        if type(message) ~= "string" then
            print("WS message event: no string payload", p2, p3)
        else
            local ok, err = pcall(function()
                local data = textutils.unserializeJSON(message)
                if data and data.type == "request" then
                    local count = tonumber(data.count) or 1
                    print("Request:", data.name, count)
                    sendItem(data.name, count)
                    sendUpdate()
                end
            end)
            if not ok then
                print("Error processing message:", err)
            end
        end
    end

    -- === Timer (import + update) ===
    if event == "timer" then
        local ok, err = pcall(function()
            importItems()
            sendUpdate()
        end)
        if not ok then
            print("Timer error:", err)
        end
        os.startTimer(1)
    end

    -- === WS closed ===
    if event == "websocket_closed" then
        print("WS closed, reconnecting...")
        ws = connect()
    end
end