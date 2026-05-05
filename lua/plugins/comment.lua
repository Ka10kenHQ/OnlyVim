vim.pack.add({
	{ src = "https://github.com/numToStr/Comment.nvim" },
})

require("Comment").setup({
	padding = true,
	sticky = true,
	ignore = nil,

	toggler = {
		line = "<leader>/",
	},

	opleader = {
		line = "<leader>/",
		block = "gb",
	},

	pre_hook = nil,
	post_hook = nil,
})
