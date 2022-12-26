local keymap = vim.keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })

keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')

keymap.set('v', 'y', 'mm`y')

keymap.set('v', 'p', '"_dP')

keymap.set('i', ';;', '<Esc>A;')
keymap.set('i', ',,', '<Esc>A,')

keymap.set('n', '<leader><Esc>', ':nohlsearch<CR>')
--keymap.set('n', '<leader>Q', ':bufo bdelete<CR>')

keymap.set('n', 'q:', ':q<CR>')

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
--keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>')

-- Move text
keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
keymap.set('i', '<A-j', '<Esc>:move .+1<CR>==gi')
keymap.set('n', '<Leader>k', ':move .-2<CR>==')
keymap.set('n', '<Leader>j', ':move .+1<CR>==')
keymap.set('v', '<Leader>k', ":move '<-2<CR>gv=gv")
keymap.set('v', '<Leader>j', ":move '>+1<CR>gv=gv")

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Resize window
keymap.set('n', '<C-Up>', ':resize +2<CR>')
keymap.set('n', '<C-Down>', ':resize -2<CR>')
keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')
