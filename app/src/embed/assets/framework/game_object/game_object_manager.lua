local GameObjectManager = class("GameObjectManager")

function GameObjectManager:init()
    self._gameObjects = {}
end

function GameObjectManager:addGameObject(gameObj)
    self._gameObjects[#self._gameObjects+1] = gameObj
end

function GameObjectManager:removeGameObject(gameObj)
    local idx = -1
    for k, v in ipairs(self._gameObjects) do
        if v == gameObj then
            idx = k
            break
        end
    end

    if idx > 0 then
        gameObj:onDestory()
        table.remove(self._gameObjects, idx)
    end
end

function GameObjectManager:isDirty()
    local ret = false

    for _, v in ipairs(self._gameObjects) do
        if v:isDirty() then
            ret = true
            break
        end
    end

    return ret
end

function GameObjectManager:sortByRealZOrder()
    table.sort(self._gameObjects, function(a, b) return a:getRealZOrder() > b:getRealZOrder() end)
end

function GameObjectManager:onDraw()
    if self:isDirty() then
        self:sortByRealZOrder()
    end
    for _, v in ipairs(self._gameObjects) do
        v:onDraw()
        v:markClean()
    end
end

function GameObjectManager:onUpdate(dt)
    for _, v in ipairs(self._gameObjects) do
        v:onUpdate(dt)
    end
end

return GameObjectManager
