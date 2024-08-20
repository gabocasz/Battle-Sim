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
MaxHealth = 15
Health = 15
Dmg = 3
Defense = 9
Speed = 3 

AdrenalSurge = 3

montagne.stats = [[

==================================================================================
| Atributos:                                                                     |
|                                                                                |
| Vida:        ]] .. utils.getProgressBar(Health ) .. [[                                                        |
| Dano:        ]] .. utils.getProgressBar(Dmg    ) .. [[                                                        |
| Defesa:      ]] .. utils.getProgressBar(Defense) .. [[                                                        |
| Velocidade:  ]] .. utils.getProgressBar(Speed  ) .. [[                                                        |
|                                                                                |
| Habilidades especiais:                                                         |
| - Escudo LeRoc: Nega totalmente o dano recebido na proxima rodada.             |
|                                                                                |
|                                                                                |
==================================================================================
]]
return montagne