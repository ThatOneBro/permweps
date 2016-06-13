-- local function AddonLoader()
	-- this should test connection to MYSQL database
-- end

local function SpawnNormalGunShop()
	local npc = ents.Create("permweps_shop")
	npc:SetPos(PermWeps.NPC1.NPCPosition)
	npc:SetAngles(Angle(0, PermWeps.NPC1.NPCFacing, 0))
	npc:Spawn()
	npc:Activate()
end
hook.Add( "InitPostEntity", "SpawnNormalGunShop", SpawnNormalGunShop )

local function SpawnVIPGunShop()
	local npc = ents.Create("permweps_vip")
	npc:SetPos(PermWeps.NPC2.NPCPosition)
	npc:SetAngles(Angle(0, PermWeps.NPC2.NPCFacing, 0))
	npc:Spawn()
	npc:Activate()
end
hook.Add( "InitPostEntity", "SpawnVIPGunShop", SpawnVIPGunShop )

/*local function OnSpawnCheck( ply )
	local lply = ply
	
	lply:SteamID()
end*/