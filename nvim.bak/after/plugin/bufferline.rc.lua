local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = 'tabs',
    separator_style = 'slant',
    -- always_show_bufferline = false,
    tab_size = 0,
    max_name_length = 25,
    offsets = {
      {
        filetype = 'NvimTree',
        text = ' Files',
        highlight = 'StatusLine',
        text_align = 'left'
      }
    },
    show_buffer_close_icons = true,
    show_close_icon = false,
    color_icons = true,
    modified_icon = '',
    custom_areas = {
      left = function()
        return {
          { text = '    ', fg = '#8fff6d', bg = '#1f1f28'},
        }
      end,
    },
  },
  highlights = {
    separator_selected = {
      fg = '#1F1F28',
      bg = '#1F1F28'
    },
  }
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
