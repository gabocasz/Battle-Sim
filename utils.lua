local utils = {}


--habilitar utf 8 
function utils.enableUtf8()
    os.execute("chcp 65001")
    
end

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
        character = io.read():lower()  -- Converte a entrada para minúsculas para facilitar a comparação
        character = capitalize(character)    -- Formata para que a primeira letra seja maiúscula
        if utils.loadCharacter(character) then
            if utils.confirmCharacter(character) then
                break  -- Sai do loop se o jogador confirmar a escolha
            else
                print("")
            end
        else
            print("Você não escolheu um personagem válido! Tente novamente.")
        end
    end
end



-- Função para carregar o personagem escolhido e verificar se ele é válido
function utils.loadCharacter(name)
    local path = "characters." .. name
    local success, character = pcall(require, path)
    
    if success and type(character) == "table" then
        print(character.name)
        print(character.desc)
        print(character.stats)
        return true
    else
        print("Erro: Personagem não encontrado ou inválido.")
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
        elseif answer == "não" or "nao" then
            return false
        else
            print("| Resposta inválida, por favor responda 'sim' ou 'não'. |")
        end
    end
end




function utils.displayIntro()
    print([[
==================================================================================
| Operação: Crepúsculo do Ragnarok                                               |
==================================================================================
|                                                                                |
| Missão:                                                                        |
| Derrotar Fenrir, o Lobo Apocalíptico, em um combate decisivo.                  |
|                                                                                |
==================================================================================
| Contexto da Operação:                                                          |
|                                                                                |
| Fenrir, o temível lobo da mitologia nórdica, despertou de seu confinamento.    |
| Ele traz consigo o presságio do fim dos tempos, espalhando medo e caos por     |
| onde passa. O mundo está à beira do Ragnarok, e cabe a você enfrentar essa     |
| ameaça colossal.                                                               |
|                                                                                |
| Fenrir é uma fera de força descomunal, capaz de manipular o medo e a           |
| escuridão para enfraquecer seus oponentes. Sua habilidade, Minas de Pavor,     |
| reduz a velocidade de seus inimigos, deixando-os vulneráveis.                  |
|                                                                                |
==================================================================================
| Objetivo:                                                                      |
|                                                                                |
| Enfrente Fenrir em uma batalha de turnos. Utilize as habilidades e estratégias |
| dos seus personagens para derrotar o lobo e impedir que o Ragnarok se inicie.  |
|                                                                                |
==================================================================================
| Conclusão:                                                                     |
|                                                                                |
| O destino do mundo depende da sua vitória. Derrote Fenrir e salve a humanidade.|
| Que a sorte esteja ao seu lado, comandante!                                    |
==================================================================================
    ]])
end

function utils.start()
    while true do 
        print[[
    =================================================================================
    |                               TUDO PRONTO?                                    |
    |                                                                               |
    |- Digite "Sim" para comecar!                                                   |
    |- Digite "Creditos" para saber mais sobre o jogo!                              |
    =================================================================================
        ]]
    local result = io.read():lower()
        if result == "sim" then
        break
    else
        print("")

        if result == "creditos" then
        print[[
    =================================================================================    
    | Ola! meu nome e gabriel, e esse vem sendo meu primeiro projeto usando lua!    |
    | e ja sou grato desde ja por qualquer pessoa que esteja lendo essa mensagem.   |
    | o projeto nao precisava ser tao complexo, mas fiquei tao animado com a        |
    | linguagem que decidi dar o meu melhor pra conseguir um resultado que me agrade|
    |                                                                               |
    | Confesso ter tido uma pequena ajuda do chat gpt pra formatacao de texto, o    |
    | jogo precisa ser bonito! Ne nao?                                              |
    |                                                                               |
    | Novamente, agradeco a qualquer pessoa que esteja aqui desde o comeco, e se    |
    | precisar me contatar por qualquer motivo, me manda mensagem no discord!       |
    | @gaboquinha                                                                   |
    |                                                                               |
    | Tenho muito a aprender, e muito trabalho a ser feito! Fui!!             :D    |
    =================================================================================
    ]] 
          end
        end
    end
end


return utils 
