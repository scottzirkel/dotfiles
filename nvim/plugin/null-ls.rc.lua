local status, null_ls = pcall(require, 'null-ls')
if not status then
  return
end

local async_formatting = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  vim.lsp.buf_request(bufnr, 'textDocument/formatting', vim.lsp.util.make_formatting_params({}), function(err, res, ctx)
    if err then
      local err_msg = type(err) == 'string' and err or err.message
      -- you can modify the log message / level (or ignore it completely)
      vim.notify('formatting: ' .. err_msg, vim.log.levels.WARN)
      return
    end

    -- don't apply results if buffer is unloaded or has been modified
    if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, 'modified') then
      return
    end

    if res then
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or 'utf-16')
      vim.api.nvim_buf_call(bufnr, function()
        vim.cmd('silent noautocmd update')
      end)
    end
  end)
end

local augroup = vim.api.nvim_create_augroup('LspFormatting', { clear = true })

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == 'null-ls'
    end,
    bufnr = bufnr,
  })
end

null_ls.setup({
  debug = true,
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
    -- null_ls.builtins.formatting.eslint_d.with({
    --   condition = function(utils)
    --     return utils.root_has_file({ '.eslintrc.js' })
    --   end,
    -- }),

    -- null_ls.builtins.formatting.blade_formatter,
    null_ls.builtins.formatting.pint.with({
      condition = function(utils)
        return utils.root_has_file({ 'vendor/bin/pint' })
      end,
    }),
    -- null_ls.builtins.formatting.phpcsfixer,
    null_ls.builtins.formatting.jq,
    --    null_ls.builtins.formatting.rustywind,
    null_ls.builtins.formatting.stylua,
  },
  -- on_attach = function(client, bufnr)
  --   if client.supports_method('textDocument/formatting') then
  --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --     vim.api.nvim_create_autocmd('BufWritePre', {
  --       group = augroup,
  --       buffer = bufnr,
  --       callback = function()
  --         async_formatting(bufnr)
  --       end,
  --     })
  --   end
  -- end,
})

vim.api.nvim_create_user_command('DisableLspFormatting', function()
  vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
end, { nargs = 0 })
