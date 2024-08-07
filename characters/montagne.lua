local montagne = {}

local utils = require("utils")

montagne.name = [[
==================================================================================
|MONTAGNE                                                                        |
|                                                                                |
|Nome verdadeiro: Gilles Touré                                                   |
==================================================================================
]]  

montagne.desc = [[
==================================================================================
|Biografia:                                                                      |
|                                                                                |
|Nascido em Bordéus, França, Touré serviu nas Forças Armadas Francesas antes     |
|de se juntar à GIGN. Ele rapidamente se destacou por sua habilidade em          |
|operações de defesa e proteção, ganhando o apelido de "Montagne" (Montanha).    |
|Sua presença imponente e seu escudo balístico são uma linha de defesa quase     |
|impenetrável, proporcionando cobertura e segurança para seus companheiros.      |
|Ele é conhecido por sua lealdade e dedicação à equipe, sempre na linha de       |
|frente para proteger e servir.                                                  |
|                                                                                |
==================================================================================
]]

--definitions
montagne.MaxHealth = 15
montagne.Health = 15
montagne.Dmg = 3
montagne.Defense = 9
montagne.Speed = 3 

montagne.stats = [[

==================================================================================
| Atributos:                                                                     |
|                                                                                 |
| Vida:        ]] .. utils.getProgressBar(character.Health) .. [[                             |
| Dano:   ]] .. utils.getProgressBar(character.Dmg)  .. [[                             |
| Defesa:       ]] .. utils.getProgressBar(character.Defense)  .. [[                             |
| Velocidade:  ]] .. utils.getProgressBar(character.Speed) .. [[                             |
|                                                                                 |
| Habilidades especiais:                                                          |
| - Escudo LeRoc: Nega totalmente o dano recebido na proxima rodada.              |
|                                                                                 |
|                                                                                 |
===================================================================================
]]

return montagne