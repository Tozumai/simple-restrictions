util.AddNetworkString("RestrictionsNotify")
-- Code for Properties

local function RestrictionsTriggeredProperty( commandPlayer, commandText, entity )

	local plyAllowed = Restrictions.Whitelist[commandPlayer:GetUserGroup()]

	local Notification = "You cannot use "..commandText.." on "..entity:GetName()

	if ( string.len(entity:GetName()) == 0 ) then

		Notification = "You cannot use "..commandText.." on that entity!"

	end

	if ( not plyAllowed && GetConVar("RestrictionsWhitelist"):GetBool() == true ) then

		net.Start("RestrictionsNotify")
		net.WriteString(Notification)
		net.Send(commandPlayer)

		return false

	end

	if ( plyAllowed or GetConVar("RestrictionsWhitelist"):GetBool() == false ) then

		return true

	end

end

hook.Add("CanProperty", "RestrictPlayerProperty", function( ply, property, entity )

	if ( GetConVar("RestrictionsEnabled"):GetBool() == false ) then return end

	local Allow = RestrictionsTriggeredProperty( ply, property, entity )

	return Allow 

end)