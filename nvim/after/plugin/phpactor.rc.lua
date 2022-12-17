local status, phpactor = pcall(require, "phpactor")
if (not status) then return end

phpactor.setup({})

vim.cmd([[
  augroup PhpactorMappings
    au!
    au FileType php nmap <buffer> <Leader>pm :PhpactorContextMenu<CR>
    au FileType php nmap <buffer> <Leader>pn :PhpactorClassNew<CR>
    au FileType php nmap <buffer> <leader>o :PhpactorNavigate<CR>
  augroup END
]])
