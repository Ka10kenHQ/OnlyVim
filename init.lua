require("opts")
require("keymaps")
require("autocmd")

require("lazy").setup({
	"tpope/vim-sleuth",

	require("plugins.lsp"),

	require("plugins.lspkind"),

	require("plugins.sqlui"),

	require("plugins.cmp"),

	require("plugins.formatter"),

	require("plugins.themes"),

	require("plugins.trouble"),

	require("plugins.transparent"),

	require("plugins.statusline"),

	require("plugins.treesitter"),

	require("plugins.typst"),

	require("plugins.colors"),

	require("plugins.commentsBrackets"),

	require("plugins.oil"),

	require("plugins.git"),

	require("plugins.which_key"),

	require("plugins.telescope"),

	-- require("plugins.copilot"),
}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "AugmentChatHistory*",
	callback = function()
		vim.bo.modifiable = true
	end,
})
