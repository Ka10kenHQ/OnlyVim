local M = {
	padding = true,
	sticky = true,
	ignore = nil,
	toggler = {
		line = "<leader>/",
	},
	opleader = {
		line = "<leader>/",
		block = "gb",
	},

	-- extra = {
	-- above = "gcO",
	-- below = "gco",
	-- eol = "gcA",
	-- },

	mappings = {
		-- basic = true,
		-- extra = true,
	},
	pre_hook = nil,
	post_hook = nil,
}

return M
