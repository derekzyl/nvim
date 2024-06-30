

-- this part is telling Neovim to use the lsp server
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'clangd', 'tailwindcss','eslint','html','solc' }
for _, lsp in pairs(servers) do
  if lsp == 'pyright' then
    require('lspconfig')[lsp].setup{
      on_attach=on_attach,
      flags={
debounce_text_changes=150
      },
      capabilities=capabilities,

      python = {
    analysis = {
      autoSearchPaths = true,
    }
    }}
  else
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        },
        capabilities= capabilities
    }
  end 
end

-- this is for diagnositcs signs on the line number column
-- use this to beautify the plain E W signs to more fun ones
-- !important nerdfonts needs to be setup for this to work in your terminal
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " } 
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end
