include('shared.lua')

local function PermWepsShop()
	local pShop = vgui.Create('DFrame')
	pShop:SetSize(334, 63)
	pShop:SetPos(ScrW()*0.5, ScrH()*0.5)
	pShop:SetTitle('Rock & Gravel shop')
	pShop:SetSizable(true)
	pShop:SetDeleteOnClose(false)
	pShop:MakePopup()
	pShop:Center()

	chat.AddText(Color(255,255,128), "Merchant: ", Color(255,255,255), "Welcome to my shop, how can I help you?" )
end

usermessage.Hook("PermWepsShopUsed", PermWepsShop)
