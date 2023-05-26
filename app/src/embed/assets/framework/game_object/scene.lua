local Scene = class("Scene")

function Scene:init()
    self.gameObjectMGR = GameObjectManager:new()
    self.lg = love.graphics
end

function Scene:onEnter()
end

function Scene:onDraw()
    self.gameObjectMGR:onDraw()
end

function Scene:onUpdate(dt)
    self.gameObjectMGR:onUpdate(dt)
end

function Scene:onExit()
end

function Scene:getGameObjectManager()
    return self.gameObjectMGR
end

function Scene:addGameObject(obj)
    self.gameObjectMGR:addGameObject(obj)
end

return Scene
