return {
	{
		-- Remove phpcs linter.
		"mfussenegger/nvim-lint",
		optional = true,
		opts = {
			linters_by_ft = {
				php = {},
			},
		},
	},
	{
		-- Add neotest-pest plugin for running PHP tests.
		-- A package is also available for PHPUnit if needed.
		"nvim-neotest/neotest",
		dependencies = { "V13Axel/neotest-pest" },
		opts = { adapters = { "neotest-pest" } },
	},
	-- {
	-- Add the Laravel.nvim plugin which gives the ability to run Artisan commands
	-- from Neovim.
	-- "adalessa/laravel.nvim",
	-- dependencies = {
	-- 	"nvim-telescope/telescope.nvim",
	-- 	"tpope/vim-dotenv",
	-- 	"MunifTanjim/nui.nvim",
	-- },
	-- cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
	-- keys = {
	-- 	{ "<leader>la", ":Laravel artisan<cr>" },
	-- 	{ "<leader>lr", ":Laravel routes<cr>" },
	-- 	{ "<leader>lm", ":Laravel related<cr>" },
	-- },
	-- event = { "VeryLazy" },
	-- config = true,
	-- opts = {
	-- 	lsp_server = "intelephense",
	-- 	features = { null_ls = { enable = false } },
	-- },
	-- },

	{
		"adalessa/laravel.nvim",
		dependencies = {
			"tpope/vim-dotenv",
			"nvim-telescope/telescope.nvim",
			"MunifTanjim/nui.nvim",
			"kevinhwang91/promise-async",
		},
		cmd = { "Laravel" },
		keys = {
			{ "<leader>L", "", desc = " 󰫐 Laravel" },
			{ "<leader>La", ":Laravel artisan<cr>" },
			{ "<leader>Lr", ":Laravel routes<cr>" },
			{ "<leader>Lm", ":Laravel related<cr>" },
		},
		event = { "VeryLazy" },
		opts = {},
		config = true,
	},

	{
		-- Add the blade-nav.nvim plugin which provides Goto File capabilities
		-- for Blade files.
		"ricardoramirezr/blade-nav.nvim",
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		ft = { "blade", "php" }, -- optional, improves startup time
	},
	{
		-- Add a Treesitter parser for Laravel Blade to provide Blade syntax highlighting.
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"blade",
				"php_only",
			})
		end,
		config = function(_, opts)
			vim.filetype.add({
				pattern = {
					[".*%.blade%.php"] = "blade",
				},
			})

			require("nvim-treesitter.configs").setup(opts)
			---@class parser_config
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.blade = {
				install_info = {
					url = "https://github.com/EmranMR/tree-sitter-blade",
					files = { "src/parser.c" },
					branch = "main",
					generate_requires_npm = true,
					requires_generate_from_grammar = true,
				},
				filetype = "blade",
			}
		end,
	},
}
