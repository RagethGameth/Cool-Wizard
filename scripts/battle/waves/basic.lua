local Basic, super = Class(Wave)

function Basic:onStart()
    -- Every 0.33 seconds...
    self.timer:every(1 / 2, function()
        -- Our X position is offscreen, to the right
        local x = SCREEN_WIDTH - SCREEN_WIDTH - 20
        -- Get a random Y position between the top and the bottom of the arena
        local y = MathUtils.random(Game.battle.arena.top, Game.battle.arena.bottom)

        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(180), -8)
        local x = SCREEN_WIDTH - 20
        local y = MathUtils.random(Game.battle.arena.top, Game.battle.arena.bottom)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(180), 8)
        local y = SCREEN_HEIGHT + 20
        local x = SCREEN_WIDTH - 300
        local x = MathUtils.random(Game.battle.arena.left, Game.battle.arena.right)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(270), 8)
        local y = SCREEN_HEIGHT - SCREEN_HEIGHT -20
        local x = MathUtils.random(Game.battle.arena.left, Game.battle.arena.right)
        local bullet = self:spawnBullet("smallbullet", x, y, math.rad(270), -8) 
        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet.remove_offscreen = false
    end)
end

function Basic:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic
    