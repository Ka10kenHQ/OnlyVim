vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
})

local cmp = require("blink.cmp")
cmp.build():wait(60000)

cmp.setup({
	keymap = { preset = "enter" },

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		documentation = { auto_show = false },
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		per_filetype = {
			sql = { "dadbod" },
		},

		providers = {
			dadbod = { module = "vim_dadbod_completion.blink" },
		},
	},

	fuzzy = {
		implementation = "prefer_rust_with_warning",
	},
})
