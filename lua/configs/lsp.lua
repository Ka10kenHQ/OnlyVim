vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr })
		vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = bufnr })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
		vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = bufnr })
		vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = bufnr })
	end,
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

vim.lsp.config("gopls", {
	root_markers = { "go.mod", ".git" },
	settings = {
		gopls = {
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
})

vim.lsp.config("ts_ls", {
	root_markers = { "package.json", "tsconfig.json", ".git" },
	single_file_support = false,
})

vim.lsp.config("pyright", {
	root_markers = { "pyproject.toml", "setup.py", ".git" },
})

vim.lsp.config("rust_analyzer", {
	root_markers = { "Cargo.toml", ".git" },
})

vim.lsp.config("roslyn", {
	on_attach = function()
		print("Roslyn attached")
	end,

	settings = {
		["csharp|inlay_hints"] = {
			csharp_enable_inlay_hints_for_implicit_object_creation = true,
			csharp_enable_inlay_hints_for_implicit_variable_types = true,
		},
		["csharp|code_lens"] = {
			dotnet_enable_references_code_lens = true,
			dotnet_enable_tests_code_lens = true,
		},
	},

	flags = {
		debounce_text_changes = 150,
	},
})

vim.lsp.enable({
	"lua_ls",
	"gopls",
	"ts_ls",
	"pyright",
	"rust_analyzer",
	"roslyn",
})
