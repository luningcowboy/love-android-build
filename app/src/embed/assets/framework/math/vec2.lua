local Vec2 = class("Vec2")

function Vec2:init(...)
    local len = select("#", ...)
    self.x = 0
    self.y = 0
    if len == 1 then
        self.x = select(1, ...)
        self.y = self.x
    elseif len >= 2 then
        self.x = select(1, ...)
        self.y = select(2, ...)
    end
end

function Vec2:getX()
    return self.x
end

function Vec2:getY()
    return self.y
end

function Vec2:setX(x)
    self.x = x
end

function Vec2:setY(y)
    self.y = y
end

function Vec2:add(v)
    if v:instanceOf(Vec2) then
        return Vec2:new(self.x + v.x, self.y + v.y)
    end
end

function Vec2:sub(v)
    if v:instanceOf(Vec2) then
        return Vec2:new(self.x - v.x, self.y - v.y)
    end
end

return Vec2
