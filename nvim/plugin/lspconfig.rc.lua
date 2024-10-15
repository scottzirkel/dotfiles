local masonStatus, mason = pcall(require, 'mason')
if not masonStatus then
  return
end

local masonLSPStatus, masonLSP = pcall(require, 'mason-lspconfig')
if not masonLSPStatus then
  return
end

local lspStatus, lspconfig = pcall(require, 'lspconfig')
if not lspStatus then
  return
end

local nullStatus, nullls = pcall(require, 'null-ls')
if not nullStatus then
  return
end

-- Setup Mason to automatically install LSP servers
mason.setup()
masonLSP.setup({ automatic_installation = true })

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- PHP
lspconfig.intelephense.setup({
  capabilities = capabilities,
})

-- lspconfig.phpactor.setup({
--   on_attach = function(client, bufnr)
--     vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
--   end,
--   init_options = {
--     ['language_server_phpstan.enabled'] = true,
--     ['language_server_psalm.enabled'] = false,
--   },
--   capabilities = capabilities,
-- })

-- Vue, JavaScript, TypeScript
lspconfig.volar.setup({
  -- enable takeover mode for all JS/TS LSP services
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  capabilities = capabilities,
})

-- Tailwind
lspconfig.tailwindcss.setup({ capabilities = capabilities })

lspconfig.jsonls.setup({
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
})

nullls.setup({
  sources = {
    nullls.builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js ' })
      end,
    }),
    nullls.builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),
    nullls.builtins.formatting.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js ' })
      end,
    }),
    nullls.builtins.formatting.prettierd,
  },
})

lspconfig.prosemd_lsp.setup({})

require('mason-null-ls').setup({ automatic_installation = true })

-- Keymaps
vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

-- Commands
vim.api.nvim_create_user_command('Format', function()
  vim.lsp.buf.format({ async = true })
end, {})

-- vim.api.nvim_create_autocmd('BufWritePre', {
--   buffer = buffer,
--   callback = function()
--     vim.lsp.buf.format({ async = true })
--   end,
-- })

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = true,
  },
})

-- Sign configuration
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
