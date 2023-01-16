local status, nord = pcall(require, "nord")
if (not status) then return end


vim.g.nord_enable_sidebar_background = true
nord.set()

vim.cmd [[colorscheme nord]]

