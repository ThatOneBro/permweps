include('shared.lua')

local function PermWepsShop()
	local pShop = vgui.Create('DFrame')
	pShop:SetSize(334, 63)
	pShop:SetPos(ScrW()*0.5, ScrH()*0.5)
	pShop:SetTitle('PermWeps Shop')
	pShop:SetSizable(true)
	pShop:SetDeleteOnClose(false)
	pShop:Center()
	pShop:MakePopup()

	chat.AddText(Color(255,255,128), "PermWeps Vendor: ", Color(255,255,255), PermWeps.NPCPhrase )
end

usermessage.Hook("PermWepsShopUsed", PermWepsShop)
