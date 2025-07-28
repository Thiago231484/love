-- ESP com Team Check para testes (Love2D)

local players = {
    {id = 1, name = "Jogador1", x = 100, y = 100, team = 1},
    {id = 2, name = "Jogador2", x = 300, y = 200, team = 2},
    {id = 3, name = "Jogador3", x = 200, y = 150, team = 1},
}

local localPlayer = {id = 0, x = 150, y = 150, team = 1}

function love.load()
    love.window.setTitle("ESP com Team Check")
    love.window.setMode(800, 600)
end

function love.update(dt)
    -- Simular movimentação (teste)
    for _, p in ipairs(players) do
        p.x = p.x + math.random(-1, 1)
        p.y = p.y + math.random(-1, 1)
    end
end

function drawESPBox(x, y, name, isEnemy)
    love.graphics.setColor(isEnemy and {1, 0, 0} or {0, 0.6, 1})
    love.graphics.rectangle("line", x - 15, y - 30, 30, 60)
    love.graphics.print(name, x - 20, y - 40)
end

function love.draw()
    -- Desenha jogador local
    love.graphics.setColor(0, 1, 0)
    love.graphics.circle("fill", localPlayer.x, localPlayer.y, 5)
    love.graphics.print("Você", localPlayer.x + 10, localPlayer.y)

    -- Desenha ESP para outros jogadores
    for _, p in ipairs(players) do
        if p.id ~= localPlayer.id then
            local isEnemy = p.team ~= localPlayer.team
            drawESPBox(p.x, p.y, p.name, isEnemy)
        end
    end
end
