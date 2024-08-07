local actions = {}

actions.list = {}

function actions.build()
    actions.list{}

    --Atacar
    local attack = {
        description = "Atacar",
        requirement = nil,

        execute = function(playerData, bossData)
        --definir chance de sucesso
        local successChance = bossData.Speed == 0 and 1 or playerData.Speed / bossData.Speed
        local success = math.random() <= successChance

        --calcular dano
        local rawDamage = playerData.Dmg - math.random() * bossData.Defense
        local damage = math.max(1, math.ceil(rawDamage))

        --apresentar resultado
        if success then
            print(string.format("Voce atacou Fenrir e causou %d pontos de dano!", damage))
            bossData.Health = bossData.Health - damage
        else
            print("Voce tenta atacar, mas a furia de Fenrir o fez desviar, te deixando no chao!")
        end
    end
    }

    --sistema de cura
    local adrenalSurge = {
        description = "Chama o reforco adrenal de Finka, Curando 5 pontos de vida.",
        requirement = function (playerData, bossData)
            return playerData.AdrenalSurge >= 1
        end,

            execute = function(playerData, bossData)
                --tirar a adrenal do inventario
                playerData.AdrenalSurge = playerData.AdrenalSurge - 1

                --recupera a vida do jogador
                local regenPoints = 5
                playerData.Health = math.min(playerData.MaxHealth, playerData.Health + regenPoints)
                print(string.format("Voce usou o reforco de Finka e recuperou %d pontos de vida!", regenPoints))
            
        end


    }

    --populate list
    actions.list[#actions.list + 1] = attack
end