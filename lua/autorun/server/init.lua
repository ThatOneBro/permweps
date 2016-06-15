--[[
function Entity:IsPermWep( )
	if table.HasValue( self )
end
]]

local function DBLoader( )
--registerDarkRPVar
end
hook.Add( "DarkRPDBInitialized", "PermWepsDBLoader", DBLoader )

local function PermWepsNetCache( )
	util.AddNetworkString( "BuyPermWep" )
end
hook.Add( "Initialize", "PermWepsNetCache", PermWepsNetCache )

net.Receive( "BuyPermWep", function( )
	local lply = net.ReadEntity( )
	local purchased_weapon = net.ReadString( )
	
	--if not purchased_weapon:IsPermWep() then return end
	lply:Give( purchased_weapon )
	
	umsg.Start( "BoughtPermWep", lply )
	umsg.End( )

end )

local function SpawnNormalGunShop( )
	local npc = ents.Create( "permweps_shop" )
	npc:SetPos( PermWeps.NPC1.NPCPosition )
	npc:SetAngles( Angle( 0, PermWeps.NPC1.NPCFacing, 0 ) )
	npc:Spawn( )
	npc:Activate( )
end
hook.Add( "InitPostEntity", "SpawnNormalGunShop", SpawnNormalGunShop )

local function SpawnVIPGunShop( )
	local npc = ents.Create( "permweps_vip" )
	npc:SetPos( PermWeps.NPC2.NPCPosition )
	npc:SetAngles( Angle( 0, PermWeps.NPC2.NPCFacing, 0 ) )
	npc:Spawn( )
	npc:Activate( )
end
hook.Add( "InitPostEntity", "SpawnVIPGunShop", SpawnVIPGunShop )

--[[
local function OnSpawnCheck( ply )
	local lply = ply
	
	lply:SteamID()
end
]]