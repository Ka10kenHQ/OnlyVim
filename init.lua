require("opts")
require("keymaps")
require("plugin_manager")

require("lazy").setup({
	"tpope/vim-sleuth",

	require("plugins.themes"),

	require("plugins.lsp"),

	require("plugins.lspkind"),

	require("plugins.telescope"),

	require("plugins.comment"),

	require("plugins.autopairs"),

	require("plugins.cmp"),

	require("plugins.sqlui"),

	require("plugins.formatter"),

	require("plugins.statusline"),

	require("plugins.treesitter"),

	require("plugins.typst"),

	require("plugins.trouble"),

	require("plugins.oil"),

	require("plugins.git"),

	require("plugins.dotnet"),
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
