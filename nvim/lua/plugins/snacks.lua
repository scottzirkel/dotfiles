return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@module "snacks"
	---@class snacks.Config
	opts = {
		statuscolumn = { enabled = true },
		zen = { enabled = true },
		picker = {
			sources = {
				explorer = {
					layout = {
						layout = { position = "right" },
						preview = true,
					},
				},
			},
		},
	},
}
