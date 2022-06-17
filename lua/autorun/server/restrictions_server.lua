util.AddNetworkString("RestrictionsNotify")

local function RestrictionsTriggeredProperty( commandPlayer, commandText, entity )

	local plyAllowed = Restrictions.Whitelist[commandPlayer:GetUserGroup()]

	if ( not plyAllowed && GetConVar("RestrictionsWhitelist"):GetBool() == true ) then

		Notification = "You cannot use "..commandText.." on "..entity:GetName()

		net.Start("RestrictionsNotify")
		net.WriteString(Notification)
		net.Send(commandPlayer)

		return false

	else 

		return true

	end 

end

hook.Add("CanProperty", "RestrictPlayerProperty", function( ply, property, entity )

	if ( GetConVar("RestrictionsEnabled"):GetBool() == false ) then return end

	RestrictionsTriggeredProperty( ply, property, entity )

end)