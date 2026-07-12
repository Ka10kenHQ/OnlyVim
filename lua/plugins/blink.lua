vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/saghen/blink.lib" },
})

local cmp = require("blink.cmp")

cmp.setup({
	keymap = { preset = "enter" },

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		documentation = { auto_show = false },
	},

	sources = {
		default = { "lsp" },

		per_filetype = {
			lua = { "lsp", "snippets" },
			javascript = { "lsp", "snippets" },
			typescript = { "lsp", "snippets" },
			python = { "lsp" },
			rust = { "lsp" },
			sql = { "dadbod" },
		},

		providers = {
			dadbod = { module = "vim_dadbod_completion.blink" },
			buffer = {
				min_keyword_length = 4, -- don't trigger early
				max_items = 5,
			},
			path = {
				min_keyword_length = 3,
			},
		},
	},

	fuzzy = {
		implementation = "rust",
	},
})
