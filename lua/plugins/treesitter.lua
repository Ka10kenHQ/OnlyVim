vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require("nvim-treesitter").setup({
	ensure_installed = {
		"bash",
		"cpp",
		"html",
		"lua",
		"javascript",
		"css",
		"python",
		"rust",
		"sql",
		"xml",
		"java",
	},

	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = { "ruby" },
	},

	indent = {
		enable = true,
		disable = { "ruby" },
	},

	autotag = {
		enable = true,
	},
})
