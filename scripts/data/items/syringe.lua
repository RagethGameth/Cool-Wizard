local item, super = Class(HealItem, "syringe")

function item:init()
    super.init(self)

    -- Display name
    self.name = "syringe"
    -- Name displayed when used in battle (optional)
    self.use_name = "syringe"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil
    -- Whether this item is for the light world
    self.light = false

    self.heal_amount = 122

    -- Battle description
    self.effect = "Heals\n122 hp"
    -- Shop description
    self.shop = "Looks dangerous but isn't'"
    -- Menu description
    self.description = "Be careful not to stab yourself"
    -- Light world check text
    self.check = "Looks useful but not here"

    -- Default shop price (sell price is halved)
    self.price = 102
    -- Whether the item can be sold
    self.can_sell = true

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "ally"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
end

function item:onWorldUse(target)
    return false
end

return item