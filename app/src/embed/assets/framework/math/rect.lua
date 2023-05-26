local Rect = class("Rect")

function Rect:init(...)
    self.position = v2(0, 0)
    self.size = size(0, 0)
    local len = select('#', ...)
    if len == 4 then
        self.position:setX(select(1, ...))
        self.position:setY(select(2, ...))
        self.size:setWidth(select(3, ...))
        self.size:setHeight(select(4, ...))
    end
end

function Rect:getSize()
    return self.size
end

function Rect:setSize(w, h)
    self.size:setWidth(w)
    self.size:setHeight(h)
end

function Rect:setPosition(x, y)
    self.position:setX(x)
    self.position:setY(y)
end

function Rect:getMinPosition()
    return self.position:clone()
end

function Rect:getMaxPosition()
    local mx = self.position:getX()
    local my = self.position:getY()

    return v2(mx + self.size:getWidth(), my + self.size:getHeight())
end

return Rect
