vim.pack.add({
	{ src = "https://github.com/seblyng/roslyn.nvim" },
})

require("roslyn").setup({
	filewatching = "roslyn",

	choose_target = nil,
	ignore_target = nil,

	broad_search = true,

	lock_target = false,

	silent = false,
})
