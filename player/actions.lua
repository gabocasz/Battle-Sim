local actions = {}

local fenrir = require("boss.fenrir")
local utils  = require("utils")

--NECESSITA BALANCEAMENTO
--montagne dando 1 de dano....

function actions.dealDamage(player)
    local successChance = fenrir.Speed == 0 and 1 or Speed / fenrir.Speed
    local success = math.random() <= successChance

    local rawDamage = Dmg - math.random() * fenrir.Defense
    local damage = math.max(1, math.ceil(rawDamage))

    if success then
        fenrir.Health = fenrir.Health - damage
        print(string.format("Você atacou Fenrir e causou %d de dano!", damage))
    else
        print("Você errou o ataque!")
    end
end

function actions.adrenalSurge(player)
    if AdrenalSurge > 0 then
        if Health < MaxHealth then
            local healing = math.min(5, MaxHealth - Health)
            Health = Health + healing
            AdrenalSurge = AdrenalSurge - 1
            print(string.format("Você contatou Finka! Hora do Adrenal Surge! Cura: +%d de vida. Vida atual: %d/%d.", healing, Health, MaxHealth))
            print(string.format("Usos restantes de Adrenal Surge: %d.", AdrenalSurge))
        else
            print("Sua vida já está cheia. Não é necessário usar Adrenal Surge.")
        end
    else
        print("O estoque de Adrenal Surge de Finka acabou.")
    end 
end

-- Nova função: Habilidade em Desenvolvimento
function actions.ability(player)
    if player.name == "Sledge" then
        print("Sledge prepara uma nova técnica de demolição... Em breve, ela estará disponível!")
    elseif player.name == "Montagne" then
        print("Montagne está desenvolvendo um escudo de energia. Aguarde por novidades!")
    elseif player.name == "Zofia" then
        

    print([[Qual granada deseja usar?
          1.Granadas de impacto
          2.Granadas de concussao]])

        local answer = utils.ask()

        if answer == 1 then
            if ImpactGranades > 0 then
                fenrir.Health = fenrir.Health - 5
                ImpactGranades = ImpactGranades - 1
                print(string.format("voce jogou uma granada de impacto, granadas de impacto restantes:%d.", ImpactGranades))
            else
                print("voce nao tem granadas de impacto")
            end

        end

        if answer == 2 then
            if ConcussionGranades > 0 then
            fenrir.Speed = fenrir.Speed - 2
            ConcussionGranades = ConcussionGranades - 1
            print(string.format("voce jogou uma granada de concussao, granadas de concussao restantes:%d | Velocidade inimiga atual:%d.", ConcussionGranades, fenrir.Speed))
        else
            print("voce nao tem granadas de concussao")
        end
    end

    elseif player.name == "Twitch" then
        print("Twitch está ajustando um novo tipo de drone. Logo será funcional!")
    else
        print("Esta habilidade ainda está em desenvolvimento. Em breve, ela estará disponível!")
    end
end

-- Ações do Boss
function actions.bossAttack()
    -- Calcula a chance de sucesso baseada na velocidade de Fenrir e do jogador
    local successChance = Speed == 0 and 1 or fenrir.Speed / Speed
    local success = math.random() <= successChance

    if success then
        local damage = fenrir.Dmg
        Health = Health - damage
        print(string.format("Fenrir ataca você e causa %d de dano! Vida atual: %d/%d.", damage, Health, MaxHealth))
    else
        print("Fenrir tentou atacar, mas errou!")
    end
end

function actions.bossHeal()
    if fenrir.healUses >= fenrir.maxHealUses then
        print("Fenrir não pode mais se curar. Ele já atingiu o limite de curas!")
        return
    end

    if fenrir.Health < fenrir.MaxHealth then
        local healing = 5
        fenrir.Health = math.min(fenrir.MaxHealth, fenrir.Health + healing)
        fenrir.healUses = fenrir.healUses + 1 -- Incrementa o contador de curas usadas
        print(string.format("Fenrir se cura em %d pontos de vida. Vida atual de Fenrir: %d/%d. Curas restantes: %d/%d.", 
            healing, fenrir.Health, fenrir.MaxHealth, fenrir.maxHealUses - fenrir.healUses, fenrir.maxHealUses))
    else
        actions.bossTakeAction()
    
    end
end


function actions.bossFearMines()
    if fenrir.fearMines == nil then
        fenrir.fearMines = 3 -- Redefine para o valor padrão se estiver nil
    end
    if fenrir.fearMines > 0 then
        Speed = math.max(1, Speed - 1)
        fenrir.fearMines = fenrir.fearMines - 1 -- Decrementa o contador de uso das Minas de Pavor
        print(string.format("Fenrir usa Minas de Pavor! Sua velocidade foi reduzida em 1. Velocidade atual: %d. Usos restantes: %d/3.", 
            Speed, fenrir.fearMines))
    else
        actions.bossTakeAction() -- Chama outra ação caso as Minas de Pavor estejam esgotadas
    end
end



function actions.bossTakeAction(player)
    local actionsList = {"bossAttack", "bossHeal", "bossFearMines"}
    local choice = actionsList[math.random(#actionsList)]

    if choice == "bossAttack" then
        actions.bossAttack()
    elseif choice == "bossHeal" then
        actions.bossHeal()
    elseif choice == "bossFearMines" then
        actions.bossFearMines()
    end
end
return actions
