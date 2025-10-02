return {
	"seblyng/roslyn.nvim",
	ft = { "cs" },
	opts = {
		filewatching = "roslyn",

		choose_target = nil,
		ignore_target = nil,

		broad_search = true,

		lock_target = false,

		silent = false,
	},
}
