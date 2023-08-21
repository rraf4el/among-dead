---AMONG DEAD / MAIN CODE---

lg = love.graphics
lk = love.keyboard

gw = love.graphics.getWidth()
gh = love.graphics.getHeight()

mx = love.mouse.getX()
my = love.mouse.getY()


---REQUIRES---

---GERAL---

require("brother")
require("sister")
require("enemies/zombie")

---GERAL---

---MAPS---

require("maps/map0")

---MAPS---

---LIBRARIES---
wf = require "libraries/windfield"
camera = require("libraries/camera")
cam = camera()

---LIBRARIES---


---REQUIRES---


world = wf.newWorld(0, 0)


function love.load()

    hotBarMenu = {
        x = 0,
        y = 0,
        w = 160,
        h = 192
    }

    hotBarMenuAtiva = "desativada"

    acoes = {
        x = 8+hotBarMenu.x,
        y = 8+hotBarMenu.y,
        w = 144,
        h = 16
    }


    map0:load()

end

function love.update(dt)

    mx = love.mouse.getX()
    my = love.mouse.getY()

    if hotBarMenuAtiva == "ativada" then
        hotBarMenu.x = mx
        hotBarMenu.y = my

        acoes.x = 8+hotBarMenu.x
        acoes.y = 8+hotBarMenu.y

    elseif hotBarMenuAtiva == "estatica" then
        hotBarMenu.x = hotBarMenu.x + 0
        hotBarMenu.y = hotBarMenu.y + 0

    elseif hotBarMenuAtiva == "desativada" then
        hotBarMenu.x = 0
        hotBarMenu.y = 0
    end

    map0:update(dt)

end

function love.draw()

    map0:draw()

    if hotBarMenuAtiva == "ativada" or hotBarMenuAtiva == "estatica" then

        lg.setColor(0.15, 0.15, 0.15, 0.75)
        lg.rectangle("fill", hotBarMenu.x, hotBarMenu.y, hotBarMenu.w, hotBarMenu.h)

        lg.setColor(0.85, 0.85, 0.85)
        lg.rectangle("line", acoes.x, acoes.y, acoes.w, acoes.h)

    end

end



function love.keypressed(key)

    map0:keypressed(key)

end

function love.mousepressed(dx, dy, button)

    if button == 2 then
        hotBarMenuAtiva = "ativada"
    end

end


function love.keyreleased(key)

end

function love.mousereleased(dx, dy, button)

    if button == 2 then
        hotBarMenuAtiva = "estatica"
    end

end

