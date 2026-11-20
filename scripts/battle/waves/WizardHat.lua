local Basic, super = Class(Wave)

function Basic:onStart()
    -- Every 0.33 seconds...
    local arena = Game.battle.arena
    Wave:setArenaSize(300, 100)
    local hat = self:spawnBulletTo(arena, "WizardHat", arena.width / 2, -10, math.rad(0))
    self.timer:every(1 / 2, function()
        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("smallbullet", hat.x, hat.y, math.rad(180), -8)         
        bullet.remove_offscreen = false
    end)
end

function Basic:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic
