local status, lualine = pcall(require, "lualine")
if (not status) then return end

local colors = {
  red = '#b65e68',
  gray = '#434c5e',
  steel = '#92959b',
  black = '#2e3440',
  white = '#e5e9f0',
  blue = '#81a1c1',
  light_blue = '#82b7c7',
  light_green = '#a3be8c',
  orange = '#fe8019',
  green = '#8ec07c',
}

local function getWords()
  if vim.bo.filetype == "md" or vim.bo.filetype == "txt" or vim.bo.filetype == "markdown" then
    return tostring(vim.fn.wordcount().words .. ' words')
  else
    return ""
  end
end

local bubbles = {
  normal = {
    a = { fg = colors.black, bg = colors.blue },
    b = { fg = colors.white, bg = colors.gray },
    c = { fg = colors.steel, bg = colors.black }
  },
  insert = { a = { fg = colors.black, bg = colors.blue }},
  visual = { a = { fg = colors.black, bg = colors.green }},
  replace = { a = { fg = colors.black, bg = colors.red }},
}

lualine.setup {
  options = {
    icons_enabled = true,
    -- theme = 'nord',
    theme = bubbles,
    globalstatus = true,
    component_separators = '',
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = { {'mode', separator = { left = '' }, right_padding = 2} },
    lualine_b = {
      -- {
      -- 'filename',
      -- file_status = true, -- displays file status (readonly status, modified status)
      -- path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
    -- },
      -- 'filetype',
      -- 'fileformat',
      'branch',
      'diff',
    { getWords }
    },
    lualine_c = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
      },
    },
    lualine_x = {
      'filetype',
      'encoding',
      'fileformat',
      '(vim.bo.expandtab and "␠ " or "⇥ ") .. " " .. vim.bo.shiftwidth',
    },
    lualine_y = {
      { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = '', warn = '', info = '',
        hint = '' } },
      'location'
    },
    lualine_z = { {'progress',  separator = { right = '' }, left_padding = 2} },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = { 'fugitive' }
}
