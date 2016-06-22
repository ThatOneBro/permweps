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

function retrievePWepsData( ply, callback )

end

local meta = FindMetaTable( "Player" )

function meta:CreatePWepsProfile( )
	if not IsValid( self ) then return end
	MySQLite.query( [[ 
		REPLACE INTO permweps_data VALUES (]]  
			self:SteamID64( ) .. [[, ]] ..
            MySQLite.SQLStr( "none" )  .. [[, ]] ..
			MySQLite.SQLStr( "none" ) .. 
		");" 
	)
end

function meta:LoadPWepsProfile( )
	if not IsValid( self ) then return end
	MySQLite.query( [[
		SELECT owned_weps, equipped_weps WHERE steam_id = ]]
			..	self:SteamID64( ) ..
		";" )
	)
end

function meta:UpdatePWepsOwned( )
	if not IsValid( self ) then return end
	MySQLite.query( [[
		UPDATE permweps_data WHERE steam_id = ]]
			.. self:SteamID64( ) ..
		
	)