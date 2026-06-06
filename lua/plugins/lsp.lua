vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/williamboman/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },

	{ src = "https://github.com/j-hui/fidget.nvim" },
})

require("mason").setup()

require("mason-tool-installer").setup({
	ensure_installed = {
		"lua-language-server",
		"gopls",
		"typescript-language-server",
		"pyright",
		"rust-analyzer",
		"stylua",
		"black",
		"prettier",
	},
})

require("fidget").setup({})

require("configs.lsp")
