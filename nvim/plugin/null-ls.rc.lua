local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})',
       condition = function(utils)
         return utils.root_has_file({ '.eslintrc.js ' })
       end,
    }),
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.code_actions.proselint,

    null_ls.builtins.diagnostics.actionlint,
    null_ls.builtins.diagnostics.proselint,
    null_ls.builtins.diagnostics.gitlint,
       null_ls.builtins.diagnostics.luacheck.with({
         extra_args = { '--config', vim.fn.stdpath('config') .. './luacheckrc' },
       }),
    -- null_ls.builtins.diagnostics.phpstan,
    null_ls.builtins.diagnostics.solhint,
    null_ls.builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),
    null_ls.builtins.formatting.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end
    }),
    null_ls.builtins.formatting.pint,
    -- null_ls.builtins.formatting.phpcsfixer,
    null_ls.builtins.formatting.jq,
    --    null_ls.builtins.formatting.rustywind,
       null_ls.builtins.formatting.stylua
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end
      })
    end
  end
}

vim.api.nvim_create_user_command(
  'DisableLspFormatting',
  function()
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
  end,
  { nargs = 0 }
)
