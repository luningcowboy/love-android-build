Vec2 = require("framework.math.vec2")
Size = require("framework.math.size")
Rect = require("framework.math.rect")

function v2(...)
    return Vec2:new(...)
end

function size(...)
    return Size:new(...)
end

function rect(...)
    return Rect:new(...)
end
