local opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>", opts)
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>", opts)
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>", opts)
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>", opts)

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-j>", "<C-d>zz", { desc = "move down by half screen" })
vim.keymap.set("n", "<C-k>", "<C-u>zz", { desc = "move up by half screen" })

vim.keymap.set("n", "<leader>bd", function()
	vim.cmd("bp | bd #")
end, { desc = "Close buffer" })

vim.keymap.set("n", "<leader>t", "<Cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>h", "<Cmd>tabprevious<CR>", { desc = "Prev tab" })
vim.keymap.set("n", "<leader>l", "<Cmd>tabnext<CR>", { desc = "Next tab" })

vim.keymap.set("n", "<C-n>", "<Cmd>Oil<CR>", { desc = "File Explorer Oil" })
