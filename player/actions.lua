local actions = {}

local fenrir = require("boss.fenrir")
local utils  = require("utils")
local montShield = false
local twDrone = false

-- NECESSITA BALANCEAMENTO
-- montagne dando 1 de dano....

function actions.dealDamage(player)
    if montShield then
        print([[
        ============================================
        |                                          |
        | Você não pode atacar com o escudo ativo! |
        |                                          |
        ============================================]])
        print("")
        actions.playerTurn()
        return
    end
    print([[
==========================================
| SEU TURNO                              |
|                                        |]])
    local successChance = fenrir.Speed == 0 and 1 or Speed / fenrir.Speed
    local success = math.random() <= successChance

    local rawDamage = Dmg - math.random() * fenrir.Defense
    local damage = math.max(1, math.ceil(rawDamage))

    if success then
        fenrir.Health = fenrir.Health - damage

        print("| "..string.format("Você atacou Fenrir e causou %d de dano! |", damage))
        print("==========================================")
        print("")
    else
        print("| Você errou o ataque!                   |")
        print("==========================================")
        print("")
    end
end

function actions.adrenalSurge(player)
    print([[
==========================================
| SEU TURNO                              |
|                                        |]])
    if AdrenalSurge > 0 then
        if Health < MaxHealth then
            local healing = math.min(5, MaxHealth - Health)
            Health = Health + healing
            AdrenalSurge = AdrenalSurge - 1
           
            print("| Você contatou Finka!                   |")
            print("| Cura recebida: "..healing.."                       |")
            print("| Usos restantes: "..AdrenalSurge.."                      |")
            print("==========================================")
            print("")
        else
            print("| Sua vida já está cheia.                |")
            print("==========================================")
            print("")
            actions.playerTurn()
        end
    else
        print("| O estoque de Adrenal Surge acabou      |")
        print("")
        actions.playerTurn()
    end
end

function actions.ability()
    -- Verifica se o player está definido e é válido
    if not player or not player.name then
        print([[
==========================================
| SEU TURNO                              |
| debug                                  |]])
        print("| Você não pode usar essa habilidade!    |")
        print("==========================================")
        print(montShield)
        print(player)
        actions.playerTurn()
        return
    end

    if player.name == "Sledge" then
        if DemoHammer > 0 then
            print([[
==========================================
| SEU TURNO                              |
|                                        |]])
            print("| Você usa a marreta de demolição.       |")
            print("| A defesa de Fenrir diminui pela metade.|")
            print("| Usos restantes: " .. DemoHammer .. "/2                    |")
            print("==========================================")
            print("")
            fenrir.Defense = fenrir.Defense / 2
            DemoHammer = DemoHammer - 1
        else
            print([[
==========================================
| SEU TURNO                              |
|                                        |]])
            print("| Sua marreta quebrou!                   |")
            print("==========================================")
            print("")
            actions.playerTurn()  -- Redefine o turno do jogador
        end

    elseif player.name == "Montagne" then
        if not player or not player.name then
            montShield = false
        end
        if montShield then
            print([[
        ==============================================
        |                                            |
        | Você recolhe o escudo e agora pode atacar. |
        |                                            |
        ==============================================]])
            print("")
            actions.playerTurn()
            return false
        else
            montShield = true
            print([[
        ================================================
        |                                              |
        | Você estende o escudo e não pode levar dano! |
        |                                              |
        ================================================]])
            print("")
            actions.playerTurn()
            return true
        end

    elseif player.name == "Zofia" then
        print([[
          =============================
          | Qual granada deseja usar? |
          | 1. Granadas de impacto     |
          | 2. Granadas de concussão  |
          =============================]])
        
        local answer = utils.ask()
        
        if answer == 1 then
            if ImpactGranades > 0 then
                fenrir.Health = fenrir.Health - 5
                ImpactGranades = ImpactGranades - 1
                print([[
=================================================================
| SEU TURNO                                                     |
|                                                               |]])
                print("| Você joga uma granada de impacto e causa 5 de dano!          |")
                print("| Granadas restantes: " .. ImpactGranades .. "                 |")
                print("=================================================================")
            else
                print("| Você não possui granadas de impacto.                          |")
                print("=================================================================")
                actions.playerTurn()
            end

        elseif answer == 2 then
            if ConcussionGranades > 0 then
                fenrir.Speed = fenrir.Speed - 2
                ConcussionGranades = ConcussionGranades - 1
                print([[
=================================================================
| SEU TURNO                                                     |
|                                                               |]])
                print("| Você joga uma granada de concussão.                          |")
                print("| A velocidade de Fenrir foi reduzida em 2.                    |")
                print("| Granadas restantes: " .. ConcussionGranades .. "             |")
                print("=================================================================")
            else
                print("| Você não possui granadas de concussão.                        |")
                print("=================================================================")
                actions.playerTurn()
            end
        else
            print("Escolha inválida. Tente novamente.")
            actions.playerTurn()
        end

    elseif player.name == "Twitch" then
        if not twDrone then
            if TwDronesLeft > 0 then
                print([[
==========================================
| SEU TURNO                              |
|                                        |]])
                print("| Twitch usa o drone de choque!          |")
                print("| Fenrir não pode usar sua habilidade.   |")
                print("==========================================")
                print("")
                twDrone = true  -- Ativa a habilidade
                TwDronesLeft = TwDronesLeft - 1
            else
                print([[
            ========================================
            |                                      | 
            | Você não possui drones de choque.    | 
            |                                      | 
            ========================================]])
                print("")
            end
        end

    else
        print([[
==========================================
| SEU TURNO                              |
|                                        |]])
        print("| Você não pode usar essa habilidade!    |")
        print("==========================================")
        actions.playerTurn()
    end
end

-- Oferece ao jogador uma escolha de ação
function actions.playerTurn(player)
    if twDrone then
        print("A habilidade de Twitch terminou.")
        twDrone = false
    end
    print("==============================")
    print("| O que você deseja fazer?   |")
    print("| 1. Atacar                  |")
    print("| 2. Usar Adrenal Surge      |")
    print("| 3. Habilidade              |")
    print("==============================")
    local choice = utils.ask()

    if choice == 1 then
        actions.dealDamage(player)
    elseif choice == 2 then
        actions.adrenalSurge(player)
    elseif choice == 3 then
        actions.ability()
        if actions.ability == false then
            if not player or not player.name then
                print("yummers")
            end
            print("Você não pode mais usar essa habilidade")
        end
    else
        print("Escolha inválida! Por favor, selecione 1, 2 ou 3.")
    end
end

-- Ações do Boss
function actions.bossAttack()
    if montShield then
        actions.bossTakeAction()
        return
    end

    -- Calcula a chance de sucesso baseada na velocidade de Fenrir e do jogador
    local successChance = Speed == 0 and 1 or fenrir.Speed / Speed
    local success = math.random() <= successChance

    if success then
        print([[
==========================================
| TURNO DO BOSS                          |
|                                        |]])
        local damage = fenrir.Dmg
        Health = Health - damage
        print("| Fenrir ataca você e causa "..damage.." de dano!   |")
        print("==========================================")
        print("")
    else
        print([[
==========================================
| TURNO DO BOSS                          |
|                                        |]])
        print("| Fenrir tentou atacar, mas errou!       |")
        print("==========================================")
        print("")
    end
end

function actions.bossHeal()
    if fenrir.healUses >= fenrir.maxHealUses then
        print([[
==========================================
| TURNO DO BOSS                          |
|                                        |]])
        print("| Fenrir não pode mais se curar.          |")
        print("==========================================")
        print("")
        actions.bossTakeAction()
        return
    end

    if fenrir.Health < fenrir.MaxHealth then
        print([[
==========================================
| TURNO DO BOSS                          |
|                                        |]])
        local healing = 5
        fenrir.Health = math.min(fenrir.MaxHealth, fenrir.Health + healing)
        fenrir.healUses = fenrir.healUses + 1 -- Incrementa o contador de curas usadas
        print("| Fenrir se cura em 5 de vida!           |")
        print(string.format("| Vida atual: %d/%d                      |", fenrir.Health, fenrir.MaxHealth))
        print(string.format("| Limite de usos: %d/%d                  |", fenrir.healUses, fenrir.maxHealUses))
        print("==========================================")
        print("")
    else
        actions.bossTakeAction()
    end
end

function actions.bossFearMines()
    if twDrone then
        actions.bossTakeAction()
        return
    end
    if fenrir.fearMines == nil then
        fenrir.fearMines = 3 -- Redefine para o valor padrão se estiver nil
    end
    if fenrir.fearMines > 0 then
        Speed = math.max(1, Speed - 1)
        fenrir.fearMines = fenrir.fearMines - 1 -- Decrementa o contador de uso das Minas de Pavor
        print([[
==========================================
| TURNO DO BOSS                          |
|                                        |]])
        print("| Fenrir usa minas de pavor!             |")
        print("| Sua velocidade foi diminuída em 1.     |")
        print("| Velocidade atual: "..Speed.."                    |")
        print("| Usos restantes: "..fenrir.fearMines.."                       |")        
        print("==========================================")
        print("")

    else
        actions.bossTakeAction() -- Chama outra ação caso as Minas de Pavor estejam esgotadas
    end
end

function actions.bossTakeAction(player)
    local actionsList = {"bossAttack", "bossHeal", "bossFearMines"}
    local attempts = 3 -- Limita o número de tentativas para evitar loop infinito

    while attempts > 0 do
        local choice = actionsList[math.random(#actionsList)]

        if choice == "bossAttack" then
            actions.bossAttack()
            return -- Termina o loop após uma ação válida
        elseif choice == "bossHeal" and fenrir.healUses < fenrir.maxHealUses then
            actions.bossHeal()
            return -- Termina o loop após uma ação válida
        elseif choice == "bossFearMines" and fenrir.fearMines > 0 then
            actions.bossFearMines()
            return -- Termina o loop após uma ação válida
        end

        attempts = attempts - 1
    end

    -- Se nenhuma ação for válida após todas as tentativas, o boss não faz nada
    print([[
        ==========================================
        | TURNO DO BOSS                          |
        |                                        |
        | Fenrir fica sem opções e não faz nada! |
        ==========================================]])    
end

return actions
