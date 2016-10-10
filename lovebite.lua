local lg = love.graphics
local lw = love.window

local lovebite = {}

function lovebite:setMode(width, height, scale, flags)
    self.width = width
    self.height = height
    self.scale = scale
    self.scale_mode = "nearest"
    self.flags = flags

    self:reinitializeWindow()
end

function lovebite:reinitializeWindow()
    local w, h = self.width, self.height
    local s = self.scale

    local actualW = w * self.scale
    local actualH = h * self.scale

    -- Create canvas
    self.canvas = lg.newCanvas(actualW, actualH)
    self.canvas:setFilter(self.scale_mode, self.scale_mode)

    -- Change window size
    lw.setMode(actualW, actualH, self.flags)
end

function lovebite:setScale(scale)
    if scale == self.scale then
        return
    end

    if scale < 1 then
        scale = 1
    end

    self.scale = scale
    self:reinitializeWindow()
end

function lovebite:startDraw()
    lg.setCanvas(self.canvas)
end

function lovebite:endDraw()
    lg.setColor(255, 255, 255)
    lg.setCanvas()
    lg.draw(self.canvas, 0, 0, 0, self.scale, self.scale)
end

return lovebite
