local tbl = 
{
	class = "SubTree",
	nodes = 
	{
		
		{
			class = "Action",
			nodes = 
			{
			},
			settings = 
			{
			},
			variables = 
			{
				filename = "tm_Usewaypoint",
				finishcode = "",
				info = "",
				monitorcode = "GUI:Text('Last State: '..tostring(self:getState()))",
				runcode = "if(context.usewaypoint_id and context.usewaypoint_id > 0) then\n\t\tlocal wp = WaypointList()[context.usewaypoint_id]\n\t\t\n\t\tif(table.valid(wp)) then\n\t\t\t\tif(Inventory:GetInventoryMoney() > (139*math.log10(ml_global_information.Player_Level))*2) then\n\t\t\t\t\t\tif(wp.distance > 250 and Player:TeleportToWaypoint(context.usewaypoint_id)) then\n\t\t\t\t\t\t\t\tself:success()\n\t\t\t\t\t\t\t\treturn\n\t\t\t\t\t\tend\n\t\t\t\telse\n\t\t\t\t\t\td(\"[UseWaypoint]: Not enough gold\")\n\t\t\t\tend\n\t\tend\nend\nself:fail()",
				startcode = "",
			},
		},
	},
	settings = 
	{
	},
	variables = 
	{
		filename = "tm_Usewaypoint.st",
		finishcode = "",
		info = "",
		menucode = "",
		monitorcode = "GUI:Text('Last State: '..tostring(self:getState())) GUI:Text('Filename: '..self.variables.filename) GUI:Text('Filepath: '..self.filepath)",
		runcode = "context.usewaypoint_id = self.settings.waypointid",
		startcode = "",
		subtreeuicode = "self.settings.waypointid = GUI:InputInt(\"Waypoint ID\", self.settings.waypointid or 0, 0)\n local WPList = WaypointList()\n\tlocal nearesst = nil\n\tlocal nearestdist = 99999999\n  for wid,wpentry in pairs(WPList) do\n    if(wpentry.onmesh and not wpentry.contested and ( not nearesst or (wpentry.distance < nearestdist))) then\n       nearestdist = wpentry.distance\n       nearesst = wpentry\n    end\n  end\n\nif(not table.valid(nearesst)) then\n\t\tGUI:Text(\"No waypoint found\")\nelse\n\t\tif(GUI:Button(\"Select nearest\")) then\n\t\t\t\tself.settings.waypointid = nearesst.id\n\t\tend\nend",
	},
}



return tbl