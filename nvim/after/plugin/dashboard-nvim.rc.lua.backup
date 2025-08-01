local status, db = pcall(require, "dashboard")
if (not status) then return end

db.custom_header = {
  '',
    '                                        ',
    ' @@@@@@   @@@@@@@@  @@@@@@@@  @@@@@@@@  ',
    '@@@@@@@   @@@@@@@@  @@@@@@@@  @@@@@@@@  ',
    '!@@            @@!       @@!       @@!  ',
    '!@!           !@!       !@!       !@!   ',
    '!!@@!!       @!!       @!!       @!!    ',
    ' !!@!!!     !!!       !!!       !!!     ',
    '     !:!   !!:       !!:       !!:      ',
    '    !:!   :!:       :!:       :!:       ',
    ':::: ::    :: ::::   ::        ::       ',
    ':: : :    : :: : :  : :       : :       ',
    '                                    ',
    '',
}

db.custom_center = {
  { icon = '  ', desc = 'New file                       ', action = 'enew' },
  { icon = '  ', shortcut = 'SPC f', desc = 'Find file                 ', action = 'Telescope find_files' },
  { icon = '  ', shortcut = 'SPC h', desc = 'Recent files              ', action = 'Telescope oldfiles' },
  { icon = '  ', shortcut = 'SPC g', desc = 'Find Word                 ', action = 'Telescope live_grep' },
}

db.custom_footer = { '' }

vim.cmd([[
  augroup DashboardHighlights
    autocmd ColorScheme * highlight DashboardHeader guifg=#7dd3fc
    autocmd ColorScheme * highlight DashboardCenter guifg=#e0f2fe
    autocmd ColorScheme * highlight DashboardShortcut guifg=#7dd3fc
    autocmd ColorScheme * highlight DashboardFooter guifg=#6272a4
  augroup end
]])

vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#ecfccb' })
vim.api.nvim_set_hl(0, 'DashboardCenter', { fg = '#f8f8f2' })
vim.api.nvim_set_hl(0, 'DashboardShortcut', { fg = '#0ea5e9' })
vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#6272a4' })
