include('shared.lua')

local function PermWepsVIPShop()
	local pShop = vgui.Create('DFrame')
	pShop:SetSize(334, 63)
	pShop:SetPos(ScrW()*0.5, ScrH()*0.5)
	pShop:SetTitle('PermWeps VIP Shop')
	pShop:SetSizable(true)
	pShop:SetDeleteOnClose(false)
	pShop:Center()
	pShop:MakePopup()

	chat.AddText(Color(255,255,128), PermWeps.NPC2.NPCName + ": ", Color(255,255,255), PermWeps.NPC2.NPCPhrase )
end

usermessage.Hook("PermWepsVIPShopUsed", PermWepsVIPShop)
