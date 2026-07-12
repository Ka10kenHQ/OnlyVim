vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"bash",
		"cpp",
		"html",
		"lua",
		"javascript",
		"typescript",
		"css",
		"python",
		"rust",
		"sql",
		"xml",
		"java",
		"svelte",
	},
	callback = function()
		vim.treesitter.start()
	end,
})
