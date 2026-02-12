return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },

	config = function()
		local dashboard = require("dashboard")

		dashboard.setup({
			theme = "doom",

			config = {
				header = {
					"",
					"     ██████╗ ███╗   ██╗██╗  ██╗   ██╗██╗███╗   ███╗",
					"    ██╔═══██╗████╗  ██║██║  ╚██╗ ██╔╝██║████╗ ████║",
					"    ██║   ██║██╔██╗ ██║██║   ╚████╔╝ ██║██╔████╔██║",
					"    ██║   ██║██║╚██╗██║██║    ╚██╔╝  ██║██║╚██╔╝██║",
					"    ╚██████╔╝██║ ╚████║███████╗██║   ██║██║ ╚═╝ ██║",
					"     ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝   ╚═╝╚═╝     ╚═╝",
					"",
				},

				center = {

					{
						icon = " ",
						desc = "New File",
						key = "n",
						action = "ene | startinsert",
					},

					{
						icon = " ",
						desc = "Find Files",
						key = "f",
						action = "Telescope find_files",
					},

					{
						icon = " ",
						desc = "Recent Files",
						key = "r",
						action = "Telescope oldfiles",
					},

					{
						icon = " ",
						desc = "Config",
						key = "c",
						action = "edit $MYVIMRC",
					},

					{
						icon = " ",
						desc = "Quit",
						key = "q",
						action = "qa",
					},
				},

				footer = {
					"",
					"OnlyVim — because GUIs are for the weak.",
				},

				vertical_center = true,
			},
		})
	end,
}
