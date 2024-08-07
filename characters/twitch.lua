local twitch = {}

local utils = require("utils")

twitch.name = [[
==================================================================================
|TWITCH                                                                          |
|                                                                                |
|Nome verdadeiro: Emmanuelle Pichon                                              |
==================================================================================
]]

twitch.desc = [[
==================================================================================
|Biografia:                                                                      |
|                                                                                |
|Nascida em Nancy, França, Pichon ingressou nas Forças Armadas Francesas, onde   |
|se especializou em eletrônica e tecnologia de drones. Sua habilidade com        |
|equipamentos eletrônicos a levou a ser recrutada pelo GIGN, onde desenvolveu    |
|o drone de choque conhecido como "RSD Model 1". Com sua engenhosidade e         |
|talento para a inovação, Twitch é uma operadora versátil que consegue neutralizar|
|dispositivos eletrônicos inimigos e fornecer informações cruciais para sua      |
|equipe.                                                                         |
|                                                                                |
==================================================================================
]]

--definitions
MaxHealth = 10
Health = 10
Dmg = 4
Defense = 4
Speed = 8

AdrenalSurge = 3 

twitch.stats = [[

===================================================================================
| Atributos:                                                                      |
|                                                                                 |
| Vida:        ]] .. utils.getProgressBar(Health) .. [[                           |
| Dano:   ]] .. utils.getProgressBar(Dmg)  .. [[                                  |
| Defesa:       ]] .. utils.getProgressBar(Defense)  .. [[                        |
| Velocidade:  ]] .. utils.getProgressBar(Speed) .. [[                            |
|                                                                                 |
| Habilidades especiais:                                                          |
| - Drone de choque: Desativa uma habilidade aleatoria do oponente na proxima     |
| rodada.                                                                         |
|                                                                                 |
===================================================================================
]]
return twitch
