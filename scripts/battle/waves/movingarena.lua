local MovingArena, super = Class(Wave)

function MovingArena:init()
    super.init(self)

    -- Initialize timer
    self.siner = 0
end

function MovingArena:onStart()
    -- Get the arena object
    local arena = Game.battle.arena

    -- Spawn spikes on top of arena
    self:spawnBulletTo(Game.battle.arena, "arenahazard", arena.width / 2, 0, math.rad(0))

    -- Spawn spikes on bottom of arena (rotated 180 degrees)
    self:spawnBulletTo(Game.battle.arena, "arenahazard", arena.width / 2, arena.height, math.rad(180))

    self:spawnBulletTo(Game.battle.arena, "arenahazard", arena.width / arena.width - 1, arena.height / 2, math.rad(270))

    self:spawnBulletTo(Game.battle.arena, "arenahazard", arena.width / 1, arena.height / 2, math.rad(90))

    self:spawnBulletTo(Game.battle.arena, "arenahazardsmall", arena.width / 4 + 1, arena.height / 3, math.rad(0))

    self:spawnBulletTo(Game.battle.arena, "arenahazardsmall", arena.width / 4 * 3, arena.height / 3 * 2, math.rad(0))

    -- Store starting arena position
    self.arena_start_x = arena.x
    self.arena_start_y = arena.y
end

function MovingArena:update()
    -- Increment timer for arena movement
    self.siner = self.siner + DT

    -- Calculate the arena Y offset
    local offset = math.sin(self.siner * 1.5) * 40

    -- Move the arena
    Game.battle.arena:setPosition(self.arena_start_x, self.arena_start_y + offset)

    super.update(self)
end

return MovingArena
