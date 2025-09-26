

-- this part is telling Neovim to use the lsp server
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = { 'pyright', 'rust_analyzer', 'ts_ls', 'clangd', 'eslint','html' }

-- Define on_attach function if not already defined
local on_attach = function(client, bufnr)
  -- Add any common on_attach logic here
end

for _, lsp in pairs(servers) do
  if lsp == 'pyright' then
    vim.lsp.config(lsp, {
      on_attach=on_attach,
      flags={
        debounce_text_changes=150
      },
      capabilities=capabilities,
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
          }
        }
      }
    })
  else
    vim.lsp.config(lsp, {
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        },
        capabilities= capabilities
    })
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
