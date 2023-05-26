local Size = class("Size")

function Size:init(...)
    self.width = 0
    self.height = 0
    local len = select('#', ...)
    if len == 1 then
        self.width  = select(1, ...)
        self.height = self.width
    elseif len >= 2 then
        self.width  = select(1, ...)
        self.height = select(2, ...)
    end
end

function Size:setWidth(w)
    self.width = w
end

function Size:getWidth()
    return self.width
end

function Size:setHeight(h)
    self.height = h
end

function Size:getHeight()
    return self.height
end

return Size
