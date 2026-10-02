---@class ArenaHazard : Bullet
local ArenaHazardSmall, super = Class(Bullet)

---@param x number # The X position of the bullet
---@param y number # The Y position of the bullet
---@param rot number # The rotation (in radians) of the bullet
function ArenaHazardSmall:init(x, y, rot)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/arenahazardsmall")

    -- Top-center origin point (will be rotated around it)
    self:setOrigin(0.5, 0)

    -- The hitbox where the player will be damaged by the bullet (affected by scale and rotation)
    self:setHitbox(0, 0, self.width, 6)

    -- Rotation of the bullet (in radians)
    self.rotation = rot

    -- Don't destroy this bullet when it damages the player
    self.destroy_on_hit = false
end


return ArenaHazardSmall
