---IRMAOZAO CODE---
brother = {}



function brother:load()

    self.x = 0
    self.y = 0
    self.w = 32
    self.h = 32
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

    self.dir = "down"
    self.status = ""
    self.state = ""

    self.name = "Irmãozão"
    self.idade = 14

    self.medo = 0
    self.sanidade = 100

    self.vidaMax = 100
    self.vida = self.vidaMax
    self.energia = 100
    self.fome = 100
    self.sede = 100
    self.sono = 100

    traumaGanho = love.math.random(1,5)
    traumas = {}

    self.controle = 1

    self.collider = world:newRectangleCollider(self.posX, self.posY, 32, 32)

end

function brother:update(dt)

    mbX = love.mouse.getX() - brother.posX
    mbY = love.mouse.getY() - brother.posY
    mbAngle = math.atan2(mbY, mbX)

    --bpX, bpY = self.collider:getPosition()
    self.collider:setPosition(16+self.posX, 16+self.posY)

    --self.posX = bpX
    --self.posY = bpY


    self.r = -mbAngle

    if self.controle > 1 then
        self.controle = 0
    elseif self.controle < 0 then
        self.controle = 1
    end

    if self.controle == 1 then
        
        if lk.isDown("a") or lk.isDown("d") or lk.isDown("w") or lk.isDown("s") then

            self.state = "walking"

            if lk.isDown("a") and self.state == "walking" then
                --self.collider:setLinearVelocity(-150, 0)
                self.dir = "left"
                self.posX = self.posX - self.xvel * dt
            elseif lk.isDown("d") and self.state == "walking" then
                --self.collider:setLinearVelocity(150, 0)
                self.posX = self.posX + self.xvel * dt
                self.dir = "right"
            end

            if lk.isDown("w") and self.state == "walking" then
                self.posY = self.posY - self.yvel * dt
                self.dir = "up"
                --self.collider:setLinearVelocity(0, -150)
            elseif lk.isDown("s") and self.state == "walking" then
                self.posY = self.posY + self.yvel * dt
                self.dir = "down"
                --self.collider:setLinearVelocity(0, 150)
            end

            if lk.isDown("lshift") then
                self.state = "running"
                self.speed = 480

                if lk.isDown("a") and self.state == "running" then
                    self.collider:setLinearVelocity(-250, 0)
                    self.dir = "left"
                    --self.posX = self.posX - self.xvel * dt
                elseif lk.isDown("d") and self.state == "running" then
                    self.collider:setLinearVelocity(250, 0)
                    self.dir = "right"
                    --self.posX = self.posX + self.xvel * dt
                end
    
                if lk.isDown("w") and self.state == "running" then
                    self.collider:setLinearVelocity(0, -250)
                    self.dir = "up"
                    --self.posY = self.posY - self.yvel * dt
                elseif lk.isDown("s") and self.state == "running" then
                    self.collider:setLinearVelocity(0, 250)
                    self.dir = "down"
                    --self.posY = self.posY + self.yvel * dt
                end
            end

        else
            self.collider:applyLinearImpulse(0,0)
            self.speed = 280
        end

    elseif self.controle == 0 then

        if self.posX <= -32+sister.posX then
            self.posX = self.posX + self.xvel * dt
        elseif self.posX >= 32+sister.posX then
            self.posX = self.posX - self.xvel * dt
        elseif self.posX > -32+sister.posX and self.posX < -32+sister.posX then
            self.posX = self.posX + 0
        end

        if self.posY <= -32+sister.posY then
            self.posY = self.posY + self.yvel * dt
        elseif self.posY >= 32+sister.posY then
            self.posY = self.posY - self.yvel * dt
        elseif self.posY > -32+sister.posY and self.posY < -32+sister.posY then
            self.posY = self.posY + 0
        end

    end


end

function brother:draw()

    lg.setColor(0.15, 0.15, 0.4)
    lg.rectangle("fill", self.posX, self.posY, self.w, self.h)

    if self.controle == 1 then
        lg.print("Brother-medo: "..self.medo, 32+self.posX, self.posY)

        lg.print("Energia: "..self.energia, 32+self.posX, 32+self.posY)
        lg.print(self.collider:getX(), 32+self.posX, 64+self.posY)
    end

end



function brother:keypressed(key)

    if key == "lctrl" then
        self.controle = self.controle - 1
        sister.controle = sister.controle + 1
    elseif key == "rctrl" then
        self.controle = self.controle + 1
        sister.controle = sister.controle - 1
    end

end

function brother:mousepressed(dx, dy, button)

end


function brother:keyreleased(key)

end

function brother:mousereleased(dx, dy, button)

end

