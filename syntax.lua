local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
setclipboard("https://discord.gg/vmMUuGqQE3")

local GameScripts = {
    [130526979296684] = {name = "+1 Age Every Click", url = "https://raw.githubusercontent.com/"},
    [987654321] = {name = "Clicker Sim", url = "https://githubusercontent.com"}
}

local placeId = game.PlaceId

local Window = Rayfield:CreateWindow({
   Name = "SYNTAX AUTHENTICATION",
   LoadingTitle = "Syntax Systems",
   LoadingSubtitle = "by ares",
   
   Discord = {
      Enabled = true,
      Invite = "vS7JrjTm", 
      RememberJoins = true 
   },

   KeySystem = true,
   KeySettings = {
      Title = "Access Required",
      Subtitle = "Key System",
      Note = "Link copied to clipboard! Paste in browser (CTRL+V)",
      SaveKey = false,
      Key = {"fag!"}
   }
})

local scriptData = GameScripts[placeId]

if scriptData then
    Rayfield:Notify({
        Title = "Access Granted",
        Content = "Loading " .. scriptData.name .. "...",
        Duration = 5,
    })

    task.wait(1.5)
    Rayfield:Destroy()
    loadstring(game:HttpGet(scriptData.url))()
else
    Rayfield:Destroy()
    task.wait(0.5)
    game.Players.LocalPlayer:Kick("\n[SYNTAX SYSTEMS]\n\nAccess Denied.\n\nReason: Game [" .. placeId .. "] is unsupported.")
end
