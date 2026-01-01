
-- this part is telling Neovim to use the lsp server
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Check if running on mobile (Termux)
local function is_mobile()
  local term = os.getenv("TERMUX_VERSION")
  return term ~= nil
end

-- Define on_attach function if not already defined
local on_attach = function(client, bufnr)
  -- Add any common on_attach logic here
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Server configurations using vim.lsp.config (new API)
-- Pyright configuration
vim.lsp.config('pyright', {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
      }
    }
  }
})

-- Rust Analyzer (only on desktop, not mobile)
-- On mobile: Use Treesitter for syntax highlighting + buffer completion
-- Alternative: Use buffer-based completion (nvim-cmp with buffer source)
-- Note: Full LSP features (go-to-definition, diagnostics) won't be available on mobile
if not is_mobile() then
  vim.lsp.config('rust_analyzer', {
    on_attach = on_attach,
    capabilities = capabilities,
  })
else
  -- Mobile fallback: Enhanced buffer completion for Rust
  -- Treesitter provides syntax highlighting, buffer completion provides code suggestions
  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'rust' },
    callback = function()
      -- Enable buffer completion (words from current and other buffers)
      vim.bo.complete = vim.bo.complete .. ',k'
      -- Set comment string for Rust
      vim.bo.commentstring = '// %s'
    end,
  })
end

-- TypeScript Language Server (ts_ls, not tsserver)
vim.lsp.config('ts_ls', {
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Clangd (only on desktop, not mobile)
-- On mobile: Use Treesitter for syntax highlighting + buffer completion
-- Alternative: Use buffer-based completion (nvim-cmp with buffer source)
-- Note: Full LSP features (go-to-definition, diagnostics) won't be available on mobile
if not is_mobile() then
  vim.lsp.config('clangd', {
    on_attach = on_attach,
    capabilities = capabilities,
  })
else
  -- Mobile fallback: Enhanced buffer completion for C/C++
  -- Treesitter provides syntax highlighting, buffer completion provides code suggestions
  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'c', 'cpp', 'cxx', 'cc', 'h', 'hpp' },
    callback = function()
      -- Enable buffer completion (words from current and other buffers)
      vim.bo.complete = vim.bo.complete .. ',k'
      -- Set comment string for C/C++
      vim.bo.commentstring = '// %s'
      -- Enable better indentation
      vim.bo.cindent = true
    end,
  })
end

-- ESLint
vim.lsp.config('eslint', {
  on_attach = on_attach,
  capabilities = capabilities,
})

-- HTML
vim.lsp.config('html', {
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Lua Language Server
vim.lsp.config('lua_ls', {
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
})

-- Go Language Server
vim.lsp.config('gopls', {
  on_attach = on_attach,
  capabilities = capabilities,
})

-- CSS Language Server
vim.lsp.config('cssls', {
  on_attach = on_attach,
  capabilities = capabilities,
})

-- JSON Language Server
vim.lsp.config('jsonls', {
  on_attach = on_attach,
  capabilities = capabilities,
})

-- YAML Language Server
vim.lsp.config('yamlls', {
  on_attach = on_attach,
  capabilities = capabilities,
})

-- this is for diagnositcs signs on the line number column
-- use this to beautify the plain E W signs to more fun ones
-- !important nerdfonts needs to be setup for this to work in your terminal
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " } 
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end
