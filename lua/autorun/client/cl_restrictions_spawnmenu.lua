-- Notify the player | Local Restrictions Chat Notify
local function LocalRestrictionNotify( Text )

	chat.AddText( Color(15, 95, 185), LocalPlayer():Nick(), Color( 225, 225, 225 ), " - "..Text ) 

end

-- Restrict SpawnMenuOpen
hook.Add("OnSpawnMenuOpen", "RestictionsSpawnMenu", function()

	if ( GetConVar("RestrictionsEnabled"):GetBool() == false ) then return end

	local commandPlayer = LocalPlayer()

	local plyAllowed = Restrictions.Whitelist[commandPlayer:GetUserGroup()]

	if ( not plyAllowed && GetConVar("RestrictionsWhitelist"):GetBool() == true ) then

		LocalRestrictionNotify("You cannot open the SpawnMenu!")
		return false

	else 

		return

	end

end)

