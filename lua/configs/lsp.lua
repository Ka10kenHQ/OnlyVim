local M = {}
local keymaps = function(builtin, bufnr)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
	vim.keymap.set("n", "wr", builtin.lsp_references, { buffer = bufnr })
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr })
	vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = bufnr })
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
	vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = bufnr })
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = bufnr })
	vim.keymap.set("n", "<space>wd", builtin.lsp_document_symbols, { buffer = bufnr })
end

local lsp_servers = function()
	return {
		gopls = {
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
		},
		lua_ls = {
			capabilities = {
				textDocument = {
					semanticTokens = vim.NIL,
				},
			},
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
		},
		rust_analyzer = {},
		html = {},
		pyright = {},
		mojo = { manual_install = true },
		ts_ls = {
			root_dir = vim.fs.root(0, { "package.json" }),
			single_file_support = false,
			capabilities = {
				textDocument = {
					formatting = vim.NIL,
				},
			},
		},
		jsonls = {
			capabilities = {
				textDocument = {
					formatting = vim.NIL,
				},
			},
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		},
		tinymist = {},
	}
end

local dotnet_setup = function()
	vim.lsp.config("roslyn", {
		on_attach = function()
			print("Roslyn attached yay!")
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
			["csharp|formatting"] = {
				enable = true,
				dotnet_organize_imports_on_format = true,
			},
		},
	})
end

function M.setup()
	require("mason").setup({
		registries = {
			"github:mason-org/mason-registry",
			"github:Crashdummyy/mason-registry",
		},
	})

	dotnet_setup()

	local capabilities
	if pcall(require, "cmp_nvim_lsp") then
		capabilities = require("cmp_nvim_lsp").default_capabilities()
	end

	local servers = lsp_servers()
	local servers_to_install = vim.tbl_filter(function(key)
		local t = servers[key]
		return type(t) == "table" and not t.manual_install or t == true
	end, vim.tbl_keys(servers))

	local ensure_installed = {
		"stylua",
		"lua_ls",
		"black",
	}
	vim.list_extend(ensure_installed, servers_to_install)
	require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

	for name, config in pairs(servers) do
		if config == true then
			config = {}
		end
		config = vim.tbl_deep_extend("force", { capabilities = capabilities or {} }, config)
		vim.lsp.config[name] = config
		vim.lsp.enable(name)
	end

	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local bufnr = args.buf
			local builtin = require("telescope.builtin")
			vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
			keymaps(builtin, bufnr)
		end,
	})

	vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
end

return M
