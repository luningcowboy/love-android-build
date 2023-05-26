print("LOVE VERSION:", love.getVersion())
print("LUA VERSION:", _VERSION)

g_assets = nil

function love.load()
    love.graphics.setBackgroundColor(35/255, 42/255, 50/255, 1)
    require("framework")
    require("game")

    g_assets = cargo.init("assets")
end

function love.draw()
    director:onDraw()
end

function love.update(dt)
    lurker.update()
    director:onUpdate(dt)
end

function love.keyreleased(key)
end

function love.textinput(text)
end

function love.textedited(text, start, length)
end
