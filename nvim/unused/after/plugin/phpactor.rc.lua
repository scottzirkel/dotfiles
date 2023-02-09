local status, phpactor = pcall(require, 'phpactor')
if not status then
  return
end

phpactor.setup({})

vim.keymap.set('n', '<C-i>', ':PhpactorImportClass', { normap = true, silent = true })

vim.cmd([[
  augroup PhpactorMappings
    au!
    au FileType php nmap <buffer> <Leader>cm :PhpactorContextMenu<CR>
    au FileType php nmap <buffer> <Leader>cn :PhpactorClassNew<CR>
    au FileType php nmap <buffer> <Leader>o :PhpactorNavigate<CR>
    au FileType php nmap <buffer> <Leader>rei :call :PhpactorClassInflect()<CR>
    " au FileType php nmap <buffer> <C-i> :PhpactorImportClass<CR>
    au FileType php nmap <buffer> <C-I> :PhpactorImportMissingClasses<CR>
  augroup END
]])
