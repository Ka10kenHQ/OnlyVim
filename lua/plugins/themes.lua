local theme_configs = require("configs.theme")

local themes = {
	colorbuddy = {
		"tjdevries/colorbuddy.nvim",
		config = function()
			theme_configs.color_buddy()
		end,
	},

	rose_pine = {
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			theme_configs.rose_pine()
		end,
	},
	gorgoroth = {
		"RRethy/base16-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			theme_configs.gorgorithm()
		end,
	},
}

return themes.colorbuddy
