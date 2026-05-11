local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local GameScripts = {
    [130526979296684] = {name = "+1 Age Every Click", url = "https://raw.githubusercontent.com/aresSB/SyntaxHub/refs/heads/main/ageup.lua"},
    [112259901434347] = {name = "Be a Lucky Block", url = "https://raw.githubusercontent.com/aresSB/SyntaxHub/refs/heads/main/luckyblock.lua"}
}

local placeId = game.PlaceId
local scriptData = GameScripts[placeId]

if scriptData then
    local Window = Rayfield:CreateWindow({
       Name = "SYNTAX AUTHENTICATION",
       LoadingTitle = "Syntax Systems",
       LoadingSubtitle = "by ares",
       KeySystem = true,
       KeySettings = {
          Title = "Access Required",
          Subtitle = "Enter Key",
          Note = "Key is: fag!",
          SaveKey = false,
          Key = {"fag!"}
       }
    })

    -- This function runs ONLY after the user enters the correct key
    _G.SyntaxAccessKey = "SECRET_KEY_123" 

    Rayfield:Notify({
        Title = "Access Granted",
        Content = "Loading " .. scriptData.name .. "...",
        Duration = 3,
    })

    task.wait(2)
    
    -- Destroy the Auth window before loading the next Rayfield script
    Rayfield:Destroy() 
    task.wait(0.5) -- Give it a moment to clear the UI from memory
    
    -- Load the game script
    local success, err = pcall(function()
        loadstring(game:HttpGet(scriptData.url))()
    end)

    if not success then
        warn("Syntax Loader Error: " .. err)
    end
else
    -- Fallback if game is not supported
    game.Players.LocalPlayer:Kick("\n[SYNTAX SYSTEMS]\n\nUnauthorized Experience Detected.")
end
