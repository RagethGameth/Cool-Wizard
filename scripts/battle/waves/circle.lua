local Basic, super = Class(Wave)

function Basic:onStart()
    -- Every 0.33 seconds...
    self.timer:every(1 / 2, function()
        -- Our X position is offscreen, to the right
        local x = SCREEN_WIDTH - SCREEN_WIDTH - 20
        -- Get a random Y position between the top and the bottom of the arena
        local y = MathUtils.random(SCREEN_HEIGHT)

        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(0), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(20), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(40), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(60), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(80), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(100), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(120), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(140), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(160), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(180), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(200), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(220), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(240), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(260), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(280), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(300), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(320), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(340), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(360), -8)


        local x = SCREEN_WIDTH - 20

        local y = MathUtils.random(SCREEN_HEIGHT)

        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(0), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(20), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(40), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(60), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(80), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(100), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(120), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(140), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(160), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(180), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(200), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(220), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(240), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(260), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(280), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(300), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(320), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(340), -8)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(360), -8)



        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet.remove_offscreen = false
    end)
end

function Basic:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic
    