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

	-- vim.cmd([[
	-- 	highlight LineNr guibg=NONE ctermbg=NONE
	-- 	highlight CursorLineNr guifg=#88c0d0 gui=bold guibg=NONE
	-- 	highlight Normal guibg=NONE ctermbg=NONE
	-- 	highlight NormalNC guibg=NONE ctermbg=NONE
	-- 	highlight SignColumn guibg=NONE
	-- 	highlight EndOfBuffer guibg=NONE
	-- 	highlight VertSplit guibg=NONE
	-- ]])
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
			transparency = false,
		},
	})

	vim.cmd("colorscheme rose-pine")
end

themes.vague = function()
	require('vague').setup({
		transparent = true, -- If true, background is not set
		bold = true,   -- Disable bold globally
		italic = true, -- Disable italic globally
		on_highlights = function(hl, colors) end,
		colors = {
			bg = '#141415',
			inactiveBg = '#1c1c24',
			fg = '#cdcdcd',
			floatBorder = '#878787',
			line = '#252530',
			comment = '#606079',
			builtin = '#b4d4cf',
			func = '#c48282',
			string = '#e8b589',
			number = '#e0a363',
			property = '#c3c3d5',
			constant = '#aeaed1',
			parameter = '#bb9dbd',
			visual = '#333738',
			error = '#d8647e',
			warning = '#f3be7c',
			hint = '#7e98e8',
			operator = '#90a0b5',
			keyword = '#6e94b2',
			type = '#9bb4bc',
			search = '#405065',
			plus = '#7fa563',
			delta = '#f3be7c',
		},
	})
	vim.cmd.colorscheme('vague')
end

themes.gorgorithm = function()
	require("base16-colorscheme").with_config({
		telescope = true,
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
