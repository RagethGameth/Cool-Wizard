local Basic, super = Class(Wave)

function Basic:onStart()
    -- Every 0.33 seconds...
    local arena = Game.battle.arena
    self.timer:every(1 / 2, function()
        -- Our X position is offscreen, to the right
        local x = SCREEN_WIDTH - SCREEN_WIDTH - 20
        -- Get a random Y position between the top and the bottom of the arena
        local y = MathUtils.random(Game.battle.arena.top, Game.battle.arena.bottom)
        Wave:setArenaSize(300, 100)
        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBulletTo(arena, "wizardhat", arena.width * 2, arena.height * 2, math.rad(0))
        bullet.remove_offscreen = false
    end)
end

function Basic:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic
