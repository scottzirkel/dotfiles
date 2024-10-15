local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Theme
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
  },

  -- Commenting support
  'tpope/vim-commentary',

  -- Add, change, and delete surrounding text
  'tpope/vim-surround',

  -- Useful commands like :Rename and :SudoWrite
  'tpope/vim-eunuch',

  -- Pairs of handy bracket mappings, like [b and ]b
  'tpope/vim-unimpaired',

  -- Indent autodetection with editorconfig support
  'tpope/vim-sleuth',

  -- Allow plugins to enable repeating of commands
  'tpope/vim-repeat',

  -- Add more languages
  -- 'sheerun/vim-polyglot',

  -- Navigate seamlessly between Vim windows and Tmux panes.
  'christoomey/vim-tmux-navigator',

  -- Jump to the last location when opening a file
  'farmergreg/vim-lastplace',

  -- Enable * searching with visually selected text
  'nelstrom/vim-visual-star-search',

  -- Automatically create parent dirs when saving
  'jessarcher/vim-heritage',

  -- Text objects for HTML attributes
  {
    'whatyouhide/vim-textobj-xmlattr',
    dependencies = 'kana/vim-textobj-user',
  },

  -- Automatically set the working directory to the project root
  {
    'airblade/vim-rooter',
    init = function()
      vim.g.rooter_manual_only = 1
    end,
    config = function()
      vim.cmd('Rooter')
    end,
  },

  -- Automatically add closing brackets, quotes, etc
  'windwp/nvim-autopairs',

  -- Add smooth scrolling to avoid jarring jumps
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup()
    end,
  },

  -- Allow closing buffers without closing the split window
  {
    'famiu/bufdelete.nvim',
    config = function()
      vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
    end,
  },

  -- Split array and methods onto multiple lines, or join them back up
  {
    'AndrewRadev/splitjoin.vim',
    config = function()
      vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
      vim.g.splitjoin_trailing_comma = 1
      vim.g.splitjoin_php_method_chain_full = 1
    end,
  },

  -- Pasting with indentation adjusted
  {
    'sickill/vim-pasta',
    config = function()
      vim.g.pasta_disabled_filetypes = { 'fugitive' }
    end,
  },

  -- Theme
  -- use('shaunsingh/nord.nvim')
  -- use('catppuccin/nvim', name = "catppuccin") -- try this if you get tired of kanagawa https://github.com/catppuccin/nvim

  'nvim-tree/nvim-web-devicons', -- File icons

  -- Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-buffer',
      'jessarcher/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind-nvim',
    },
  },

  -- 'mhartington/formatter.nvim',

  -- Language Server Protocol
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'b0o/schemastore.nvim',
      'folke/lsp-colors.nvim',
      'jose-elias-alvarez/null-ls.nvim',
      'jayp0521/mason-null-ls.nvim'
    },
  },

  -- Autoclose & autorename tags

  {
    'akinsho/bufferline.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'rebelot/kanagawa.nvim',
    },
  },

  -- Display indentation lines
{
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    scope = {
      show_start = false,
    },
    exclude = {
      filetypes = {
        'dashboard',
      },
    },
  }
},

  -- Dashboard
  {
    'glepnir/dashboard-nvim',
    commit = '1aab263f4773106abecae06e684f762d20ef587e',
  },

  {
    'MaximilianLloyd/ascii.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
  },

  -- 'norcalli/nvim-colorizer.lua', -- Preview colors in hex ie: #fedc56
  'brenoprata10/nvim-highlight-colors',

  -- Gitblame and stuff
  'lewis6991/gitsigns.nvim',

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
--      {
--      'JoosepAlviste/nvim-ts-context-commentstring',
--      opts = {
--        custom_calculation = function (node, language_tree)
--          if vim.bo.filetype == 'blade' and language_tree._lang ~= 'javascript' then
--            return '{{-- %s --}}'
--          end
--        end,
--      },
--    },
      -- 'JoosepAlviste/nvim-ts-context-commentstring',
      'p00f/nvim-ts-rainbow',
      'windwp/nvim-ts-autotag',
    },
  },

  'ixru/nvim-markdown',

  'wuelnerdotexe/vim-astro',

  {
    'folke/zen-mode.nvim',
    config = function()
      require('zen-mode').setup({})
    end,
  },

  {
    'folke/twilight.nvim',
    config = function()
      require('twilight').setup({})
    end,
  },

  'nvim-lua/plenary.nvim',

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-live-grep-args.nvim',
    },
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    -- tag = 'nightly',
  },

  'MunifTanjim/prettier.nvim',

  {
    'phpactor/phpactor',
    ft = 'php',
    build = 'composer install --no-dev -o',
    config = function()
      vim.keymap.set('n', '<Leader>pm', ':PhpactorContextMenu<CR>')
      vim.keymap.set('n', '<Leader>pn', ':PhpactorClassNew<CR>')
    end,
  },

  {
    'andrewferrier/wrapping.nvim',
    config = function()
      require('wrapping').setup()
    end,
  },

  {
    'tpope/vim-fugitive',
    dependencies = 'tpope/vim-rhubarb',
  },

  {
    'voldikss/vim-floaterm',
    config = function()
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_height = 0.8
      vim.keymap.set('n', '<F1>', ':FloatermToggle<CR>')
      vim.keymap.set('t', '<F1>', '<C-\\><C-n>:FloatermToggle<CR>')
      vim.cmd([[
      highlight link Floaterm CursorLine
      highlight link FloatermBorder CursorLineBg
    ]])
    end,
  },

  {
    'iamcco/markdown-preview.nvim',
    build = 'packloadall! | call mkdp#util#install()',
  },

  'vim-test/vim-test',

  {
    'folke/trouble.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('trouble').setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },

  {
    'tpope/vim-projectionist',
    dependencies = {'tpope/vim-dispatch'},
  },
}, {
  checker = {
    enabled = true,
    frequency = 864000
  },
})
