vim.pack.add({
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local fzf = require("fzf-lua")

		fzf.setup({
			{ "telescope" },

			keymap = {
				fzf = {
					["ctrl-j"] = "down",
					["ctrl-k"] = "up",
				},
			},

			fzf_colors = true,

			winopts = {
				height = 0.85,
				width = 0.80,
				row = 0.35,
				col = 0.50,
				border = "rounded",
				backdrop = 60,

				no_header = true,

				treesitter = {
					enabled = true,
					fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" }
				},

				preview = {
					border = "rounded",
					layout = "horizontal",
				},
			},

			files = {
				cwd_prompt  = false,
				cwd_header = false,
				fd_opts = table.concat({
					"--type f",
					"--hidden",
					"--follow",
					"--exclude node_modules",
					"--exclude .venv",
					"--exclude venv",
					"--exclude __pycache__",
					"--exclude *.pyc",
					"--exclude *.egg-info",
					"--exclude target",
					"--exclude .git",
				}, " "),
			},

			grep = {
				rg_opts = table.concat({
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
				}, " "),
			},
		})

		vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>fw", fzf.grep_cword, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>fd", fzf.diagnostics_document, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>fr", fzf.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>f.", fzf.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader><leader>", fzf.buffers, { desc = "[ ] Find existing buffers" })
		vim.keymap.set("n", "<leader>gb", fzf.git_branches, { desc = "[S]earch [G]it [B]ranches" })
		vim.keymap.set("n", "<leader>gc", fzf.git_bcommits, { desc = "[S]earch [G]it [C]ommits" })

		-- lsp
		vim.keymap.set("n", "sr", fzf.lsp_references)
		vim.keymap.set("n", "<space>wd", fzf.lsp_document_symbols)

		-- current buffer search
		vim.keymap.set("n", "<leader>fb", function()
			fzf.grep_curbuf()
		end, { desc = "[/] Fuzzily search in current buffer" })

		-- neovim config files
		vim.keymap.set("n", "<leader>fn", function()
			fzf.files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })

		-- optional: make vim.ui.select use fzf
		fzf.register_ui_select()
	end,
})

local function set(name, opts)
	vim.api.nvim_set_hl(0, name, opts)
end

local colors = {
	red = "#ff5f5f",
	green = "#5fff87",
	blue = "#5f87ff",
	yellow = "#ffd75f",
	white = "#ffffff",
	black = "#000000",
	darker_black = "#121212",
	black2 = "#1c1c1c",
	one_bg = "#262626",
	one_bg3 = "#3a3a3a",
}

set("FzfLuaNormal", { bg = colors.darker_black })
set("FzfLuaBorder", { fg = colors.one_bg3 })
set("FzfLuaTitle", { fg = colors.black, bg = colors.green })
set("FzfLuaPreviewTitle", { fg = colors.black, bg = colors.blue })
set("FzfLuaCursorLine", { bg = colors.black2 })
set("FzfLuaSearch", { fg = colors.blue })
