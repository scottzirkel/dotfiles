local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function (use)
  use 'wbthomason/packer.nvim' -- to self manage
  use 'nvim-lualine/lualine.nvim' -- Statusline
  
    use({
    'projekt0n/github-nvim-theme',
    config = function()
      require("github-theme").setup({
        theme_style = "dark",
        function_style = "italic",
        sidebars = {"qf", "vista_kind", "terminal", "packer"},

        -- Change the "hint" color to the "orange" color, and make the "error" color bright red
        colors = {hint = "orange", error = "#ff0000"},

        -- Overwrite the highlight groups
        overrides = function(c)
          return {
            htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
            DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
            -- this will remove the highlight groups
            TSField = {},
          }
        end
      })
    end })

    -- Automatically bootstrap plugins
  if packer_bootstrap then
    require('packer').sync()
  end
  end)
