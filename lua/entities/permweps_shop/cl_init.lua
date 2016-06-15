include( "shared.lua" )

local function PermWepsShop( )
	local pShop = vgui.Create( "DFrame" )
	pShop:SetSize( 400, 400 )
	pShop:SetPos( ScrW( )*0.5, ScrH( )*0.5 )
	pShop:SetTitle( "PermWeps Shop" )
	pShop:SetSizable( true )
	pShop:SetDeleteOnClose( false )
	pShop:Center( )
	pShop:MakePopup( )
	
	local Button = vgui.Create( "DButton", pShop )
	Button:SetText( "Buy permanent weapon!" )
	Button:SetTextColor( Color( 255, 255, 255 ) )
	Button:SetPos( 100, 100 )
	Button:SetSize( 300, 30 )
	Button.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
	end
	Button.DoClick = function( )
		net.Start( "BuyPermWep" )
			net.WriteEntity( LocalPlayer() ) --Should write string and pass local player
			net.WriteString( "weapon_ak47custom" )
		net.SendToServer( )
	end
	
	local Button = vgui.Create( "DButton", pShop )
	Button:SetText( "Buy permanent weapon!" )
	Button:SetTextColor( Color( 255, 255, 255 ) )
	Button:SetPos( 100, 200 )
	Button:SetSize( 300, 30 )
	Button.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
	end
	Button.DoClick = function( )
		net.Start( "BuyPermWep" )
			net.WriteEntity( LocalPlayer() ) --Should write string and pass local player
			net.WriteString( "weapon_ak47" )
		net.SendToServer( )
	end

	chat.AddText( Color(255,255,128), PermWeps.NPC1.NPCName .. ": ", Color(255,255,255), PermWeps.NPC1.NPCPhrase )
end

usermessage.Hook( "PermWepsShopUsed", PermWepsShop )

local function BoughtPermWep( )
	chat.AddText( Color(255, 255, 255), "You bought a gun!" )
end

usermessage.Hook( "BoughtPermWep", BoughtPermWep )