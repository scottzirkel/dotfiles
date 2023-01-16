local status, lualine = pcall(require, "lualine")
if (not status) then return end

local function getWords()
  if vim.bo.filetype == "md" or vim.bo.filetype == "txt" or vim.bo.filetype == "markdown" then
    return tostring(vim.fn.wordcount().words .. ' words')
  else
    return ""
  end
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'nord',
    globalstatus = true,
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = { 'mode'},
    lualine_b = { 'branch', 'diff'},
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
    },
    { getWords }
    },
    lualine_x = {
      { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ',
        hint = ' ' } },
      'filetype',
      'encoding',
      'fileformat'
    },
    lualine_y = { '(vim.bo.expandtab and "␠ " or "⇥ ") .. " " .. vim.bo.shiftwidth' },
    lualine_z = { 'location', 'progress' }
  },
  -- inactive_sections = {
  --   lualine_a = {},
  --   lualine_b = {},
  --   lualine_c = { {
  --     'filename',
  --     file_status = true, -- displays file status (readonly status, modified status)
  --     path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
  --   } },
  --   lualine_x = { 'location' },
  --   lualine_y = {},
  --   lualine_z = {}
  -- },
  -- tabline = {},
  extensions = { 'fugitive' }
}
