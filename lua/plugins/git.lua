vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/akinsho/git-conflict.nvim" },
	{ src = "https://github.com/tpope/vim-fugitive" },
})

require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
})

require("git-conflict").setup({})
