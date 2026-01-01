
-- this part is telling Neovim to use the lsp server
local lspconfig = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Define on_attach function if not already defined
local on_attach = function(client, bufnr)
  -- Add any common on_attach logic here
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Server configurations with correct names
local servers = {
  pyright = {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
        }
      }
    }
  },
  rust_analyzer = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
  tsserver = {  -- Changed from 'ts_ls' to 'tsserver'
    on_attach = on_attach,
    capabilities = capabilities,
  },
  clangd = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
  eslint = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
  html = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
  -- Add more language servers
  lua_ls = {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
  gopls = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
  cssls = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
  jsonls = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
  yamlls = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
}

-- Setup each language server
for server_name, config in pairs(servers) do
  lspconfig[server_name].setup(config)
end

-- this is for diagnositcs signs on the line number column
-- use this to beautify the plain E W signs to more fun ones
-- !important nerdfonts needs to be setup for this to work in your terminal
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " } 
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end
