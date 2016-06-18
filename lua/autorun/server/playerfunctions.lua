local meta = FindMetaTable( "Player" )

function meta:IsVIP( )
	if not IsValid( self ) then return false end
	for _, v in pairs( PermWeps.VIPGroup ) do
		if self:IsUserGroup( v ) then return true end
	end
	return false
end

function meta:OwnsPermWep( weapon )
	local checked_wep = weapon
	
	if not IsValid( self ) or not checked_wep:IsPermWep( ) then return false end
	if self:getDarkRPVar( "ownedPermWeps" ) == "none" then return false end
	
	local owned_weps = self:getDarkRPVar( "ownedPermWeps" )
	if string.find( owned_weps, checked_wep ) then
		return true
	else
		return false
	end
end

function meta:AddPermWep( weapon )
	if not IsValid( self ) then return end
	local added_wep = weapon
	if not added_wep:IsPermWep(  ) then return end
	
	local owned_weps = self:getDarkRPVar( "ownedPermWeps" )
	if owned_weps == "none" then
		self:setSelfDarkRPVar( "ownedPermWeps", added_wep )
	else
		self:setDarkRPVar( "ownedPermWeps", owned_weps .. "," .. added_wep )
	end
end

function meta:HasPermWepEquipped( weapon )
	local checked_wep = weapon
	
	if not IsValid( self ) or not checked_wep:IsPermWep( ) or not self:OwnsPermWep( checked_wep ) then return false end
	if self:getDarkRPVar( "equippedPermWeps" ) == "none" then return false end
	
	local equipped_weps = self:getDarkRPVar( "equippedPermWeps" )
	if string.find( equipped_weps, checked_wep ) then
		return true
	else
		return false
	end
end

function meta:EquipPermWep( weapon )
	if not IsValid( self ) or not weapon:IsPermWep( ) then return end
	local added_wep = weapon
	if not self:OwnsPermWep( added_wep ) then
		self:ChatPrint( "You don't own that weapon!" )
		return
	end
	local equipped_weps = self:getDarkRPVar( "equippedPermWeps" )
	if self:HasPermWepEquipped( added_wep ) then
		if not string.find( equipped_weps, "%w+," ) then
			equipped_weps = "none"
		elseif string.find( equipped_weps, added_wep .. "," ) then
			equipped_weps = string.gsub( equipped_weps, added_wep .. ",", "" )
		else
			equipped_weps = string.gsub( equipped_weps, "," .. added_wep, "" )
		end
		self:setSelfDarkRPVar( "equippedPermWeps", equipped_weps )
		self:StripWeapon( added_wep )
		self:ChatPrint( "Unequipped " .. PermWepsNames[added_wep] .. "!" )
		return
	elseif equipped_weps  == "none" then
		self:setSelfDarkRPVar( "equippedPermWeps", added_wep )
	else
		self:setSelfDarkRPVar( "equippedPermWeps", equipped_weps .. "," .. added_wep )
	end
	self:Give( added_wep )
	self:ChatPrint( "Equipped " .. PermWepsNames[added_wep] .. "!" )
end

function meta:ReEquipPermWeps( )
	if not IsValid( self ) then return end
	local equipped_weps = self:getDarkRPVar( "equippedPermWeps" )
	if equipped_weps == "none" then return end
	if not string.find( equipped_weps, "," ) then
		self:Give( equipped_weps )
		return
	end
	for k, v in pairs( PermWepsNames ) do
		if string.find( equipped_weps, k ) then
			self:Give( k )
		end
	end
	return
end