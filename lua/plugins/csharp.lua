return {
	"iabdelkareem/csharp.nvim",
	dependencies = {
		"mfussenegger/nvim-dap",
		"Tastyep/structlog.nvim",
	},
	config = function()
		require("mason").setup()
		require("csharp").setup()
	end,
}
