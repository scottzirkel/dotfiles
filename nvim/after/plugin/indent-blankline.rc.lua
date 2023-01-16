local status, indentBlankline = pcall(require, "indent_blankline")
if (not status) then return end

indentBlankline.setup({
  filetype_exclude = {
    'help',
    'terminal',
    'dashboard',
    'packer',
    'lspinfo',
    'TelescopePrompt',
    'TelescopeResults'
  },
  buftype_exclude = {
    'terminal',
    'NvimTree'
  }
})
