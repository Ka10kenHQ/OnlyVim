return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},

	{
		"numToStr/Comment.nvim",
		opts = function()
			return require("configs.comments")
		end,
		config = function(_, opts)
			require("Comment").setup(opts)
		end,
	},
}
