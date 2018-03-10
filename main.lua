local lg = love.graphics
local lw = love.window

local lovebite = require("lovebite")

local sprite = lg.newImage("sprite.png")

function love.load()
    lw.setTitle("lovebite Example")

    lovebite:setMode(160, 144, 0, {fullscreen = true})
end

function love.draw()
    -- Call this at the top of love.draw
    lovebite:startDraw()

    -- Draw as normal
    lg.draw(sprite, 0, 0)

    -- Call this last
    lovebite:endDraw()
end

function love.keypressed(key, isrepeat)
    if key == "z" then
        lovebite:setMode(160, 144, lovebite.scale - 1)
    elseif key == "x" then
        lovebite:setMode(160, 144, lovebite.scale + 1)
    end
end
