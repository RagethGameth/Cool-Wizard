local item, super = Class(HealItem, "debug_weapon")

function item:init()
    super.init(self)

    -- Display name
    self.name = "debug_weapon"
    -- Name displayed when used in battle (optional)
    self.use_name = "debug_weapon"

    self.type = "weapon"
    self.icon = nil

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {
        attack  = 100,
        defense = 100,
        magic   = 100,
    }

    -- No special bonus
    self.bonus_name = nil
    self.bonus_icon = nil

    -- Everyone can equip
    self.can_equip = {
         kris = true,
         susie = true,
         noelle = true, 
    }

    -- Battle description
    self.effect = "damage"
    -- Shop description
    self.shop = "Death'"
    -- Menu description
    self.description = "Death"
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
    -- Character reactions
    self.reactions = {
        susie = "It's sick",
        ralsei = "Don't kill anyone with it!    ",
        noelle = "Death?",
    }

end


function item:onWorldUse(target)
    return false
end

return item 