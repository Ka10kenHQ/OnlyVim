return {
	"stevearc/conform.nvim",
	opts = {
		async = true,
		notify_on_error = true,
		format_on_save = function(bufnr)
			return {
				timeout_ms = 1000,
				lsp_fallback = vim.bo[bufnr].filetype,
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
		-- formatters = {
		-- 	csharpier = {
		-- 		command = "csharpier",
		-- 		args = {
		-- 			"format",
		-- 			"--write-stdout",
		-- 		},
		-- 		to_stdin = true,
		-- 	},
		-- },
	},
}
