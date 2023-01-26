local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = { 'NvimTree' },
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = {},
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["if"] = "@function.inner",
        ["af"] = "@function.outer",
        ["ic"] = "@class.inner",
        ["ac"] = "@class.outer",
        ["ia"] = "@parameter.inner",
        ["aa"] = "@paramter.outer"
      }
    }
  },
  context_commentstring = {
    enable = true,
  },
  ensure_installed = {
    "javascript",
    "markdown",
    "tsx",
    "toml",
    "php",
    "json",
    "yaml",
    "css",
    "html",
    "vue",
    "astro"
  },
  autotag = {
    enable = true
  }
}
