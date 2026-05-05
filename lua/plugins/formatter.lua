vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
	async = true,
	notify_on_error = true,

	format_on_save = function(_)
		return {
			timeout_ms = 1000,
			lsp_fallback = true,
		}
	end,

	formatters_by_ft = {
		lua = { "stylua" },
		cpp = { "clang_format" },
		c = { "clang_format" },
		-- cs = { "csharpier" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		rust = { "rustfmt" },
		html = { "prettier" },
		jsx = { "prettier" },
		typescriptreact = { "prettier" },
		python = { "black" },
		json = { "clang_format" },
	},
})
