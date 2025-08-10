return {
	{
		"joshuadanpeterson/typewriter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("typewriter").setup({
				enable_with_zen_mode = true,
				keep_cursor_position = true,
				enable_notifications = true,
				enable_horizontal_scroll = false,
				start_enabled = false,
				always_center = true,
				always_center_filetypes = {},
			})
		end,
		opts = {},
	},

	{
		"folke/zen-mode.nvim",
		opts = {
			on_open = function()
				vim.cmd("TWEnable")
			end,
			on_close = function()
				vim.cmd("TWDisable")
			end,
		},
	},
}
