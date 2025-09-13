if not GlobalTable then rawset(_G, "GlobalTable", {}) end

local IO = GlobalTable

local folder = "client/yourfolder/yourio.dat"
--[[
If 2 or big 1. So there is Example
]]

local vars_table = {
	"value1",
	"value2",
}

IO.SaveBigOneFile = function(player)
	if player == consoleplayer
		local file = io.openlocal(folder, "w+")
		if file then
			for _, var in ipairs(vars_table) do
				file:write(var.." "..(player[var] or 0).."\n")
			end
			file:close()
		end
	end
end

--[[
If 1 Save. So there:
]]

IO.SaveOneFile = function(player)
	if player == consoleplayer
		local file = io.openlocal(folder, "w+")
		if file then
			file:write(var)
			file:close()
		end
	end
end

-- Load config
IO.LoadStefan = function(player)
	local file = io.openlocal(folder, "r")
	if file then
		for line in file:lines() do
			local k, v = line:match("^(%S+)%s+(%S+)$")
			if k and v then player[k] = tonumber(v) end
		end
		file:close()
	end
end

--This is script is very easy. And what ON this is script. Need write in addHook("ThinkFrame", function() or another addhook or script and e.t.c
IO.SaveSystem = function()
	for player in players.iterate do
		if player == consoleplayer and not player.valuehowmadeonetic then
			IO.LoadStefan(player)
			player.valuehowmadeonetic = true
		end
	end
end
