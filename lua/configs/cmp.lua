local M = {}

function M.setup()
	vim.opt.completeopt = { "menu", "menuone", "noselect" }
	vim.opt.shortmess:append("c")

	local lspkind = require("lspkind")
	lspkind.init({
		symbol_map = { Copilot = "" },
	})

	local kind_formatter = lspkind.cmp_format({
		mode = "symbol_text",
		menu = {
			buffer = "[buf]",
			nvim_lsp = "[LSP]",
			nvim_lua = "[api]",
			path = "[path]",
			luasnip = "[snip]",
			gh_issues = "[issues]",
			tn = "[TabNine]",
			eruby = "[erb]",
		},
	})

	local cmp = require("cmp")

	cmp.setup({
		sources = {
			{ name = "nvim_lsp" },
			{ name = "path" },
			{ name = "buffer" },
			{ name = "luasnip" },
		},
		mapping = {
			["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
			["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
			["<Return>"] = cmp.mapping(cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }), { "i", "c" }),
		},
		snippet = {
			expand = function(args)
				vim.snippet.expand(args.body)
			end,
		},
		formatting = {
			fields = { "abbr", "kind", "menu" },
			expandable_indicator = true,
			format = function(entry, vim_item)
				return kind_formatter(entry, vim_item)
			end,
		},
		sorting = {
			priority_weight = 2,
			comparators = {
				cmp.config.compare.offset,
				cmp.config.compare.exact,
				cmp.config.compare.score,
				cmp.config.compare.recently_used,
				cmp.config.compare.locality,
				cmp.config.compare.kind,
				cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order,
			},
		},
		window = {
			documentation = cmp.config.window.bordered(),
		},
	})

	cmp.setup.filetype({ "sql" }, {
		sources = {
			{ name = "vim-dadbod-completion" },
			{ name = "buffer" },
		},
	})
end

return M
