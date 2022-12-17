-- Install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_boostrap = ensure_packer()

-- Initialize packer
require('packer').init({
  compile_path = vim.fn.stdpath('data') .. '/site/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'solid' })
    end,
  },
})

-- Install plugins
local use = require('packer').use

use('wbthomason/packer.nvim') -- to self manage
use('tpope/vim-sleuth') -- Indent autodetection with editorconfig support

--use('projekt0n/github-nvim-theme')

use({
  'jessarcher/onedark.nvim',
  config = function()
    vim.cmd('colorscheme onedark')

    -- Hide the characters in FloatBorder
    vim.api.nvim_set_hl(0, 'FloatBorder', {
      fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
      bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
    })

    -- Make the StatusLineNonText background the same as StatusLine
    vim.api.nvim_set_hl(0, 'StatusLineNonText', {
      fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
      bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
    })

    -- Hide the characters in CursorLineBg
    vim.api.nvim_set_hl(0, 'CursorLineBg', {
      fg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
      bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
    })

    vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#30323E' })
    vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })
  end,
})

use('kyazdani42/nvim-web-devicons') -- File icons

use('glepnir/lspsaga.nvim') -- LSP UI

--use({
--  'tpope/vim-fugitive',
--  requires = 'tpope/vim-rhubarb',
--  cmd = 'G',
--})

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
  -- config = function()
  --   require('user.plugins.cmp')
  --  end,
})

use('williamboman/mason.nvim')
use('williamboman/mason-lspconfig.nvim')

use({
  'neovim/nvim-lspconfig',
  requires = {
    'b0o/schemastore.nvim',
    'folke/lsp-colors.nvim',
  }
}) -- LSP

use('windwp/nvim-autopairs')

use('windwp/nvim-ts-autotag')

use('akinsho/bufferline.nvim')
use('norcalli/nvim-colorizer.lua')

use('lewis6991/gitsigns.nvim')

use('dinhhuy258/git.nvim') -- For git blame & browse

use({
  'nvim-lualine/lualine.nvim',
  --  config = function()
  --    require('user.plugins.lualine')
  --  end,
})

use({
  'nvim-treesitter/nvim-treesitter',
  commit = '4cccb6f494eb255b32a290d37c35ca12584c74d0',
  run = ':TSUpdate',
  requires = {
    'nvim-treesitter/playground',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'JoosepAlviste/nvim-ts-context-commentstring'
  }
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
  end
})
--use('nvim-telescope/telescope-file-browser.nvim')

use({
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons'
  },
  tag = 'nightly'
})

use('jose-elias-alvarez/null-ls.nvim')
use('MunifTanjim/prettier.nvim')

use({
  'phpactor/phpactor',
  branch = 'master',
  ft = 'php',
  run = 'composer install --no-dev -o',
})

--use('glepnir/dashboard-nvim')

-- Automatically bootstrap plugins
if packer_bootstrap then
  require('packer').sync()
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])
