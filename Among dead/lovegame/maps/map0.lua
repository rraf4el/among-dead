---MAPA TESTE---
map0 = {}


function map0:load()

    self.x = 0
    self.y = 0
    self.w = 3000
    self.h = 3000

    areaTotalX = math.random(0,3000)
    areaTotalY = math.random(0,3000)

    areaComida = {
        x = areaTotalX,
        y = areaTotalY,
        w = 64,
        h = 64
    }

    areaSede = {
        x = areaTotalX,
        y = areaTotalY,
        w = 64,
        h = 64
    }


    brother:load()
    sister:load()
    zombie:load()


    lg.setBackgroundColor(0.1, 0.1, 0.1)

end

function map0:update(dt)

    if brother.controle == 1 then
        cam:lookAt(brother.posX, brother.posY)
    elseif sister.controle == 1 then
        cam:lookAt(sister.posX, sister.posY)
    end

    brother:update(dt)
    sister:update(dt)
    zombie:update(dt)
    world:update(dt)

end

function map0:draw()

    

    cam:attach()
    
        lg.setColor(0.25, 0.25, 0.25)
        lg.rectangle("fill", self.x, self.y, self.w, self.h)

        lg.setColor(0.1, 0.4, 0.2)
        lg.rectangle("fill", areaComida.x, areaComida.y, areaComida.w, areaComida.h)

        lg.setColor(0.1, 0.15, 0.4)
        lg.rectangle("line", areaSede.x, areaSede.y, areaSede.w, areaSede.h)

        brother:draw()
        sister:draw()
        zombie:draw()
        world:draw()

    cam:detach()

    lg.setColor(1, 1, 1)
    lg.print(sister.fome, -64+gw, 50)
    lg.print(sister.sede, -64+gw, 75)
    lg.print(sister.sono, -64+gw, 100)

end


---KEYBOARD---

function map0:keypressed(key)

    if brother.controle == 1 then
        brother:keypressed(key)
    elseif sister.controle == 1 then
        sister:keypressed(key)
    end

end

function map0:keyreleased(key)



end

---KEYBOARD---


---MOUSE---

function map0:mousepressed(button)

    

end

function map0:mousereleased(button)

    

end

---MOUSE---

