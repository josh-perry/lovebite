local lg = love.graphics
local lw = love.window

local lovebite = {}

function lovebite:setMode(width, height, scale, flags, windowWidth, windowHeight)
    self.width = width
    self.height = height
    self.scale = scale

    if self.scale < 1 then self.scale = 0 end
    if not flags then flags = {} end

    if not windowWidth and not windowHeight and self.scale == 0 then
        if not flags.fullscreen then
            if not flags.fullscreenType or flags.fullscreentype ~= "desktop" then
                error("You can't autoscale without a window size set!")
            end
        end
    end

    self.windowWidth = windowWidth or self.width*self.scale
    self.windowHeight = windowHeight or self.height*self.scale

    self.scaleMode = "nearest"
    self.flags = flags

    self:reinitializeWindow()
end

function lovebite:reinitializeWindow()
    -- Change window size
    lw.setMode(self.windowWidth, self.windowHeight, self.flags)

    self.windowWidth, self.windowHeight = lg.getDimensions()

    -- Auto scaling
    if self.scale == 0 then
        self.scale = self.windowHeight / self.height
    end

    local actualW = self.width * self.scale
    local actualH = self.height * self.scale

    -- Create canvas
    self.canvas = lg.newCanvas(actualW, actualH)
    self.canvas:setFilter(self.scaleMode, self.scaleMode)
end

function lovebite:setCanvas()
    lg.setCanvas(self.canvas)
end

function lovebite:startDraw()
    self:setCanvas()
    lg.clear()
end

function lovebite:endDraw()
    lg.setColor(255, 255, 255)
    lg.setCanvas()

    -- Draw centered
    lg.draw(self.canvas, lg.getWidth()/2, lg.getHeight()/2, 0, self.scale, self.scale, self.width/2, self.height/2)
end

return lovebite
