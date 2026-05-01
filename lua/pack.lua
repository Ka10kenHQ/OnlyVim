local function gh(repo)
	return "https://github.com/" .. repo
end

vim._assert_integer = vim._assert_integer or function(value)
	return assert(tonumber(value))
end

local plugin_modules = {
	"tpope/vim-sleuth",
	require("plugins.telescope"),
	require("plugins.themes"),
	require("plugins.lsp"),
	require("plugins.lspkind"),
	require("plugins.comment"),
	require("plugins.autopairs"),
	require("plugins.blink"),
	require("plugins.sqlui"),
	require("plugins.formatter"),
	require("plugins.statusline"),
	require("plugins.treesitter"),
	require("plugins.typst"),
	require("plugins.trouble"),
	require("plugins.oil"),
	require("plugins.git"),
	require("plugins.dotnet"),
}

local specs = {}
local configured_specs = {}
local seen_specs = {}
local seen_configs = {}

local function is_spec_list(value)
	return vim.islist(value) and type(value[1]) == "table"
end

local function plugin_name(repo)
	local name = repo:match("/([^/]+)$") or repo
	return (name:gsub("%.git$", ""))
end

local function normalize_spec(spec)
	if type(spec) == "string" then
		spec = { spec }
	end

	local repo = spec[1] or spec.src
	if not repo then
		return nil
	end

	local src = repo:match("^https?://") and repo or gh(repo)
	local pack_spec = {
		src = src,
		name = spec.name or plugin_name(repo),
	}

	if spec.branch then
		pack_spec.version = spec.branch
	elseif type(spec.version) == "string" and not spec.version:find("*", 1, true) then
		pack_spec.version = spec.version
	end

	return pack_spec
end

local function add_spec(spec)
	if type(spec) == "table" and is_spec_list(spec) then
		for _, child in ipairs(spec) do
			add_spec(child)
		end
		return
	end

	if type(spec) == "table" then
		for _, dep in ipairs(spec.dependencies or {}) do
			add_spec(dep)
		end
	end

	local pack_spec = normalize_spec(spec)
	if not pack_spec then
		return
	end

	if not seen_specs[pack_spec.name] then
		seen_specs[pack_spec.name] = true
		specs[#specs + 1] = pack_spec
	end

	if type(spec) == "table" and not seen_configs[pack_spec.name] then
		seen_configs[pack_spec.name] = true
		configured_specs[#configured_specs + 1] = spec
	end
end

local function setup_plugin(spec)
	if type(spec.init) == "function" then
		spec.init()
	end

	local opts = spec.opts
	if type(opts) == "function" then
		opts = opts()
	end

	if type(spec.config) == "function" then
		spec.config(spec, opts or {})
		return
	end

	if spec.config == true or opts ~= nil then
		local main = spec.main or spec.name
		if not main and type(spec[1]) == "string" then
			main = plugin_name(spec[1])
		end

		local module = ({
			["blink.cmp"] = "blink.cmp",
			["Comment.nvim"] = "Comment",
			["conform.nvim"] = "conform",
			["fidget.nvim"] = "fidget",
			["git-conflict.nvim"] = "git-conflict",
			["nvim-autopairs"] = "nvim-autopairs",
			["trouble.nvim"] = "trouble",
		})[main] or main

		local ok, plugin = pcall(require, module)
		if ok and type(plugin.setup) == "function" then
			if
				module == "blink.cmp"
				and type(plugin.library_available) == "function"
				and not plugin.library_available()
			then
				plugin.build():wait(60000)
			end
			plugin.setup(opts or {})
		end
	end
end

local function build_plugins(ev)
	if ev.data.kind ~= "install" and ev.data.kind ~= "update" then
		return
	end

	if ev.data.spec.name == "telescope-fzf-native.nvim" and vim.fn.executable("make") == 1 then
		vim.system({ "make" }, { cwd = ev.data.path }):wait()
	end

	if ev.data.spec.name == "nvim-treesitter" then
		vim.schedule(function()
			pcall(vim.cmd, "TSUpdate")
		end)
	end
end

vim.api.nvim_create_autocmd("PackChanged", {
	group = vim.api.nvim_create_augroup("vim-pack-build", { clear = true }),
	callback = build_plugins,
})

for _, spec in ipairs(plugin_modules) do
	add_spec(spec)
end

vim.pack.add(specs, { load = true, confirm = false })

for _, spec in ipairs(configured_specs) do
	setup_plugin(spec)
end

require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
		fzf = {},
	},
	defaults = {
		path_display = { "filename_first" },
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},
		file_ignore_patterns = {
			"node_modules",
			"^.venv/",
			"venv/*",
			"%.pyc$",
			"__pycache__/",
			"%.egg%-info/",
			"target/",
		},
		file_inculde_pattern = { "%.json" },
	},

	builtin = {
		lsp_document_symbols = {
			symbol_width = 100,
		},
	},
})

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "[S]earch [G]it [B]ranches" })
vim.keymap.set("n", "<leader>gc", builtin.git_bcommits, { desc = "[S]earch [G]it [C]ommits" })

vim.keymap.set("n", "<leader>fb", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>fn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

require("configs.telescope_theme").apply("borderless")
