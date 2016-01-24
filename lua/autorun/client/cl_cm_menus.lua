
local DefaultWeapons = "weapon_cs_m4 weapon_cs_usp weapon_cs_knife weapon_cs_he"
local MaxWeight = 20

CreateClientConVar("cm_editor_basestats","2",true,true)
CreateClientConVar("cm_editor_weapons",DefaultWeapons,true,true)

local CurrentLoadout = string.Explode(" ", string.Trim(GetConVar("cm_editor_weapons"):GetString()))
local TotalWeight = 0

function CM_ShowClassMenu()

	local SpaceOffset = 10
	
	local x = ScrW()*0.5
	local y = ScrH()
	
	local BaseFrame = vgui.Create("DFrame")
	BaseFrame:SetSize(x,y - 40)
	BaseFrame:Center()
	BaseFrame:SetVisible( true )
	BaseFrame:SetDraggable( false )
	BaseFrame:ShowCloseButton( true )
	BaseFrame:MakePopup()
	BaseFrame.Paint = function(self,w,h)
		draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
	end
	
	local WeightFrame = vgui.Create("DPanel",BaseFrame)
	WeightFrame:SetPos(SpaceOffset,SpaceOffset + 20)
	WeightFrame:SetSize(x - SpaceOffset*2,y*0.1 + SpaceOffset)
	WeightFrame.Paint = function(self,w,h)
		draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
	end
	
	local LW, LH = WeightFrame:GetSize()
	
	local WeightBar = vgui.Create("DPanel",WeightFrame)
	WeightBar:SetPos(SpaceOffset,LH*0.8 - SpaceOffset)
	WeightBar:SetSize(LW - SpaceOffset*2,LH*0.2)
	WeightBar.Paint = function(self,w,h)
		draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
	end
	
	local LW, LH = WeightBar:GetSize()
	
	local WeightFill = vgui.Create("DPanel",WeightBar)
	WeightFill:SetPos(SpaceOffset/2,SpaceOffset/2)
	WeightFill:SetSize(LW-SpaceOffset,LH-SpaceOffset)
	WeightFill.Paint = function(self,w,h)
	
		local WeightScale = TotalWeight / MaxWeight
	
	
		draw.RoundedBoxEx( 4, 0, 0, w * WeightScale, h, Color( 255 * WeightScale, 255 - (255*WeightScale), 0, 150 ), true,true,true,true )
	end
	
	local WeightValue = vgui.Create("DLabel",WeightBar)
	WeightValue:SetText("FUCK YOU")
	WeightValue:SetDark(true)
	WeightValue:SizeToContents()
	WeightValue:Center()

	CM_RedrawWeight(WeightValue)

	local WeaponFrame = vgui.Create("DPanel",BaseFrame)
	WeaponFrame:SetSize(x - SpaceOffset*2, y*0.8 )
	WeaponFrame:SetPos(SpaceOffset,SpaceOffset + 40 + y*0.1)
	WeaponFrame.Paint = function(self,w,h)
		draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
	end
	
	local WeaponScroll = vgui.Create("DScrollPanel",WeaponFrame)
	WeaponScroll:StretchToParent(SpaceOffset,SpaceOffset,SpaceOffset,SpaceOffset)
	WeaponScroll:Center()
	
	local List = vgui.Create("DIconLayout",WeaponScroll)
	List:SetSize(x - SpaceOffset*4 -  20,600)
	List:SetSpaceX(SpaceOffset)
	List:SetSpaceY(SpaceOffset)
	
	local Keys = table.GetKeys( CMWD )

	table.sort( Keys, function( a, b )
	
		if CMWD[a].Weight == CMWD[b].Weight then
			return a < b
		else
			return CMWD[a].Weight < CMWD[b].Weight
		end
	
		
	end )

	for i=1, #Keys do
	
		local k = Keys[i]
		local v = CMWD[k]
	
		local ListItem = List:Add("DPanel")
		ListItem:SetSize(x - SpaceOffset*4 - 20,150)
		
		if table.HasValue(CurrentLoadout,k) then
			ListItem.IsCurrentlySelected = true
		else
			ListItem.IsCurrentlySelected = false
		end
		
		
		ListItem.Paint = function(self,w,h)
		
			local RedMod = 255
			local GreenMod = 255
			local BlueMod =  255
			
			if self.IsCurrentlySelected then
				RedMod = 0
				BlueMod = 0
			elseif ( (v.Weight + TotalWeight) > MaxWeight) then
				GreenMod = 0
				BlueMod = 0
			end
			
			--print(TotalWeight,MaxWeight)
			
		
			draw.RoundedBoxEx( 4, 0, 0, w, h, Color( RedMod, GreenMod, BlueMod, 150 ), true,true,true,true )
		end
		
		
		
		local SWEP = weapons.GetStored(k)
		
		if SWEP then
			local ContentIcon = vgui.Create("ContentIcon",ListItem)
			ContentIcon:SetMaterial("entities/" .. k)
			ContentIcon:SetName(SWEP.PrintName or "NULL")
			ContentIcon:SetPos(10,10)
			ContentIcon.DoClick = function()
			
				if ListItem.IsCurrentlySelected then
					table.RemoveByValue(CurrentLoadout,k)
					ListItem.IsCurrentlySelected = false
				else
					if (v.Weight + TotalWeight) > MaxWeight then
						surface.PlaySound( "buttons/weapon_cant_buy.wav" )
					else
						table.Add(CurrentLoadout,{k})
						ListItem.IsCurrentlySelected = true
					end
				end
				
				RunConsoleCommand("cm_editor_weapons", string.Trim(string.Implode(" ",CurrentLoadout)))
				
				timer.Simple(0, function()
					CM_RedrawWeight(WeightValue)
				end)
			
			end
			
			local WeaponNameFrame = vgui.Create("DPanel",ListItem)
			WeaponNameFrame:SetPos(150,SpaceOffset)
			WeaponNameFrame:SetSize(x - SpaceOffset*4 - 20 - 20 - 150,40)
			WeaponNameFrame:SetText("")
			WeaponNameFrame.Paint = function(self,w,h)
				draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
			end
			
			local WeaponNameText = vgui.Create("DLabel",WeaponNameFrame)
			WeaponNameText:SetText(SWEP.PrintName .. " [" .. v.Weight .. "KG]")
			WeaponNameText:SetFont("DermaLarge")
			WeaponNameText:SizeToContents()
			WeaponNameText:Center()
			
			
			
			
			
		end

	end
	
	
	
	--for i=1, 50 do
		--local ListItem = List:Add("DPanel")
		--ListItem:SetSize(100,100)
	--end
	
	
	
end

concommand.Add( "cm_loadout", CM_ShowClassMenu)

	
function CM_RedrawWeight(WeightValue)
	
	local Weapons = string.Explode(" ",string.Trim(GetConVar("cm_editor_weapons"):GetString()))
	
	TotalWeight = 0
	
	for k,v in pairs(Weapons) do
		if not CMWD[v] then
			--print("FAGGOT")
		else
			TotalWeight = TotalWeight + CMWD[v].Weight
		end
	end
	
	WeightValue:SetText(TotalWeight .. "/" .. MaxWeight)
	WeightValue:SizeToContents()
	WeightValue:Center()
	
end