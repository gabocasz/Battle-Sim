local utils = require("utils")
local fenrir = require("boss.fenrir")
local actions = require("player.actions")

-- Habilitar o UTF-8
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

-- Função principal para iniciar o loop de batalha
local function battleLoop(player, fenrir)
    print("A batalha começou!")
    print(fenrir.name)
    print(fenrir.desc)
    print(fenrir.stats)
    print(fenrir.ability)

    while fenrir.Health > 0 and Health > 0 do
        -- Exibe o status atual do jogador e de Fenrir
        print(string.format("\nStatus do Jogador: Vida: %d/%d | Usos de Adrenal Surge: %d", Health, MaxHealth, AdrenalSurge))
        print(string.format("Status de Fenrir: Vida: %d/%d", fenrir.Health, fenrir.MaxHealth))

        -- Oferece ao jogador uma escolha de ação
        print("\nO que você deseja fazer?")
        print("1. Atacar")
        print("2. Usar Adrenal Surge")
        print("3. Habilidade em Desenvolvimento")
        local choice = utils.ask()

        if choice == 1 then
            actions.dealDamage(player)
        elseif choice == 2 then
            actions.adrenalSurge(player)
        elseif choice == 3 then
            actions.ability(player)
        else
            print("Escolha inválida! Por favor, selecione 1, 2 ou 3.")
        end

        -- Verifica se a batalha deve continuar
        if fenrir.Health <= 0 then
            print("Parabéns! Você derrotou Fenrir e salvou o mundo do Ragnarok!")
            break
        elseif Health <= 0 then
            print("Você foi derrotado por Fenrir. O Ragnarok começou...")
            break
        end

        -- Ação do boss após o turno do jogador
        actions.bossTakeAction(player)

        -- Verifica novamente se a batalha deve continuar após a ação do boss
        if Health <= 0 then
            print("Você foi derrotado por Fenrir. O Ragnarok começou...")
            break
        elseif fenrir.Health <= 0 then
            print("Parabéns! Você derrotou Fenrir e salvou o mundo do Ragnarok!")
            break
        end
    end
end

-- Início do jogo
printHeader()
utils.displayIntro()

-- Escolha do personagem
local player = utils.characterChooser()

-- Verificação do player
if player then
    print("Player selecionado:", player.name)
else
    print("Nenhum player foi selecionado.")
end

-- Verifica se o jogador foi corretamente definido antes de iniciar a batalha
if player then
    battleLoop(player, fenrir)
else
    print("Erro: Nenhum personagem foi selecionado.")
end
