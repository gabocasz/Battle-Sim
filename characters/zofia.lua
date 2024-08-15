local zofia = {}

local utils = require("utils")

zofia.name = [[
====================================================================================
|ZOFIA                                                                             |
|                                                                                  |
|Nome verdadeiro:Zofia Bosak                                                       |
====================================================================================
]]  

zofia.desc = [[

====================================================================================
|Biografia:                                                                        |
|                                                                                  |
|“Não é sobre onde você vai parar. É sobre como transforma isso no seu lar.”       |
|                                                                                  |
|Zofia Bosak é a filha mais velha de Jan Bosak, respeitado ex-comandante das Forças|
|de Operações Especiais Polonesas, GROM. Ela mostrou um ótimo desempenho nos       |
|exercícios de treinamento extracurriculares do seu pai e aprendeu diversas        |
|técnicas, incluindo algumas questionáveis. A atitude excepcional da Zofia a fez   |
|passar nos testes de seleção da GROM com pontuações altíssimas. Ela desenvolveu   |
|habilidades extensas, muito além de combate corpo a corpo e precisão de tiro,     |
|principalmente sobrevivência, sabotagem, extração de alvo e medicina de campo.    |
|Motivada para ser o soldado de melhor performance dentre todas as unidades, Zofia |
|mostra um foco ímpar em todas as suas operações. Esse foco a possibilitou evacuar |
|centenas de civis, incluindo crianças, sozinha durante uma missão de resgate na   |
|Guatemala. Desde então, ela vem ganhando inúmeros prêmios e o respeito dos seus   |
|companheiros e superiores. Zofia se destaca como uma pensadora lateral com        |
|experiência operacional decisiva e agressiva, além de ter um histórico impecável  |
|em campo e fora dele.                                                             |
|                                                                                  |
====================================================================================
]]

--definitions 
MaxHealth = 10
Health = 10
Dmg = 7
Defense = 3
Speed = 5

ImpactGranades = 2
ConcussionGranades = 2

AdrenalSurge = 3 

zofia.stats = [[

===================================================================================
| Atributos:                                                                      |
|                                                                                 |
| Vida:         ]] .. utils.getProgressBar(Health) .. [[                                                        |
| Dano:         ]] .. utils.getProgressBar(Dmg)  .. [[                                                        |
| Defesa:       ]] .. utils.getProgressBar(Defense)  .. [[                                                        |
| Velocidade:   ]] .. utils.getProgressBar(Speed) .. [[                                                        |
|                                                                                 |
| Habilidades especiais:                                                          |
| - KS79 LIFELINE: Zofia utiliza de um lanca granadas que pode alternar entre     |
| Granadas de impacto e granadas atordoantes.                                     |
===================================================================================
]]
return zofia





