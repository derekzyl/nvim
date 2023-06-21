require("mason").setup()
require("mason-lspconfig").setup()
--  require'lspconfig'.tsserver.setup{}

--  require'lspconfig'.pyright.setup{}

 -- require'lspconfig'.clangd.setup{}
 --require('lspconfig').sqls.setup{
    --on_attach = function(client, bufnr)
        --require('sqls').on_attach(client, bufnr)
    --end
--}

-- Lua
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})
