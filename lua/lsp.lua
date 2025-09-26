require("mason").setup()
require("mason-lspconfig").setup()
-- LSP configurations are now handled in pyrights.lua and inlay_hint.lua

-- Lua
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})
