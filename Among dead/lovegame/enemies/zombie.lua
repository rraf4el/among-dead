---ZUMBIS CODE---
zombie = {}



function zombie:load()

tempoSpawn = 2

aleatoriedadeZumbi = math.random(1,5)
aleatoriedadeSpawnX = love.math.random(0, 3000)
aleatoriedadeSpawnY = love.math.random(0, 3000)

tempoRandom = 2
ativacaoTempo = "false"

quantidadeZumbi = 0
quantidadeMaximaZumbi = 3

end

function zombie:update(dt)

    zombie:zumbi(dt)

end

function zombie:draw()

    for i,zumbi in ipairs(zombie) do

        lg.setColor(1,0,0)
        lg.rectangle("line", -160+zumbi.posX, -32+zumbi.posY, 192, 96)
    
        lg.setColor(1,1,0)
        lg.rectangle("line", zumbi.posX, -32+zumbi.posY, 192, 96)
    
        lg.setColor(0,1,0)
        lg.rectangle("line", -32+zumbi.posX, -160+zumbi.posY, 96, 192)

        lg.setColor(0,0,1)
        lg.rectangle("line", -32+zumbi.posX, zumbi.posY, 96, 192)

        lg.setColor(1,1,1)
        lg.rectangle("fill", zumbi.posX, zumbi.posY, zumbi.w, zumbi.h)

        lg.print(zumbi.dir, zumbi.posX, 64+zumbi.posY)

        --lg.print(zumbi.posX, 64+brother.posX, -32+brother.posY+15*i)
        --lg.print(zumbi.posY, 128+brother.posX, -32+brother.posY+15*i)

    end

end



function zombie:keypressed(key)


end

function zombie:mousepressed(dx, dy, button)


end


function zombie:keyreleased(key)


end


function zombie:mousereleased(dx, dy, button)


end


function zombie:zumbi(dt)

if quantidadeZumbi <= quantidadeMaximaZumbi then
    tempoSpawn = tempoSpawn - 1 * dt
else
    tempoSpawn = 2
end

    if tempoSpawn <= 0 then

        aleatoriedadeSpawnX = love.math.random(0,3000)
        aleatoriedadeSpawnY = love.math.random(0,3000)

        novoZumbi = {
            x = 0,
            y = 0,
            w = 32,
            h = 32,
            r = 0,
            posX = aleatoriedadeSpawnX,
            posY = aleatoriedadeSpawnY,
            sx = 1,
            sy = 1,
            dir = "down",
            speed = 160,
            life = 100
        }
        novoZumbiOx = novoZumbi.w/2
        novoZumbiOy = novoZumbi.h/2

        novoZumbiXvel = novoZumbi.speed * math.cos(math.pi / 4)
        novoZumbiYvel = novoZumbi.speed * math.sin(math.pi / 4)

        table.insert(zombie,novoZumbi)

        quantidadeZumbi = quantidadeZumbi + 1
        tempoSpawn = 2

    end


    for i,zumbi in ipairs(zombie) do

        zumbi.ox = novoZumbiOx
        zumbi.oy = novoZumbiOy
        
        zumbi.xvel = novoZumbiXvel
        zumbi.yvel = novoZumbiYvel

    end



end

