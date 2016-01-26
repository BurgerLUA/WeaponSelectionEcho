function CM_PlayerSpawn(ply)

	if not ply:IsBot() then

		timer.Simple(0,function()
		
			--ply:StripWeapons()
		
			local LoadoutTable = string.Explode(" ",string.Trim(ply:GetInfo("cm_editor_weapons")))
			local TotalWeight = 0
			
			for k,v in pairs(LoadoutTable) do
			
				--print(v)

				if CMWD[v] then
					if TotalWeight + CMWD[v].Weight <= 30 then
						TotalWeight = TotalWeight + CMWD[v].Weight
						
						local Weapon = ply:Give(v)
						--ply:SetActiveWeapon(Weapon)
						
						
					else
						ply:ChatPrint("ERROR: " .. v .. " exceeds weight limit.")
						table.remove(LoadoutTable,k)
					end
				else
					ply:ChatPrint("ERROR: Unknown weapon " .. v )
					table.remove(LoadoutTable,k)
				end
			end
			
			--local ClassData = CMCD[ply:GetInfo("cm_editor_basestats")]
			
			--[[
			ply:SetMaxHealth
			ply.MaxArmor = ClassData.Armor
			ply.MaxShields = ClassData.Shield
			--]]
			
			
		
		end)
		
	end



end

hook.Add("PlayerSpawn","CM: PlayerSpawn",CM_PlayerSpawn)



function CM_ShowSpare2(ply)

	ply:ConCommand("cm_loadout")

end

hook.Add("ShowSpare2","CM: ShowSpare2 Override",CM_ShowSpare2)