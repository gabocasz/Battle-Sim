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

--sistema de escolher o personagem
function utils.characterChooser()
    while true do
        print("Escolha um personagem:")
        local character = io.read():lower()  -- Converte a entrada para minúsculas para facilitar a comparação
        if utils.loadCharacter(character) then
            break  -- Sai do loop se um personagem válido for escolhido
        else
            print("Você não escolheu um personagem válido! Tente novamente.")
        end
    end
end

--sistema de carregar o personagem escolhido, e verificar se ele e valido ou nao
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


       
    


return utils 