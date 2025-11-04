return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			-- @type lspconfig.options
			servers = {
				intelephense = {
					filetypes = { "php", "blade", "php_only" },
					settings = {
						intelephense = {
							filetypes = { "php", "blade", "php_only" },
							files = {
								associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
								exclude = { "**/_laravel_idea/**", "**/_laravel_ide/**", "**/vendor/affiliate/**" },
								maxSize = 5000000,
							},
						},
					},
				},
			},
		},
	},
}
