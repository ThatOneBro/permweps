local function DBLoader( )
	MySQLite.query([[
		CREATE TABLE IF NOT EXISTS permweps_data(
			steam_id BIGINT NOT NULL PRIMARY KEY,
			owned_weps VARCHAR(800) NOT NULL,
			equipped_weps VARCHAR(800) NOT NULL
		);
	]])
end
hook.Add( "DarkRPDBInitialized", "PermWepsDBLoader", DBLoader )

local meta = FindMetaTable( "Player" )

function meta:CreatePWepsProfile( )
	if not IsValid( self ) then return end
	MySQLite.query([[
		REPLACE INTO permweps_data VALUES (]]  
			self:SteamID64( ) .. [[, ]] ..
            MySQLite.SQLStr( "none" )  .. [[, ]] ..
			MySQLite.SQLStr( "none" ) .. 
		");" )
end