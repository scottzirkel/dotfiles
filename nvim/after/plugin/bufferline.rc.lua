local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

local highlights = require("nord").bufferline.highlights({
  italic = true,
  bold = true
})

bufferline.setup({
  options = {
    mode = 'tabs',
    separator_style = 'slant',
    always_show_bufferline = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    color_icons = true,
    modified_icon = '',
  },
  highlights = highlights
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
