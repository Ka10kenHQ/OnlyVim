local themes = {}

themes.color_buddy = function()
	local colorbuddy = require("colorbuddy")

	colorbuddy.colorscheme("my-colorscheme-name")

	local Color = colorbuddy.Color
	local colors = colorbuddy.colors
	local Group = colorbuddy.Group
	local groups = colorbuddy.groups
	local styles = colorbuddy.styles

	Color.new("background", "#282c34")
	Color.new("red", "#cc6666")
	Color.new("green", "#99cc99")
	Color.new("yellow", "#f0c674")

	Group.new("Function", colors.yellow, colors.background, styles.bold)
	Group.new("luaFunctionCall", groups.Function, groups.Function, groups.Function)

	Group.new("Error", colors.red:light(), nil, styles.bold)

	Group.new("italicBoldFunction", colors.green, groups.Function, styles.bold + styles.italic)

	Group.new("boldFunction", colors.yellow, colors.background, groups.italicBoldFunction - styles.italic)

	vim.cmd.colorscheme("gruvbuddy")
end

themes.rose_pine = function()
	require("rose-pine").setup({
		variant = "auto",
		dark_variant = "main",
		dim_inactive_windows = false,
		extend_background_behind_borders = true,

		enable = {
			terminal = true,
			legacy_highlights = true,
			migrations = true,
		},

		styles = {
			bold = true,
			italic = true,
			transparency = true,
		},

		groups = {
			border = "muted",
			link = "iris",
			panel = "surface",

			error = "love",
			hint = "iris",
			info = "foam",
			note = "pine",
			todo = "rose",
			warn = "gold",

			git_add = "foam",
			git_change = "rose",
			git_delete = "love",
			git_dirty = "rose",
			git_ignore = "muted",
			git_merge = "iris",
			git_rename = "pine",
			git_stage = "iris",
			git_text = "rose",
			git_untracked = "subtle",

			h1 = "iris",
			h2 = "foam",
			h3 = "rose",
			h4 = "gold",
			h5 = "pine",
			h6 = "foam",
		},
	})

	vim.cmd("colorscheme rose-pine")
end

themes.gorgorithm = function()
	require("base16-colorscheme").with_config({
		telescope = false,
		indentblankline = true,
		notify = true,
		ts_rainbow = true,
		cmp = true,
		illuminate = true,
		dapui = true,
	})
	vim.cmd("colorscheme base16-black-metal-gorgoroth")
end

return themes
