local oldwrap = vim.wo.wrap

return {
	"folke/zen-mode.nvim",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	on_open = function()
		oldwrap = vim.wo.wrap
		vim.wo.wrap = true
	end,
	on_close = function()
		vim.wo.wrap = oldwrap
	end,
}
