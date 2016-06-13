local config = {} -- Ignore this line

------------------------------
---        Config:         ---
------------------------------ 


------------------
-- NPC Settings --
------------------
local NumOfVendors = 1

-- NPC 1 --
local NPC1 = {} -- Change the number to the index of the number (ex. NPC2)

NPC1.NPCName = "PermWeps Vendor" -- The name of the vendor
NPC1.NPCModel = "models/Humans/Group01/Female_02.mdl" -- The path to the NPC's model from "garrysmod" root folder (ex. "PATH/TO/FILE.mdl")
NPC1.NPCPosition = Vector(235,5322,132) -- The location of the NPC on the map (type "getpos" in console for your current coordinates)
NPC1.NPCFacing = 0 -- The direction the NPC faces (an angular value 0-360)
NPC1.NPCPhrase = "You gonna just stand there, or are you here to buy a gun?" -- The phrase the NPC says to client on open
-- End NPC 1 --



-- Shop Settings --


------------------------------
---    Config ends here    ---
------------------------------ 

for local i = 1, i >= NumOfVendors do
	config.["NPC"+i] = NPC + i;
end

PermWeps = config
