vim.pack.add({
	{ src = "https://github.com/tjdevries/colorbuddy.nvim" },
	{ src = "https://github.com/rose-pine/neovim" },
	{ src = "https://github.com/RRethy/base16-nvim" },
	{ src = "https://github.com/vague-theme/vague.nvim" } })

local theme_configs = require("configs.theme")

local M = {}

function M.colorbuddy()
	require("colorbuddy").setup()
	theme_configs.color_buddy()
end

function M.rose_pine()
	require("rose-pine").setup()
	theme_configs.rose_pine()
end

function M.gorgoroth()
	require("base16-colorscheme").setup()
	theme_configs.gorgorithm()
end

function M.vague()
	require("vague").setup()
	theme_configs.vague()
end

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- vim.cmd.colorscheme("habamax")
		M.vague()
	end,
})

return M
