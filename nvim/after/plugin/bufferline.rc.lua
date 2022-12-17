local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = 'tabs',
    seperator_style = 'slant',
    always_show_bufferline = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    color_icons = true,
    modified_icon = '',
  },
  highlights = {
    fill = {
      bg = "#22272e",
    },
    background = {
      bg = "#22272e"
    },
    buffer_selected = {
      bg = "#22272e"
    },
    separator = {
      bg = '#22272e'
    },
    indicator_selected = {
      fg = "#ff00ff"
    }
  }
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
