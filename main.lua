local utils = require("utils")
local fenrir = require("boss.fenrir")
local actions = require("player.actions")

-- Habilitar o UTF-8 para garantir a compatibilidade com caracteres especiais
utils.enableUtf8()

-- Função para exibir o cabeçalho inicial do jogo
local function printHeader()
    print([[
================================================================================
|                                                                              |
|                               BATTLE SIM. 1.0                                |
|                                                                              |
|                                                                              |
|                                                                              |
|                                                                              |
| by: gaboca :D                                                                |
================================================================================
]])
end 

-- Função principal para iniciar o loop de batalha
local function battleLoop(player, fenrir)
    print("A batalha começou!")
    print(fenrir.name)  -- Exibe o nome do boss
    print(fenrir.desc)  -- Exibe a descrição do boss
    print(fenrir.stats) -- Exibe as estatísticas iniciais do boss
    print(fenrir.ability) -- Exibe a habilidade especial do boss

    -- Loop da batalha, continua até que um dos lados tenha a vida zerada
    while fenrir.Health > 0 and Health > 0 do
        -- Exibe o status atual do jogador e de Fenrir
        print([[
===============================================================
| STATUS                                                      |           
|                                                             |]])                                  
        print(string.format("| Status do Jogador: Vida: %d/%d | Usos de Adrenal Surge: %d   |", Health, MaxHealth, AdrenalSurge))
        print(string.format("| Status de Fenrir: Vida: %d/%d                               |", fenrir.Health, fenrir.MaxHealth))
        print("===============================================================")
        print("")

        -- Dá ao jogador uma opção de escolha de ação
        actions.playerTurn(player)

        -- Verifica se a batalha deve continuar
        if fenrir.Health <= 0 then
            print("===============================================================")
            print("| VITÓRIA!!                                                   |")
            print("|                                                             |")
            print("| Parabéns! Você derrotou Fenrir e salvou o mundo do Ragnarok!|")
            print("===============================================================")
            break
        elseif Health <= 0 then
            print("==============================================================")
            print("| DERROTA...                                                 |")
            print("|                                                            |")
            print("| Você foi derrotado por Fenrir. O Ragnarok começou...       |")
            print("==============================================================")
            break
        end

        -- Ação do boss após o turno do jogador
        actions.bossTakeAction(player)

        -- Verifica novamente se a batalha deve continuar após a ação do boss
        if Health <= 0 then
            print("==============================================================")
            print("| DERROTA...                                                 |")
            print("|                                                            |")
            print("| Você foi derrotado por Fenrir. O Ragnarok começou...       |")
            print("==============================================================")
            break
        elseif fenrir.Health <= 0 then
            print("===============================================================")
            print("| VITÓRIA!!                                                   |")
            print("|                                                             |")
            print("| Parabéns! Você derrotou Fenrir e salvou o mundo do Ragnarok!|")
            print("===============================================================")
            break
        end
    end
end

-- Início do jogo: exibe o cabeçalho e a introdução
printHeader()
utils.displayIntro()

-- Escolha do personagem pelo jogador
local player = utils.characterChooser()

-- Inicia o loop da batalha entre o jogador e Fenrir
battleLoop(player, fenrir)
