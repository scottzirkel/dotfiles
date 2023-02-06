local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if fn.empty(fn.glob(install_path)) > 0 then
  is_bootstrap = true
  fn.execute('!git clone https://github.com/wbthomason/packer.nvim' .. install_path)
  vim.cmd([[packadd packer.nvim]])
end

local status, packer = pcall(require, 'packer')
if not status then
  return
end

packer.reset()
packer.init({
  compile_path = fn.stdpath('data') .. '/site/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'solid' })
    end,
  },
})

local use = packer.use
-- Install plugins
use('wbthomason/packer.nvim') -- to self manage

-- Commenting support
use('tpope/vim-commentary')

-- Add, change, and delete surrounding text
use('tpope/vim-surround')

-- Useful commands like :Rename and :SudoWrite
use('tpope/vim-eunuch')

-- Pairs of handy bracket mappings, like [b and ]b
use('tpope/vim-unimpaired')

-- Indent autodetection with editorconfig support
use('tpope/vim-sleuth')

-- Allow plugins to enable repeating of commands
use('tpope/vim-repeat')

-- Add more languages
use('sheerun/vim-polyglot')

-- Navigate seamlessly between Vim windows and Tmux panes.
use('christoomey/vim-tmux-navigator')

-- Jump to the last location when opening a file
use('farmergreg/vim-lastplace')

-- Enable * searching with visually selected text
use('nelstrom/vim-visual-star-search')

-- Automatically create parent dirs when saving
use('jessarcher/vim-heritage')

-- Text objects for HTML attributes
use({
  'whatyouhide/vim-textobj-xmlattr',
  requires = 'kana/vim-textobj-user',
})

-- Automatically set the working directory to the project root
use({
  'airblade/vim-rooter',
  setup = function()
    vim.g.rooter_manual_only = 1
  end,
  config = function()
    vim.cmd('Rooter')
  end,
})

-- Automatically add closing brackets, quotes, etc
use('windwp/nvim-autopairs')

-- Add smooth scrolling to avoid jarring jumps
use({
  'karb94/neoscroll.nvim',
  config = function()
    require('neoscroll').setup()
  end,
})

-- Allow closing buffers without closing the split window
use({
  'famiu/bufdelete.nvim',
  config = function()
    vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
  end,
})

-- Split array and methods onto multiple lines, or join them back up
use({
  'AndrewRadev/splitjoin.vim',
  config = function()
    vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
    vim.g.splitjoin_trailing_comma = 1
    vim.g.splitjoin_php_method_chain_full = 1
  end,
})

-- Pasting with indentation adjusted
use({
  'sickill/vim-pasta',
  config = function()
    vim.g.pasta_disabled_filetypes = { 'fugitive' }
  end,
})

-- Theme
use('shaunsingh/nord.nvim')

use('kyazdani42/nvim-web-devicons') -- File icons

-- Snippet engine
use('L3MON4D3/LuaSnip')

use({
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lua',
    'jessarcher/cmp-path',
    'onsails/lspkind-nvim',
    'saadparwaiz1/cmp_luasnip',
  },
})

use({
  'neovim/nvim-lspconfig',
  requires = {
    'b0o/schemastore.nvim',
    'folke/lsp-colors.nvim',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
}) -- LSP

-- Autoclose & autorename tags
use('windwp/nvim-ts-autotag')

use({
  'akinsho/bufferline.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  after = 'nord.nvim',
})

-- Display indentation lines
use('lukas-reineke/indent-blankline.nvim')

-- Dashboard
use({
  'glepnir/dashboard-nvim',
  commit = '1aab263f4773106abecae06e684f762d20ef587e',
})
use({
  'MaximilianLloyd/ascii.nvim',
  requires = 'MunifTanjim/nui.nvim',
})

use('norcalli/nvim-colorizer.lua') -- Preview colors in hex ie: #fedc56

-- Gitblame and stuff
use('lewis6991/gitsigns.nvim')

use({
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  after = 'nord.nvim',
})

use({
  'nvim-treesitter/nvim-treesitter',
  run = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  requires = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'p00f/nvim-ts-rainbow',
  },
})

-- use({
--   'nvim-treesitter/nvim-treesitter',
--   --  commit = '3cccb6f494eb255b32a290d37c35ca12584c74d0'
--   run = ':TSUpdate',
--   requires = {
--     'nvim-treesitter/playground',
--     'nvim-treesitter/nvim-treesitter-textobjects',
--     'JoosepAlviste/nvim-ts-context-commentstring',
--   },
-- })

use('ixru/nvim-markdown')

use('wuelnerdotexe/vim-astro')

use({
  'folke/zen-mode.nvim',
  config = function()
    require('zen-mode').setup({})
  end,
})

use({
  'folke/twilight.nvim',
  config = function()
    require('twilight').setup({})
  end,
})

use('nvim-lua/plenary.nvim')

use({
  'nvim-telescope/telescope.nvim',
  requires = {
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    { 'nvim-telescope/telescope-live-grep-args.nvim' },
  },
  config = function()
    require('user.plugins.telescope')
  end,
})
--use('nvim-telescope/telescope-file-browser.nvim')

use({
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons',
  },
  tag = 'nightly',
})

-- use('jose-elias-alvarez/null-ls.nvim')
use('MunifTanjim/prettier.nvim')

use({
  'phpactor/phpactor',
  branch = 'master',
  ft = 'php',
  run = 'composer install --no-dev -o',
})

use({
  'andrewferrier/wrapping.nvim',
  config = function()
    require('wrapping').setup()
  end,
})

use({
  'tpope/vim-fugitive',
  requires = 'tpope/vim-rhubarb',
})

use({
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
})

use({
  'iamcco/markdown-preview.nvim',
  run = function()
    vim.fn['mkdp#util#install']()
  end,
})

use('vim-test/vim-test')

-- Automatically bootstrap plugins
if is_bootstrap then
  packer.sync()
end

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print('==================================')
  print('    Plugins are being installed')
  print('    Wait until Packer completes,')
  print('       then restart nvim')
  print('==================================')
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])
-- local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
-- vim.api.nvim_create_autocmd('BufWritePost', {
--   command = 'source <afile> | PackerCompile',
--   group = packer_group,
--   pattern = vim.fn.expand '$MYVIMRC',
-- })
