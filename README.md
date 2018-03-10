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

## Automatically scaling to window size
You can also specify a target window size and have lovebite scale up the internal resolution to match by setting the scale to zero and setting window size:

```lua
lovebite.setMode(160, 144, 0, {}, 1280, 720)
```

This will create a 1280x720 window with a 160x144 game scaled to fit it (with pillarboxing).

### With borderless fullscreen
```lua
lovebite.setMode(160, 144, 0, {fullscreen=true, fullscreentype="desktop"})
```