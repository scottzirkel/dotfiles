local status, nvim_tree = pcall(require, "nvim-tree")
if (not status) then return end

nvim_tree.setup({
  git = {
    ignore = false
  },
  filters = {
    dotfiles = false,
  },
  view = {
    width = 40,
    side = "right"
  },
  renderer = {
    highlight_opened_files = '1',
    group_empty = true,
    icons = {
      show = {
        folder_arrow = false
      }
    },
    indent_markers = {
      enable = true
    }
  }
})

-- nord - #575967
vim.cmd([[
  highlight NvimTreeIndentMarker guifg=#363646
  augroup NvimTreeHighlights
    autocmd ColorScheme * highlight NvimTreeIndentMarker guifg=#363646
  augroup end
]])

vim.keymap.set('n', '<Leader>n', ':NvimTreeFindFileToggle<CR>')
