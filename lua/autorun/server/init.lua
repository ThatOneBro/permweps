local function PermWepsInit( )
	util.AddNetworkString( "BuyPermWep" )
	util.AddNetworkString( "BuyVIPPermWep" )
	util.AddNetworkString( "EquipPermWep" )
end
hook.Add( "Initialize", "PermWepsInit", PermWepsInit )

function string:IsPermWep( )
	if PermWeps.Shop1[self] or PermWeps.Shop2[self] then 
		return true
	else
		return false
	end
end

function string:IsVIPPermWep( )
	if PermWeps.Shop2[self] and not PermWeps.Shop1[self] then
		return true
	else
		return false
	end
end

net.Receive( "BuyPermWep", function( )
	local lply = net.ReadEntity( )
	local purchased_weapon = net.ReadString( )
	
	if not IsValid( lply ) then return end
	if not purchased_weapon:IsPermWep( ) or purchased_weapon:IsVIPPermWep( ) then return end
	if lply:OwnsPermWep( purchased_weapon ) then
		lply:ChatPrint( "You already own this weapon!" )
		return
	end
	local wep_price = PermWeps.Shop1[purchased_weapon].price
	if lply:canAfford( wep_price ) then
		lply:addMoney( -wep_price )
		lply:AddPermWep( purchased_weapon )
		lply:ChatPrint( "You bought: Permanent " .. PermWepsNames[purchased_weapon] .. "!")
	else
		lply:ChatPrint( "You cannot afford that!" )
	end
end )

net.Receive( "BuyVIPPermWep", function( )
	local lply = net.ReadEntity( )
	local purchased_weapon = net.ReadString( )
	
	if not IsValid( lply ) then return end
	if not purchased_weapon:IsPermWep( ) then return end
	if not lply:IsVIP( ) and not lply:IsSuperAdmin( ) then return end
	if lply:OwnsPermWep( purchased_weapon ) then
		lply:ChatPrint( "You already own this weapon!" )
		return
	end
	local wep_price = PermWeps.Shop2[purchased_weapon].price
	if lply:canAfford( wep_price ) then
		lply:addMoney( -wep_price )
		lply:AddPermWep( purchased_weapon )
		lply:ChatPrint( "You bought: Permanent " .. PermWepsNames[purchased_weapon] .. "!" )
	else
		lply:ChatPrint( "You cannot afford that!" )
	end
end )

net.Receive( "EquipPermWep", function( )
	local lply = net.ReadEntity( )
	local equipped_weapon = net.ReadString( )
	
	lply:EquipPermWep( equipped_weapon )
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

local function InitialSpawn( ply )
	if not IsValid( ply ) then return end
	ply:setSelfDarkRPVar( "ownedPermWeps", "none" )
	ply:setSelfDarkRPVar( "equippedPermWeps", "none" )
end
hook.Add( "PlayerInitialSpawn", "PermWepsInitSpawn", InitialSpawn )

local function EquipWepsOnSpawn( ply )
	ply:ReEquipPermWeps( )
end
hook.Add( "PlayerSpawn", "PermWepsRespawn", EquipWepsOnSpawn )
