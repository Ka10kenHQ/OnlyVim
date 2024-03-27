vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

--NvimTreeCommands
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "NvimTree Toggle" })
vim.keymap.set("n", "<leader>s", ":NvimTreeFocus<CR>", { desc = "NvimTree Focus" })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Terminal keymaps
vim.api.nvim_set_keymap(
	"n",
	"<leader>h",
	"<Cmd>lua require('nvterm.terminal').toggle('horizontal')<CR>",
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>v",
	"<Cmd>lua require('nvterm.terminal').toggle('vertical')<CR>",
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"t",
	"<leader>h",
	"<Cmd>lua require('nvterm.terminal').toggle('horizontal')<CR>",
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"t",
	"<leader>v",
	"<Cmd>lua require('nvterm.terminal').toggle('horizontal')<CR>",
	{ noremap = true, silent = true }
)

-- Code runner

vim.keymap.set("n", "<leader>cr", ":RunCode<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crf", ":RunFile<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crft", ":RunFile tab<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crp", ":RunProject<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crc", ":RunClose<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = false })
