include( "shared.lua" )

local function PermWepsVIPShop( )
	local pShop = vgui.Create( "DFrame" )
	pShop:SetSize( 400, 400 )
	pShop:SetPos( ScrW( )*0.5, ScrH( )*0.5 )
	pShop:SetTitle( "PermWeps VIP Shop" )
	pShop:SetSizable( true )
	pShop:SetDeleteOnClose( false )
	pShop:Center( )
	pShop:MakePopup( )
	
	local button_height = 100
	for k, v in pairs( PermWeps.Shop2 ) do
		local BuyButton = vgui.Create( "DButton", pShop )
		BuyButton:SetText( v.name .. ": " .. v.price )
		BuyButton:SetTextColor( Color( 255, 255, 255 ) )
		BuyButton:SetPos( 75, button_height )
		BuyButton:SetSize( 100, 30 )
		BuyButton.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
		end
		BuyButton.DoClick = function( )
			net.Start( "BuyVIPPermWep" )
				net.WriteEntity( LocalPlayer( ) ) --Should write string and pass local player
				net.WriteString( k )
			net.SendToServer( )
		end
		local EquipToggle = vgui.Create( "DButton", pShop )
		EquipToggle:SetText( "Equip/ Unequip" )
		EquipToggle:SetTextColor( Color( 255, 255, 255 ) )
		EquipToggle:SetPos( 225, button_height )
		EquipToggle:SetSize( 100, 30 )
		EquipToggle.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
		end
		EquipToggle.DoClick = function( )
			net.Start( "EquipPermWep" )
				net.WriteEntity( LocalPlayer( ) ) --Should write string and pass local player
				net.WriteString( k )
			net.SendToServer( )
		end
		button_height = button_height + 100
	end

	chat.AddText( PermWeps.NPC2.ChatColor, PermWeps.NPC2.NPCName .. ": ", Color(255,255,255), PermWeps.NPC2.NPCPhrase )
end
usermessage.Hook( "PermWepsVIPShopUsed", PermWepsVIPShop )