require("mason").setup()
require("mason-lspconfig").setup({
  -- Automatically install language servers listed in pyrights.lua
  ensure_installed = {
    'pyright',
    'rust_analyzer',
    'tsserver',
    'clangd',
    'eslint',
    'html',
    'lua_ls',
    'gopls',
    'cssls',
    'jsonls',
    'yamlls',
  },
  -- Automatically set up servers configured in pyrights.lua
  automatic_installation = true,
})
-- LSP configurations are now handled in pyrights.lua and inlay_hint.lua

-- Lua
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})
