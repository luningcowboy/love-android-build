local GameObject = class("GameObject")

function GameObject:init()
    self._position = v2(0, 0)
    self._rect = rect(0, 0, 0, 0)
    self._size = size(0, 0)
    self._zorder = -1
    self._realZOrder = -1
    self._mgr = nil
    self._isDirty = true
    self._lg = love.graphics
end

function GameObject:setPosition(x, y)
    self._position:setX(x)
    self._position:setY(y)
    self:refreshRect()
end

function GameObject:setPositionX(x)
    self._position:setX(x)
    self:refreshRect()
end

function GameObject:setPositionY(y)
    self._position:setY(y)
    self:refreshRect()
end

function GameObject:getPosition()
    return self._position
end

function GameObject:setWidth(width)
    self._size:setWidth(width)
    self:refreshRect()
end

function GameObject:setHeight(height)
    self._size:setHeight(height)
    self:refreshRect()
end

function GameObject:setSize(w, h)
    self:setWidth(w)
    self:setHeight(h)
    self:refreshRect()
end

function GameObject:getWidth()
    return self._size:getWidth()
end

function GameObject:refreshRect()
    self._rect:setPosition(self._position:getX(), self._position:getY())
    self._rect:setSize(self._size:getWidth(), self._size:getHeight())
end

function GameObject:getHeight()
    return self._size:getHeight()
end

function GameObject:getSize()
    return self._size
end

function GameObject:setZOrder(zorder)
    self._zorder = zorder
    if self._zorder ~= -1 then
        self:setRealZOrder(zorder)
        -- mark dirty
        self:markDirty()
    end
end

function GameObject:isDirty()
    return self._isDirty
end

function GameObject:markDirty()
    self._isDirty = true
end

function GameObject:markClean()
    self._isDirty = false
end

function GameObject:setRealZOrder(zorder)
    self._realZOrder = zorder
end

function GameObject:getZOrder()
    return self._zorder
end

function GameObject:getRealZOrder()
    return self._realZOrder
end

function GameObject:setGameObjectManager(mgr)
    self._mgr = mgr
end

function GameObject:getGameObjectManager()
    return self._mgr
end

function GameObject:removeSelf()
    if self._mgr then
        self._mgr:removeGameObject(self)
    end
end

function GameObject:onDestory()
end

function GameObject:onDraw()
end

function GameObject:onUpdate(dt)
end

return GameObject
