local function DBLoader( )
	MySQLite.query( [[
		CREATE TABLE IF NOT EXISTS permweps_data(
			steam_id BIGINT NOT NULL PRIMARY KEY,
			owned_weps VARCHAR(800) NOT NULL,
			equipped_weps VARCHAR(800) NOT NULL
		);
	]] )
end
hook.Add( "DarkRPDBInitialized", "PermWepsDBLoader", DBLoader )

local meta = FindMetaTable( "Player" )

function meta:CreatePWepsProfile( )
	if not IsValid( self ) then return end
	MySQLite.query( [[ 
		REPLACE INTO permweps_data VALUES (]] .. 
			self:SteamID64( ) .. [[, ]] ..
			MySQLite.SQLStr( "none" )  .. [[, ]] ..
			MySQLite.SQLStr( "none" ) .. 
		");" 
	)
end

function meta:LoadPWepsProfile( )
	if not IsValid( self ) then return end
	MySQLite.query( [[
		SELECT owned_weps AS owned, equipped_weps AS equipped FROM permweps_data WHERE steam_id = ]] ..
			self:SteamID64( ) ..
		";", 
		function( data )
			if not data or not data[1] or not data[1].owned or not data[1].equipped then
				self:CreatePWepsProfile( )
				return
			end
			self:setSelfDarkRPVar( "ownedPermWeps", data[1].owned )
			self:setSelfDarkRPVar( "equippedPermWeps", data[1].equipped )
			self:ReEquipPermWeps( )
			self:setSelfDarkRPVar( "hasLoadedPWeps", true )
		end,
		function( )
			self:setSelfDarkRPVar( "ownedPermWeps", "none" )
			self:setSelfDarkRPVar( "equippedPermWeps", "none" )
			self:setSelfDarkRPVar( "hasLoadedPWeps", true )
			error( "Failed to retrieve player data from database!" )
		end
	)
end

function meta:UpdatePWepsOwned( )
	if not IsValid( self ) then return end
	local owned = self:getDarkRPVar( "ownedPermWeps" )
	MySQLite.query( [[
		UPDATE permweps_data SET owned_weps = ]] ..
			MySQLite.SQLStr( owned ) ..
			[[ WHERE steam_id = ]] .. self:SteamID64( ) ..
		";"
	)
end

function meta:UpdatePWepsEquipped( )
	if not IsValid( self ) then return end
	local equipped = self:getDarkRPVar( "equippedPermWeps" )
	MySQLite.query( [[
		UPDATE permweps_data SET equipped_weps = ]] ..
			MySQLite.SQLStr( equipped ) ..
			[[ WHERE steam_id = ]] .. self:SteamID64( ) ..
		";"
	)
end