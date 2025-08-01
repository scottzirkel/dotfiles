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

-- Minimal null-ls setup - most functionality moved to conform.nvim and nvim-lint
null_ls.setup({
  debug = false,
  sources = {
    -- Code actions that don't have LSP equivalents
    null_ls.builtins.code_actions.gitsigns,
    
    -- Specialized diagnostics not covered by nvim-lint
    null_ls.builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),
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
