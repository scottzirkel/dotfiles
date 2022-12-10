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

use({
  'projekt0n/github-nvim-theme',
  config = function()
    require("github-theme").setup({
      theme_style = "dimmed",
      function_style = "italic",
      sidebars = { "qf", "vista_kind", "terminal", "packer" },

      -- Change the "hint" color to the "orange" color, and make the "error" color bright red
      colors = { hint = "orange", error = "#ff0000" },

      -- Overwrite the highlight groups
      overrides = function(c)
        return {
          htmlTag = { fg = c.red, bg = "#282c34", sp = c.hint, style = "underline" },
          DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
          -- this will remove the highlight groups
          TSField = {},
        }
      end
    })
  end
})

use({
  'tpope/vim-fugitive',
  requires = 'tpope/vim-rhubarb',
  cmd = 'G',
})

use('L3MON4D3/LuaSnip')

use({
  'hrsh7th/nvim-cmp',
  requires = {
    'L3MON4D3/LuaSnip',
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

use({
  'neovim/nvim-lspconfig',
  requires = {
    'b0o/schemastore.nvim',
    'folke/lsp-colors.nvim'
  },
  config = function()
    require('user.plugins.lspconfig')
  end
}) -- LSP

use({
  'windwp/nvim-autopairs',
  config = function()
    require('nvim-autopairs').setup()
  end,
})

use('windwp/nvim-ts-autotag')

--use({
--  'akinsho/bufferline.nvim',
--  requires = 'kyazdani42/nvim-web-devicons',
--  config = function()
--    require('user.plugins.bufferline')
--  end,
--})

use({
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  config = function()
    require('user.plugins.lualine')
  end,
})

use({
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
})


use({
  'nvim-telescope/telescope.nvim',
  requires = {
    { 'nvim-lua/plenary.nvim' },
    { 'kyazdani42/nvim-web-devicons' },
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
  config = function()
    require('user.plugins.phpactor')
  end,
})

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
