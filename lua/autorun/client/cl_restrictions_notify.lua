-- Notify the player | Restrictions Chat Notify
net.Receive("RestrictionsNotify", function( len, ply  )

	local Text = net.ReadString()

	chat.AddText( Color(15, 95, 185), LocalPlayer():Nick(), Color( 225, 225, 225 ), " - "..Text ) 


end)