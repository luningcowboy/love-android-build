local Director = class("Director")

function Director:init()
    self._scenes = {}
    self._currentScene = nil
end

function Director:getScreenSize()
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
    return size(width, height)
end

function Director:addScene(name, scene)
    if not self._scenes[name] then
        self._scenes[name] = scene
    end
end

function Director:showScene(name)
    if self._scenes[name] then
        if self._currentScene then
            self._currentScene:onExit()
        end
        self._currentScene = self._scenes[name]
        self._currentScene:onEnter()
    end
end

function Director:removeScene(name)
    if self._scenes[name] then
        local scene = self._scenes[name]
        if scene == self._currentScene then return end

        scene:onDestory()
        self._scenes[name] = nil
    end
end


function Director:onUpdate(dt)
    if self._currentScene then
        self._currentScene:onUpdate(dt)
    end
end

function Director:onDraw()
    if self._currentScene then
        self._currentScene:onDraw()
    end
end

return Director
