return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "Bilal2453/luvit-meta", lazy = true },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			{ "j-hui/fidget.nvim", opts = {} },

			"stevearc/conform.nvim",

			"b0o/SchemaStore.nvim",
		},
		config = function()
			require("configs.lsp").setup()
		end,
	},
}
