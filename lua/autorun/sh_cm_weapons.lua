-- Class Mod Weapon Data
CMWD = {}

-- ~Weight~ --
--[[
	0 = Knife
	1 = Crowbar, Grenades, Glock, USP
	2 = Stun-stick, p228, FiveSeven,
	3 = Desert Eagle, Dual Bertta
	4 = M3 Shotgun, Mac10, MP5, TMP
	5 = p90, UMP, XM1014, Scout Sniper
	6 = Famas, Galil, M4A1
	7 = AK47, Aug, SIG552
	8 = AWP, G3, SIG550
	9 = Para
--]]

CMWD["weapon_cs_ak47"] = { 
	Weight = 8,
	DTDam = 2,
	SDam = 0,
}

CMWD["weapon_cs_aug"] =	{ 
	Weight = 7,
	DTDam = 2,
	SDam = 0,
}

CMWD["weapon_cs_awp"] =	{ 
	Weight = 9,
	DTDam = 0,
	SDam = 100,
}

-- NOTE FOR AWP:
-- Bodyshot: Drains Shields
-- Headshots: Kills Instantly
	
CMWD["weapon_cs_deserteagle"] = { 
	Weight = 3,
	DTDam = 0,
	SDam = 20,
	}
CMWD["weapon_cs_dualbertta"] = { 
	Weight = 3,
	DTDam = 2,
	SDam = 0,
	}
CMWD["weapon_cs_famas"] = { 
	Weight = 6,
	DTDam = 1,
	SDam = 10,
	}
CMWD["weapon_cs_fiveseven"] = { 
	Weight = 2,
	DTDam = 2,
	SDam = 0,
	}
	
CMWD["weapon_cs_g3"] = { 
	Weight = 8,
	DTDam = 5,
	SDam = 0,
	}
	
CMWD["weapon_cs_galil"] = { 
	Weight = 6,
	DTDam = 1,
	SDam = 20,
	}
	
CMWD["weapon_cs_glock"] = { 
	Weight = 1,
	DTDam = 1,
	SDam = 10,
	}
	
CMWD["weapon_cs_he"] = { 
	Weight = 1,
	DTDam = 0,
	SDam = 0,
	}
	
CMWD["weapon_cs_knife"] = { 
	Weight = 0,
	DTDam = 0,
	SDam = 0,
	}
	
CMWD["weapon_cs_m3"] = { 
	Weight = 4,
	DTDam = 0,
	SDam = 10,
	}
	
CMWD["weapon_cs_m4"] = { 
	Weight = 6,
	DTDam = 1,
	SDam = 10,
	}

CMWD["weapon_cs_mac10"] = { 
	Weight = 4,
	DTDam = 0,
	SDam = 10,
	}
	
CMWD["weapon_cs_mp5"] = { 
	Weight = 4,
	DTDam = 0,
	SDam = 10,
	}
	
CMWD["weapon_cs_p90"] = { 
	Weight = 5,
	DTDam = 2,
	SDam = 0,
	}
	
CMWD["weapon_cs_p228"] = { 
	Weight = 2,
	DTDam = 0,
	SDam = 20,
	}

CMWD["weapon_cs_para"] = { 
	Weight = 9,
	DTDam = 2,
	SDam = 0,
	}

CMWD["weapon_cs_scout"] = { 
	Weight = 5,
	DTDam = 10,
	SDam = 0,
	}

CMWD["weapon_cs_sig550"] = { 
	Weight = 8,
	DTDam = 5,
	SDam = 0,
	}

CMWD["weapon_cs_sig552"] = { 
	Weight = 7,
	DTDam = 1,
	SDam = 20,
	}

CMWD["weapon_cs_tmp"] =	{ 
	Weight = 4,
	DTDam = 1,
	SDam = 20,
	}
	
CMWD["weapon_cs_ump"] =	{ 
	Weight = 5,
	DTDam = 3,
	SDam = 10,
	}
	
CMWD["weapon_cs_usp"] =	{ 
	Weight = 1,
	DTDam = 1,
	SDam = 10,
	}
	
CMWD["weapon_cs_xm1014"] = { 
	Weight = 5,
	DTDam = 0,
	SDam = 10,
	}
	
	
	
-- Extra Weapons

CMWD["weapon_bur_medkit"] = { 
	Weight = 2,
	DTDam = 0,
	SDam = 0,
	}

CMWD["weapon_cs_357"] = { 
	Weight = 4,
	DTDam = 0,
	SDam = 0,
	}
	
CMWD["weapon_cs_ar2"] = { 
	Weight = 6,
	DTDam = 0,
	SDam = 0,
	}	
	
CMWD["weapon_cs_crossbow"] = { 
	Weight = 8,
	DTDam = 0,
	SDam = 0,
	}	
	
CMWD["weapon_cs_crowbar"] = { 
	Weight = 1,
	DTDam = 0,
	SDam = 0,
	}

CMWD["weapon_cs_pistol"] = { 
	Weight = 2,
	DTDam = 0,
	SDam = 0,
	}	

CMWD["weapon_cs_rpg"] = { 
	Weight = 10,
	DTDam = 0,
	SDam = 0,
	}
	
CMWD["weapon_cs_smg"] = { 
	Weight = 4,
	DTDam = 0,
	SDam = 0,
	}
	
CMWD["weapon_cs_spas"] = { 
	Weight = 5,
	DTDam = 0,
	SDam = 0,
	}	
	
CMWD["weapon_bur_pee"] = { 
	Weight = 1,
	DTDam = 0,
	SDam = 0,
	}	
	
CMWD["weapon_bur_c4"] = { 
	Weight = 3,
	DTDam = 0,
	SDam = 0,
}	

CMWD["weapon_bur_gl"] = { 
	Weight = 2,
	DTDam = 0,
	SDam = 0,
}

CMWD["weapon_bur_naughty"] = { 
	Weight = 5,
	DTDam = 0,
	SDam = 0,
}
	
--Tools
--[[
CMWD["weapon_physgun"] = { 
	Weight = 0,
	DTDam = 0,
	SDam = 0,
}

CMWD["weapon_physcannon"] = { 
	Weight = 0,
	DTDam = 0,
	SDam = 0,
}

CMWD["gmod_tool"] = { 
	Weight = 0,
	DTDam = 0,
	SDam = 0,
}
--]]
	