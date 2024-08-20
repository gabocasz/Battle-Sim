local fenrir = {}

local utils = require("utils")

fenrir.name = [[
===================================================================================
|                          ⚠️ INIMIGO IDENTIFICADO ⚠️                               |
|                                   FENRIR                                        |
|                                                                                 |
| Nome verdadeiro: Sköll Ormr                                                     |
===================================================================================
]]

fenrir.desc = [[

===================================================================================
| Biografia:                                                                      |
|                                                                                 |
| Fenrir, ou Sköll Ormr, é um guerreiro lendário nascido nas profundezas          |
| das florestas geladas da Noruega. Crescendo em meio à escuridão e aos           |
| contos de lobos selvagens, Fenrir rapidamente ganhou notoriedade por sua        |
| força sobre-humana e sua habilidade inata para a guerra. Seu nome verdadeiro,   |
| Sköll Ormr, foi abandonado quando ele se tornou o líder de um clã que           |
| venerava as antigas divindades nórdicas, adotando o nome do lobo gigante        |
| da mitologia que está destinado a devorar o mundo.                              |
|                                                                                 |
| Fenrir é conhecido por sua brutalidade e sua capacidade de aterrorizar          |
| até os mais experientes guerreiros. Ele veste uma armadura pesada feita das     |
| peles de lobos que ele mesmo caçou, e sua arma preferida é um enorme martelo    |
| de guerra, forjado no coração de um vulcão por ferreiros que agora estão        |
| mortos. Diz-se que ele tem um pacto com as forças das trevas, concedendo-lhe    |
| habilidades sobre-humanas, como uma regeneração acelerada e força descomunal.   |
|                                                                                 |
| Durante suas inúmeras campanhas de saque, Fenrir destruiu vilarejos inteiros,   |
| deixando apenas ruínas e lendas de terror por onde passou. Sua presença no      |
| campo de batalha é marcada pelo uivo de lobos, um presságio de morte certa.     |
|                                                                                 |
| Fenrir não apenas luta por poder, mas também por um desejo profundo de          |
| caos e destruição. Ele acredita que a ordem do mundo deve ser quebrada e        |
| refeita, e ele se vê como o agente dessa mudança cataclísmica.                  |
|                                                                                 |
===================================================================================

E hora de eliminar essa ameaca!
]]


--definitions
fenrir.MaxHealth = 15
fenrir.Health = 15
fenrir.Dmg = 5
fenrir.Defense = 5
fenrir.Speed = 4

fenrir.maxHealUses = 3
fenrir.healUses = 0

fenrir.fearMines = 2




fenrir.stats = [[

==================================================================================
| Atributos:                                                                     |
|                                                                                |
| Vida:         ]] .. utils.getProgressBar(fenrir.Health) .. [[                                                       |
| Dano:         ]] .. utils.getProgressBar(fenrir.Dmg)  .. [[                                                       |    
| Defesa:       ]] .. utils.getProgressBar(fenrir.Defense)  .. [[                                                       |
| Velocidade:   ]] .. utils.getProgressBar(fenrir.Speed) .. [[                                                       |
|                                                                                |
==================================================================================
]]

fenrir.ability = [[

==================================================================================
| Habilidade Especial: Minas de Pavor                                             |
|                                                                                 |
| Fenrir coloca minas invisíveis no campo de batalha. Quando ativadas,            |
| essas minas liberam uma onda de terror que consome os corações dos              |
| inimigos, reduzindo drasticamente seu status de velocidade.                     |
|                                                                                 |
==================================================================================
]]
return fenrir 