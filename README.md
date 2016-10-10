A small helper library for scaling games in LÖVE.

## How to use
```lua
-- Require it somewhere
lovebite = require("lovebite")

-- Call the setup function
lovebite:setMode(160, 144, 1, flags)
```
Where flags are exactly the same as those normally passed into [love.window.setMode](https://love2d.org/wiki/love.window.setMode).

Then wrap your draw calls in lovebite.startDraw and lovebite.endDraw.

```lua
function love.draw()
    -- Call this at the top of love.draw
    lovebite:startDraw()

    -- Draw as normal
    lg.draw(sprite, 0, 0)

    -- Call this last
    lovebite:endDraw()
end
```

To change the scale after setup, just call the setScale function and the window/canvas will resize properly.
```lua
function love.keypressed(key, isrepeat)
    if key == "z" then
        lovebite:setScale(lovebite.scale - 1)
    elseif key == "x" then
        lovebite:setScale(lovebite.scale + 1)
    end
end
```
