Restrictions = Restrictions or {}


-- Turn on/off this addon, it essentiually won't run. 
CreateConVar("RestrictionsEnabled", 1, FCVAR_ARCHIVE, "Enable or disable NoTarget", 0, 1)

-- Turn on/off the allowed use only feature.
CreateConVar("RestrictionsWhitelist", 0, FCVAR_ARCHIVE, "Enable or disable RestictionsWhitelist", 0, 1)

-- Add the usergroup to the list, quite simple.
Restrictions.Whitelist = {
--  	["user"] = true,
	["moderator"] = true,
	["admin"] = true,
	["superadmin"] = true,
}