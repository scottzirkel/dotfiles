local telescope = require('telescope')
local actions = require('telescope.actions')

vim.cmd([[
  highlight TelescopePromptTitle guifg=#c8c093
  highlight TelescopePreviewTitle guifg=#c8c093
  highlight TelescopePromptBorder guifg=#54546D
  highlight TelescopeTitle guifg=#c8c093
  highlight TelescopeBorder guifg=#54546D
]])


-- vim.cmd([[
--   highlight link TelescopePromptTitle PMenuSel
--   highlight link TelescopePreviewTitle PMenuSel
--   highlight link TelescopePromptNormal NormalFloat
--   highlight link TelescopePromptBorder FloatBorder
--   highlight link TelescopeNormal CursorLine
--   highlight link TelescopeBorder CursorLineBg
-- ]])

telescope.setup({
  defaults = {
    path_display = { truncate = 1 },
    prompt_prefix = '   ',
    selection_caret = '  ',
    layout_config = {
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-Down>'] = actions.cycle_history_next,
        ['<C-Up>'] = actions.cycle_history_prev,
      },
    },
    file_ignore_patterns = { '.git/' },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    buffers = {
      previewer = false,
      layout_config = {
        width = 80,
      },
    },
    oldfiles = {
      prompt_title = 'History',
    },
    lsp_references = {
      previewer = false,
    },
  },
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('live_grep_args')

vim.keymap.set('n', '<Leader>f', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
vim.keymap.set('n', '<Leader>F',
  [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]]) -- luacheck: no max line length
vim.keymap.set('n', '<Leader>b', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
vim.keymap.set('n', '<Leader>g', [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]])
vim.keymap.set('n', '<Leader>h', [[<cmd>lua require('telescope.builtin').oldfiles({cwd_only=true})<CR>]])
vim.keymap.set('n', '<Leader>s', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])
