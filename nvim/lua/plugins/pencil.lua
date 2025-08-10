return {
	"preservim/vim-pencil",
	dependencies = { -- not really sure if this is correct
		"hrsh7th/nvim-cmp",
	},
	config = function()
		vim.g["pencil#autoformat"] = 1
		vim.g["pencil#textwidth"] = 100
		vim.g["pencil#wrapModeDefault"] = "hard"
		vim.fn["pencil#init"]({ wrap = "hard" })
	end,
	ft = {
		"mkd",
		"markdown",
		"tex",
		"latex",
	},
}
