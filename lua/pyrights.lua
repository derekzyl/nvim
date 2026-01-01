
-- this part is telling Neovim to use the lsp server
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Check if running on mobile (Termux)
local function is_mobile()
  local term = os.getenv("TERMUX_VERSION")
  return term ~= nil
end

-- Helper function to check if executable exists
local function executable_exists(path)
  if not path then return false end
  return vim.fn.executable(path) == 1
end

-- Define on_attach function with full LSP features
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  
  -- Enable diagnostics (using modern API)
  if client.supports_method('textDocument/publishDiagnostics') then
    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
      vim.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
      }
    )
  end
  
  -- Enable formatting on save (optional, can be removed if not desired)
  if client.supports_method('textDocument/formatting') then
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end
  
  -- Print LSP attached message for debugging
  local client_name = client.name
  vim.notify(string.format("LSP %s attached to buffer %d", client_name, bufnr), vim.log.levels.INFO)
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

-- Rust Analyzer Configuration
-- On mobile (Termux): Use native Termux-installed rust-analyzer
-- On desktop: Use Mason-installed version
if is_mobile() then
  -- Use native Termux package (installed via: pkg install rust rust-analyzer)
  -- Try multiple paths to find rust-analyzer
  local rust_analyzer_paths = {
    '/data/data/com.termux/files/usr/bin/rust-analyzer',
    vim.fn.exepath('rust-analyzer'),
  }
  
  local rust_analyzer_path = nil
  for _, path in ipairs(rust_analyzer_paths) do
    if path and vim.fn.executable(path) == 1 then
      rust_analyzer_path = path
      break
    end
  end
  
  if rust_analyzer_path then
    vim.lsp.config('rust_analyzer', {
      cmd = { rust_analyzer_path },
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = function(fname)
        local cargo = vim.fs.find({ 'Cargo.toml' }, { path = fname, upward = true })[1]
        if cargo then
          return vim.fs.dirname(cargo)
        end
        return vim.fs.dirname(fname)
      end,
      settings = {
        ['rust-analyzer'] = {
          cargo = {
            allFeatures = true,
          },
          checkOnSave = {
            command = "clippy",
          },
        },
      },
    })
  else
    vim.notify("rust-analyzer not found. Install with: pkg install rust rust-analyzer", vim.log.levels.WARN)
  end
else
  -- Desktop: Use Mason-installed version
  vim.lsp.config('rust_analyzer', {
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

-- TypeScript Language Server (ts_ls, not tsserver)
vim.lsp.config('ts_ls', {
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Clangd Configuration
-- On mobile (Termux): Use native Termux-installed clangd
-- On desktop: Use Mason-installed version
if is_mobile() then
  -- Use native Termux package (installed via: pkg install clang cmake)
  -- Try multiple paths to find clangd
  local clangd_paths = {
    '/data/data/com.termux/files/usr/bin/clangd',
    vim.fn.exepath('clangd'),
  }
  
  local clangd_path = nil
  for _, path in ipairs(clangd_paths) do
    if path and vim.fn.executable(path) == 1 then
      clangd_path = path
      break
    end
  end
  
  if clangd_path then
    vim.lsp.config('clangd', {
      cmd = { clangd_path, '--background-index' },
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'h', 'hpp' },
      root_dir = function(fname)
        local compile_commands = vim.fs.find({ 'compile_commands.json' }, { path = fname, upward = true })[1]
        if compile_commands then
          return vim.fs.dirname(compile_commands)
        end
        local git = vim.fs.find({ '.git' }, { path = fname, upward = true })[1]
        if git then
          return vim.fs.dirname(git)
        end
        return vim.fs.dirname(fname)
      end,
    })
  else
    vim.notify("clangd not found. Install with: pkg install clang cmake", vim.log.levels.WARN)
  end
else
  -- Desktop: Use Mason-installed version
  vim.lsp.config('clangd', {
    on_attach = on_attach,
    capabilities = capabilities,
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
-- vim.lsp.config('lua_ls', {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     Lua = {
--       runtime = {
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         globals = { 'vim' },
--       },
--       workspace = {
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- })

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
