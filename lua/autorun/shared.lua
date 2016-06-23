hook.Add( "Initialize", "PermWepsSharedInit", function( )
	PermWepsNames = {}
	for k, v in pairs( PermWeps.Shop1 ) do
		PermWepsNames[k] = v.name
	end
	for k, v in pairs( PermWeps.Shop2 ) do
		PermWepsNames[k] = v.name
	end
	
	DarkRP.registerDarkRPVar( "hasLoadedPWeps", net.WriteBool, net.ReadBool )
	DarkRP.registerDarkRPVar( "ownedPermWeps", net.WriteString, net.ReadString )
	DarkRP.registerDarkRPVar( "equippedPermWeps", net.WriteString, net.ReadString )
end )