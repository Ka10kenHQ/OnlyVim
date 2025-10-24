return {
	"tjdevries/colorbuddy.nvim",
	config = function()
		vim.cmd.colorscheme("gruvbuddy")
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
	end,
}
