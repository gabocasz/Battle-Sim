local utils = {}


--habilitar utf 8 
function utils.enableUtf8()
    os.execute("chcp 65001")
    
end

utils.enableUtf8()

--barra de progresso
function utils.getProgressBar(attribute)
    local fullChar = "▰"
    local emptyChar = "▱"
    
    local result = ""
    for i = 1, 10, 1 do
        if i <= attribute then
            result = result .. fullChar
        else
            result = result .. emptyChar
    
        end
    end
    return result
end

-- Função para formatar a string com a primeira letra maiúscula
local function capitalize(str)
    return str:sub(1, 1):upper() .. str:sub(2):lower()
end

-- Função para carregar o personagem escolhido e verificar se ele é válido
function utils.loadCharacter(name)
    local path = "characters." .. name
    local success, character = pcall(require, path)
    if success then
        print(character.name)
        print(character.desc)
        return true
    else
        return false
    end
end

-- Função para confirmar a escolha do personagem
function utils.confirmCharacter(name)
    while true do
        print([[
====================================================================
| Confirmar escolha?                                                |
| .Sim                                                              |
| .Nao                                                              |
====================================================================
        ]])
        local answer = io.read():lower()
        if answer == "sim" then
            local message = name .. " entra em campo! Hora da batalha!"
            local borderLength = #message + 8 -- Adiciona espaço para bordas e padding
            local border = string.rep("=", borderLength)
            local paddedMessage = "|    " .. message .. "  |"

            print(border)
            print(paddedMessage)
            print(border)
            return true
        elseif answer == "não" then
            return false
        else
            print("| Resposta inválida, por favor responda 'sim' ou 'não'. |")
        end
    end
end



-- Função para escolher o personagem
function utils.characterChooser()
    while true do
        print([[
=======================================================           
|Escolha um personagem:                               |
|                                                     |
|.Sledge                                              |
|.Zofia                                               |
|.Montagne                                            |
|.Twitch                                              |
=======================================================
]])
        local character = io.read():lower()  -- Converte a entrada para minúsculas para facilitar a comparação
        character = capitalize(character)    -- Formata para que a primeira letra seja maiúscula
        if utils.loadCharacter(character) then
            if utils.confirmCharacter(character) then
                break  -- Sai do loop se o jogador confirmar a escolha
            else
                print("Escolha não confirmada, tente novamente.")
            end
        else
            print("Você não escolheu um personagem válido! Tente novamente.")
        end
    end
end


utils.characterChooser()



return utils 
