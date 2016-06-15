--[[
function Entity:IsPermWep( )
	if table.HasValue( self )
end

function Player:IsVIP( )
end

local function DBLoader( )
	registerDarkRPVar
end
hook.Add( "DarkRPDBInitialized", "PermWepsDBLoader", DBLoader )
]]

local function PermWepsNetCache( )
	util.AddNetworkString( "BuyPermWep" )
end
hook.Add( "Initialize", "PermWepsNetCache", PermWepsNetCache )

net.Receive( "BuyPermWep", function( )
	local lply = net.ReadEntity( )
	local purchased_weapon = net.ReadString( )
	
	--if not purchased_weapon:IsPermWep() then return end
	local wep_price = PermWeps.Shop1[purchased_weapon]
	
	if lply:CanAfford( wep_price ) then
		lply:AddMoney( -wep_price )
		lply:Give( purchased_weapon )
		lply:ChatPrint( "You bought a gun!" )
	else
		lply:ChatPrint( "You cannot afford that!" )
	end
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