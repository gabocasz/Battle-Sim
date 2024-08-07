local sledge = {}

local utils = require("utils")

sledge.name = [[
==================================================================================
|SLEDGE                                                                          |
|                                                                                |
|Nome verdadeiro: Seamus Cowden                                                  |
==================================================================================
]]  

sledge.desc = [[
==================================================================================
|Biografia:                                                                      |
|                                                                                |
|Nascidos no norte da Escócia, o pai militar e a mãe enfermeira de               |
|Cowden se mudaram para Iverness com ele e seus três irmãos quando ele tinha     |
|cinco anos. Seu perfil atlético o promoveu a capitão da Seleção Nacional de     |
|Rugby sub-20 escocesa em 1998. Seguindo a longa tradição militar da família,    |
|Cowden ingressou na 3ª Divisão Mecanizada do Reino Unido que compõe o Exército  |
|Britânico. Sua motivação e porte físico se adequaram ao apelido histórico da    |
|divisão de “Ironsides”. A primeira missão de Cowden foi como membro da Divisão  | 
|Blindada, onde estudou engenharia e se especializou no aprimoramento de veículos|
|de combate da infantaria. A partir daí, ele desenvolveu várias táticas de       |
|demolição. Ele então foi recrutado pelo S.A.S, onde quebrou vários recordes     |
|de velocidade e força. Especialista em mecânica, balística e estratégias de     |
|demolição térmica, Cowden é o agente ideal quando o assunto é destruir com      |
|rapidez e relativo silencio.                                                    |
|                                                                                |
==================================================================================
]]

--definitions
MaxHealth = 10
Health = 10
Dmg = 5
Defense = 5
Speed = 3

AdrenalSurge = 3 

sledge.stats = [[

===================================================================================
| Atributos:                                                                      |
|                                                                                 |
| Vida:         ]] .. utils.getProgressBar(Health) .. [[                                                        |
| Dano:         ]] .. utils.getProgressBar(Dmg)  .. [[                                                        |
| Defesa:       ]] .. utils.getProgressBar(Defense)  .. [[                                                        |
| Velocidade:   ]] .. utils.getProgressBar(Speed) .. [[                                                        |
|                                                                                 |
| Habilidades especiais:                                                          |
| - Marreta de demolição:Quebra a defesa do oponente pela metade no proximo round.|
|                                                                                 |
===================================================================================
]]
return sledge
