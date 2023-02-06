local masonStatus, mason = pcall(require, "mason")
if (not masonStatus) then return end

local masonLSPStatus, masonLSP = pcall(require, "mason-lspconfig")
if (not masonLSPStatus) then return end

local lspStatus, lspconfig = pcall(require, "lspconfig")
if (not lspStatus) then return end

-- Setup Mason to automatically install LSP servers
mason.setup()
masonLSP.setup({automatic_installation = true})

-- PHP
lspconfig.intelephense.setup({})

-- Vue, JavaScript, TypeScript
lspconfig.volar.setup({
  -- enable takeover mode for all JS/TS LSP services
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
})

-- Tailwind
lspconfig.tailwindcss.setup({})

-- Keymaps
vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text= false,
  float = {
    source = true
  }
})

-- Sign configuration
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
