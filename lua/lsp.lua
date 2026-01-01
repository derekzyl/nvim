-- Check if running on mobile (Termux)
local function is_mobile()
  local term = os.getenv("TERMUX_VERSION")
  return term ~= nil
end

require("mason").setup()

-- Language servers that work on mobile
local mobile_servers = {
  'pyright',
  'ts_ls',
  'eslint',
  'html',
  'gopls',
  'cssls',
  'jsonls',
  'yamlls',
}

-- Language servers that don't work via Mason on mobile
-- Note: rust_analyzer and clangd are configured manually in pyrights.lua
-- to use native Termux packages instead of Mason binaries
local desktop_servers = {
  'rust_analyzer',  -- Handled manually on mobile via native Termux package
  'clangd',         -- Handled manually on mobile via native Termux package
}

-- Combine servers based on platform
local ensure_installed = mobile_servers
if not is_mobile() then
  -- Add desktop-only servers if not on mobile (Mason can install them on desktop)
  for _, server in ipairs(desktop_servers) do
    table.insert(ensure_installed, server)
  end
end

require("mason-lspconfig").setup({
  -- Automatically install language servers (excluding mobile-incompatible ones)
  -- Note: rust_analyzer and clangd are NOT installed via Mason on mobile.
  -- They are configured manually in pyrights.lua to use native Termux packages.
  ensure_installed = ensure_installed,
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
