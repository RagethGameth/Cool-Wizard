local Dummy, super = Class(EnemyBattler)
    
function Dummy:init()
    super.init(self)
    -- Enemy name
    self.name = "Cool Wizard"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("dummy")
    self.tired_percentage = -25
    -- Enemy health
    self.max_health = 2000
    self.health = 2000
    -- Enemy attack (determines bullet damage)
    self.attack = 15
    -- Enemy defense (usually 0)
    self.defense = 5
    -- Enemy reward
    self.money = -1

    self.phase2_turn = 0

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0

    self.below_two_thirds = false

    -- List of possible wave ids, randomly picked each turn
    if self.health > self.max_health * 2/3 then -- with 2/3rds or more HP left
        self.waves = {
            "basic",
            "aiming",
            "movingarena",
            "circle"
        }

    else -- with 2/3rds or less HP left
        self.waves = {
            "circle",
            "basic"
        }
    end
    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "breath.",
        "you suck",
        "you should die"
    }
    
    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 15 DF 0\n* he is a copycat\n* He look dumb."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* he death stares you.",
        "* he smile at you and says is\n* he hates you.",
        "* smells like he has gone insane\n* from Sippiwhippi.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* he knows Sippiwhippi."

    -- Register act called "Smile"
    self:registerAct("remind him of them")
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    self:registerAct("comfert him", "", {"ralsei"})
end

function Dummy:onAct(battler, name)
    if name == "remind him of them" then
        -- Give the enemy 100% mercy
        self:addMercy(5)
        -- Change this enemy's dialogue for 1 turn
        self.dialogue_override = "Sippiwhippi is BANNED  ^^"
        -- Act text (since it's a list, multiple textboxes)
        return {
            "*You tell him.[wait:5]\n* he cries.",
            "* It seems he is [color:red]pissed[color:reset]\nto see you."
        }

    elseif name == "comfert him" then
        -- Loop through all enemies
            -- Make the enemy tired
        self:addMercy(12)
        return "* You and Ralsei said hes cool\na he didn't care'.\n* The enemies became [color:blue]Awake[color:reset]..."

    elseif name == "Standard" then --X-Action
        -- Give the enemy 50% mercy
        self:addMercy(3)
        if battler.chara.id == "ralsei" then
            -- R-Action text
            return "* Ralsei asked politely to not attack.\n* he said no."
        elseif battler.chara.id == "susie" then
            -- S-Action: start a cutscene (see scripts/battle/cutscenes/dummy.lua)
            Game.battle:startActCutscene("dummy", "susie_punch")
            return
        else
            -- Text for any other character (like Noelle)
            return "* "..battler.chara:getName().." straightened the\ndummy's hat."
        end
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

function EnemyBattler:selectWave()
    local waves = self:getNextWaves()
    if waves and #waves > 0 then
        local wave = TableUtils.pick(waves)
        self.selected_wave = wave
        return wave
    end
end


-- In a scripts/battle/enemies file
function Dummy:selectWave()

    local true_turn = Game.battle.turn_count -- The battle keeps track of the current turn automatically

    local turn = true_turn % 4 


    -- Select specific waves based on the turn
    if self.health > self.max_health * 2/3 then -- with 2/3rds or less HP left

        if turn == 1 then
            self.selected_wave = "movingarena"
        elseif turn == 2 then
            self.selected_wave = "basic"
        elseif turn == 3 then
            self.selected_wave = "aiming"
        elseif turn == 0 then
            self.selected_wave = "circle"
        end
    else -- with 2/3rds or less HP left
        if self.below_two_thirds == false then
            self.below_two_thirds = true
            self.phase2_turn = true_turn
        end 
        Reseted_turn = 1 + true_turn - self.phase2_turn 
        turn = Reseted_turn % 4
        if turn == 1 then
            self.selected_wave = "basic"
        elseif turn == 2 then
            self.selected_wave = "basic"
        elseif turn == 3 then
            self.selected_wave = "basic"
        elseif turn == 0 then
            self.selected_wave = "circle"
        end
        -- Use random wave selection when the script runs out (assuming self.waves is set)
    end
    return self.selected_wave

end
return Dummy