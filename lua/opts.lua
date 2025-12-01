vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.background = "dark"

vim.g.have_nerd_font = true

vim.opt.number = true

vim.opt.relativenumber = true

vim.opt.mouse = "a"

vim.opt.showmode = false

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.guicursor = ""

vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"
vim.opt.updatetime = 50

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.inccommand = "split"

vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.opt.scrolloff = 10

vim.opt.autoread = true
vim.opt.autowrite = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.loader.enable()

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
