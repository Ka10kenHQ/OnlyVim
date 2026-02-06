return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = true,
	},
	{
		"tpope/vim-fugitive",
	},
	-- {
	-- 	"otavioschwanck/github-pr-reviewer.nvim",
	-- 	opts = {
	-- 		-- options here
	-- 	},
	-- 	keys = {
	-- 		{ "<leader>p", "<cmd>PRReviewMenu<cr>", desc = "PR Review Menu" },
	-- 		{ "<leader>p", ":<C-u>'<,'>PRSuggestChange<CR>", desc = "Suggest change", mode = "v" },
	-- 	},
	-- },
}
