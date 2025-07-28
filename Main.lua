-- love.load é chamado uma vez ao iniciar o jogo
function love.load()
    jogadores = {
        {x = 100, y = 100, team = 1, nome = "Jogador1"},
        {x = 200, y = 150, team = 2, nome = "Jogador2"},
        {x = 300, y = 200, team = 1, nome = "Jogador3"},
    }

    meuTime = 1
end

-- love.update é chamado a cada frame para atualizar o jogo
function love.update(dt)
    -- Aqui você poderia atualizar a posição dos jogadores simulando movimentação
end

-- love.draw é chamado a cada frame para desenhar
function love.draw()
    for i, jogador in ipairs(jogadores) do
        local cor

        if jogador.team == meuTime then
            cor = {0, 1, 0} -- Verde para aliados
        else
            cor = {1, 0, 0} -- Vermelho para inimigos
        end

        love.graphics.setColor(cor)
        love.graphics.rectangle("line", jogador.x, jogador.y, 50, 50) -- Caixa ESP
        love.graphics.print(jogador.nome, jogador.x, jogador.y - 15)
    end

    -- Interface básica
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("ESP Ativado - Team Check ON", 10, 10)
end
