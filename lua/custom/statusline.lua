function _G.statusline_mode()
	local mode_map = {
		n = "NORMAL",
		i = "INSERT",
		v = "VISUAL",
		V = "V-LINE",
		["\22"] = "V-BLOCK",
		c = "COMMAND",
		t = "TERMINAL",
		R = "REPLACE",
	}

	local m = vim.api.nvim_get_mode().mode
	return mode_map[m] or m:upper()
end

function _G.statusline_git()
	local gsd = vim.b.gitsigns_status_dict
	if gsd and gsd.head and gsd.head ~= "" then
		return "  " .. gsd.head .. " "
	end
	return ""
end

vim.opt.statusline =
	"%{v:lua.statusline_mode()} %{v:lua.statusline_git()}%= %f %m %= %y %l:%c"
