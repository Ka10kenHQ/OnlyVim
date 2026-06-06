local function update_statusline()
	local mode_map = { n = "NORMAL", i = "INSERT", v = "VISUAL", V = "V-LINE", ["\22"] = "V-BLOCK", c = "COMMAND", t = "TERMINAL", R = "REPLACE" }
	local mode = mode_map[vim.api.nvim_get_mode().mode] or vim.api.nvim_get_mode().mode:upper()
	local head = vim.b.gitsigns_status_dict and vim.b.gitsigns_status_dict.head or ""
	local git = head ~= "" and "  " .. head .. " " or ""
	vim.opt.statusline = mode .. git .. "%= %f %m %= %y %l:%c"
end

vim.api.nvim_create_autocmd("VimEnter", { callback = update_statusline, once = true })
vim.api.nvim_create_autocmd({ "BufEnter", "ModeChanged" }, { callback = update_statusline })
vim.api.nvim_create_autocmd("User", { pattern = "GitsignsUpdate", callback = update_statusline })
