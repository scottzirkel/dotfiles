vim.cmd[[let g:loaded_python3_provider = 0]]
vim.cmd[[let g:loaded_ruby_provider = 0]]
vim.cmd[[let g:loaded_pearl_provider = 0]]

require('user.keymaps')
require('user.base')
require('user.highlights')
require('user.options')
require('user.misc')
require('user.plugins')

