---@class WizardHat : Bullet
local WizardHat, super = Class(Bullet)

---@param x number # The X position of the bullet
---@param y number # The Y position of the bullet
---@param rot number # The rotation (in radians) of the bullet
function WizardHat:init(x, y, rot)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/WizardHat")

    -- Top-center origin point (will be rotated around it)
    self:setOrigin(0.5, 1)

    -- The hitbox where the player will be damaged by the bullet (affected by scale and rotation)
    self:setHitbox(0, 0, self.width, 6)

    -- Rotation of the bullet (in radians)
    self.rotation = rot



    -- Don't destroy this bullet when it damages the player
    self.destroy_on_hit = false
end

-- function WizardHat:init(x, y, dir, speed)
--     -- Last argument = sprite path
--     super.init(self, x, y, "bullets/WizardHat")

--     -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
--     self.physics.direction = dir
--     -- Speed the bullet moves (pixels per frame at 30FPS)
--     self.physics.speed = speed
-- end

function WizardHat:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super.update(self)
    self.x = Game.battle.arena.width / 2 + 100 * math.sin(Kristal.getTime() * 2)
end

return WizardHat
