--[[
================================================================================
|                                                                              |
|                               BATTLE SIM. 1.0                                |
|                                                                              |
|                                                                              |
|                                                                              |
|                                                                              |
|by:gaboca :D                                                                  |
================================================================================
| Selecione seu personagem
| 
| 1.Sledge :sword:
| 2.Montagne :shield:
| 3.Zofia :bomb:
| 4.Twitch :sneaky:
|
|
]]

local utils = require("utils")
local boss = require("boss.fenrir")
local actions = require("player.actions")


--habilitar o utf 8
utils.enableUtf8()

local function printHeader()
    print([[
================================================================================
|                                                                              |
|                               BATTLE SIM. 1.0                                |
|                                                                              |
|                                                                              |
|                                                                              |
|                                                                              |
|by:gaboca :D                                                                  |
================================================================================
]])
end 

printHeader()
utils.start()
utils.displayIntro()
print("")
print("")

utils.characterChooser()




