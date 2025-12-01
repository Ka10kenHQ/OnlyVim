local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"tpope/vim-sleuth",

	require("plugins.themes"),

	require("plugins.lsp"),

	require("plugins.lspkind"),

	require("plugins.telescope"),

	require("plugins.comment"),

	require("plugins.autopairs"),

	require("plugins.blink"),

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
