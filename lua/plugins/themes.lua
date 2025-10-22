return {
	"shaunsingh/nord.nvim",
	config = function()
		vim.g.nord_contrast = true
		vim.g.nord_borders = false
		vim.g.nord_disable_background = false
		vim.g.nord_italic = true
		vim.g.nord_uniform_diff_background = true
		vim.g.nord_bold = false

		require("nord").set()

		local groups = {
			"Normal",
			"NormalNC",
			"LineNr",
			"CursorLineNr",
			"SignColumn",
			"VertSplit",
			"StatusLine",
			"StatusLineNC",
			"NormalFloat",
			"Folded",
			"EndOfBuffer",
		}

		for _, group in ipairs(groups) do
			vim.cmd(string.format("highlight %s guibg=#000000 ctermbg=0", group))
		end
	end,
}
