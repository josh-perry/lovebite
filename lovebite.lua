local lg = love.graphics
local lw = love.window

local lovebite = {}

function lovebite:setMode(config)
    self.width = config.width
    self.height = config.height
    self.scale = config.scale or 0

    if self.scale < 1 then self.scale = 0 end
    if not config.flags then config.flags = {} end

    if not config.windowWidth and not config.windowHeight and self.scale == 0 then
        if not config.flags.fullscreen then
            if not config.flags.fullscreenType or config.flags.fullscreentype ~= "desktop" then
                error("You can't autoscale without a window size set!")
            end
        end
    end

    self.windowWidth = config.windowWidth or self.width*self.scale
    self.windowHeight = config.windowHeight or self.height*self.scale

    self.scaleMode = "nearest"
    self.flags = config.flags

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

    -- Create canvas
    self.canvas = lg.newCanvas(self.width, self.height)
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
