local function SpawnGunShop()
	local npc = ents.Create("permweps_shop")
	npc:SetPos(Vector(235,5322,132))
	npc:SetAngles(Angle(0,0,0))
	npc:Spawn()
	npc:Activate()
end
hook.Add( "InitPostEntity", "SpawnGunShop", SpawnGunShop )
