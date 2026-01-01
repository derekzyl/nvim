
-- this part is telling Neovim to use the lsp server
local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local capabilities = ok and cmp_nvim_lsp.default_capabilities() or vim.lsp.protocol.make_client_capabilities()

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
  -- Use pcall to catch any errors
  local ok, err = pcall(function()
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    
    -- Set up keybindings for LSP features (with error handling)
    local opts = { buffer = bufnr, noremap = true, silent = true }
    pcall(vim.keymap.set, 'n', 'gd', vim.lsp.buf.definition, opts)
    pcall(vim.keymap.set, 'n', 'K', vim.lsp.buf.hover, opts)
    pcall(vim.keymap.set, 'n', 'gi', vim.lsp.buf.implementation, opts)
    pcall(vim.keymap.set, 'n', '<leader>rn', vim.lsp.buf.rename, opts)
    pcall(vim.keymap.set, 'n', '<leader>ca', vim.lsp.buf.code_action, opts)
    pcall(vim.keymap.set, 'n', 'gr', vim.lsp.buf.references, opts)
    
    -- Enable formatting on save (optional, can be removed if not desired)
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        callback = function()
          pcall(vim.lsp.buf.format, { async = false })
        end,
      })
    end
  end)
  
  if not ok then
    vim.notify("Error in on_attach: " .. tostring(err), vim.log.levels.ERROR)
  end
  
  -- Print LSP attached message for debugging (outside pcall to always show)
  local client_name = client and client.name or "unknown"
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
        -- Fallback: use current directory if no Cargo.toml found
        local dir = vim.fs.dirname(fname)
        return dir ~= "" and dir or vim.fn.getcwd()
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
    vim.notify("rust-analyzer configured: " .. rust_analyzer_path, vim.log.levels.INFO)
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
        -- Fallback: use current directory
        local dir = vim.fs.dirname(fname)
        return dir ~= "" and dir or vim.fn.getcwd()
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

-- Configure diagnostics globally (not per-buffer in on_attach)
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- this is for diagnositcs signs on the line number column
-- use this to beautify the plain E W signs to more fun ones
-- !important nerdfonts needs to be setup for this to work in your terminal
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " } 
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end

-- Ensure LSPs start when files are opened
-- vim.lsp.config() registers the config, but we need to ensure they start
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'rust', 'cpp', 'c', 'cxx', 'cc', 'h', 'hpp' },
  callback = function(args)
    local bufnr = args.buf
    local filetype = vim.bo[bufnr].filetype
    local filename = vim.api.nvim_buf_get_name(bufnr)
    
    -- Skip if file doesn't exist (e.g., new file)
    if filename == "" or not vim.fn.filereadable(filename) then
      return
    end
    
    -- Check if LSP is already attached
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    if #clients > 0 then
      return -- Already attached
    end
    
    -- Start appropriate LSP
    if filetype == 'rust' and is_mobile() then
      local rust_path = '/data/data/com.termux/files/usr/bin/rust-analyzer'
      if vim.fn.executable(rust_path) == 1 then
        local root_dir = vim.fs.dirname(filename)
        if root_dir == "" then
          root_dir = vim.fn.getcwd()
        end
        vim.lsp.start({
          name = 'rust_analyzer',
          cmd = { rust_path },
          root_dir = root_dir,
          capabilities = capabilities,
          on_attach = on_attach,
          settings = {
            ['rust-analyzer'] = {
              cargo = { allFeatures = true },
              checkOnSave = { command = "clippy" },
            },
          },
        })
      end
    elseif (filetype == 'cpp' or filetype == 'c' or filetype == 'cxx' or filetype == 'cc' or filetype == 'h' or filetype == 'hpp') and is_mobile() then
      local clangd_path = '/data/data/com.termux/files/usr/bin/clangd'
      if vim.fn.executable(clangd_path) == 1 then
        local root_dir = vim.fs.dirname(filename)
        if root_dir == "" then
          root_dir = vim.fn.getcwd()
        end
        vim.lsp.start({
          name = 'clangd',
          cmd = { clangd_path, '--background-index' },
          root_dir = root_dir,
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end
    end
  end,
})
