local function AddonLoader()
	-- this should test connection to MYSQL database


local function SpawnGunShop()
	local npc = ents.Create("permweps_shop")
	npc:SetPos(PermWeps.NPCPosition)
	npc:SetAngles(Angle(0, PermWeps.NPCFacing, 0))
	npc:Spawn()
	npc:Activate()
end
hook.Add( "InitPostEntity", "SpawnGunShop", SpawnGunShop )

local function OnSpawnCheck( ply )
	local lply = ply
	
	lply