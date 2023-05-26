local NotificationCenter = {}

local notifications = {}

local function generateNotify(eventName, target, callback)
    return {
        eventName = eventName,
        target = target,
        callback = callback,
    }
end

local function getNotifies(eventName)
    notifications[eventName] = notifications[eventName] or {}
    return notifications[eventName]
end

local function hasNotification(eventName, target)
    local notifys = getNotifies(eventName)
    for _, notify in ipairs(notifys) do
        if notify.eventName == eventName and notify.target == target then
            return true
        end
    end
    return false
end

function NotificationCenter.listen(eventName, target, callback)
    if not hasNotification(eventName, target) then
        local notifies = getNotifies(eventName)
        notifies[#notifies + 1] = generateNotify(eventName, target, callback)
    end
end

function NotificationCenter.trigger(eventName, ...)
    local notifies = getNotifies(eventName)
    for _, notify in ipairs(notifies) do
        notify.callback(...)
    end
end

function NotificationCenter.ignore(eventName, target)
    local notifys = getNotifies(eventName)
    for i = #notifys, 1, -1 do
        local notify = notifys[i]
        if notify.target == target then
            table.remove(notifys, i)
        end
    end
end

function NotificationCenter.ignoreByTarget(target)
    if not notifications then return end
    for eventName, notifys in pairs(notifications) do
        for i = #notifys, 1, -1 do
            local notify = notifys[i]
            if notify.target == target then
                table.remove(notifys, i)
            end
        end
    end
end

function NotificationCenter.init()
    notifications = {}
end

function NotificationCenter.destroy()
    notifications = nil
end

return NotificationCenter


