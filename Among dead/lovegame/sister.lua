---IRMAZINHA CODE---
sister = {}



function sister:load()

    self.x = 0
    self.y = 0
    self.w = 28
    self.h = 28
    self.r = 0
    self.posX = gw/2
    self.posY = gh/2
    self.sx = 1
    self.sy = 1
    self.ox = self.w/2
    self.oy = self.h/2
    self.speed = 280
    self.xvel = self.speed * math.cos(math.pi / 4)
    self.yvel = self.speed * math.sin(math.pi / 4)

    self.name = "Irmãzinha"
    self.idade = 8

    self.medo = 0
    self.sanidade = 100

    self.vidaMax = 100
    self.vida = self.vidaMax
    self.energia = 100
    self.fome = 100
    self.sede = 100
    self.sono = 100

    self.controle = 0

    self.collider = world:newRectangleCollider(self.posX, self.posY, 16, 16)

end

function sister:update(dt)

    self.fome = self.fome - 1 * dt
    self.sede = self.sede - 1 * dt
    self.sono = self.sono - 1 * dt

    if self.controle > 1 then
        self.controle = 0
    elseif self.controle < 0 then
        self.controle = 1
    end

    if self.controle == 1 then

        if love.keyboard.isDown("a") then
            self.posX = self.posX - self.xvel * dt
        elseif love.keyboard.isDown("d") then
            self.posX = self.posX + self.xvel * dt
        end

        if love.keyboard.isDown("w") then
            self.posY = self.posY - self.yvel * dt
        elseif love.keyboard.isDown("s") then
            self.posY = self.posY + self.yvel * dt
        end

    elseif self.controle == 0 then

        if self.posX <= -32+brother.posX then
            self.posX = self.posX + self.xvel * dt
        elseif self.posX >= 32+brother.posX then
            self.posX = self.posX - self.xvel * dt
        elseif self.posX > -32+brother.posX and self.posX < 32+brother.posX then
            self.posX = self.posX + 0
        end

        if self.posY <= -32+brother.posY then
            self.posY = self.posY + self.yvel * dt
        elseif self.posY >= 32+brother.posY then
            self.posY = self.posY - self.yvel * dt
        elseif self.posY > -32+brother.posY and self.posY < 32+brother.posY then
            self.posY = self.posY + 0
        end

    end


end

function sister:draw()

    lg.setColor(0.4, 0.2, 0.5)
    lg.rectangle("fill", self.posX, self.posY, self.w, self.h)

    lg.print("Sister-medo: "..self.medo, 32+self.posX, self.posY)

end



function sister:keypressed(key)

    if key == "lctrl" then
        self.controle = self.controle - 1
        brother.controle = brother.controle + 1
    elseif key == "rctrl" then
        self.controle = self.controle + 1
        brother.controle = brother.controle - 1
    end

end

function sister:mousepressed(dx, dy, button)

end


function sister:keyreleased(key)

end

function sister:mousereleased(dx, dy, button)

end

