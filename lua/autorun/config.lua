local config = {} -- Ignore this line
config.NPC1 = {} -- And this
config.NPC2 = {} -- And this

------------------------------
---        Config:         ---
------------------------------ 


------------------
-- NPC Settings --
------------------

-- Normal Shop NPC --
config.NPC1.NPCName = "PermWeps Vendor" -- The name of the vendor
config.NPC1.NPCModel = "models/Humans/Group03/Male_04.mdl" -- The path to the NPC's model from "garrysmod" root folder (ex. "PATH/TO/FILE.mdl")
config.NPC1.NPCPosition = Vector(235,5322,132) -- The location of the NPC on the map (type "getpos" in console for your current coordinates)
config.NPC1.NPCFacing = 0 -- The direction the NPC faces (an angular value 0-360)
config.NPC1.NPCPhrase = "You gonna just stand there, or are you here to buy a gun?" -- The phrase the NPC says to client on open
-- End Normal Shop NPC --

-- VIP Shop NPC --
config.NPC2.NPCName = "PermWeps VIP Vendor" -- The name of the vendor
config.NPC2.NPCModel = "models/Humans/Group01/Female_04.mdl" -- The path to the NPC's model from "garrysmod" root folder (ex. "PATH/TO/FILE.mdl")
config.NPC2.NPCPosition = Vector(235,5200,132) -- The location of the NPC on the map (type "getpos" in console for your current coordinates)
config.NPC2.NPCFacing = 65 -- The direction the NPC faces (an angular value 0-360)
config.NPC2.NPCPhrase = "Welcome VIP member! Check out my selection..." -- The phrase the NPC says to client on open
-- End VIP Shop NPC --

------------------
--   End NPC    --
------------------

-------------------
-- Shop Settings --
-------------------


------------------------------
---    Config ends here    ---
------------------------------

PermWeps = config
