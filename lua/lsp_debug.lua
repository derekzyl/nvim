-- LSP Debugging and Diagnostics
-- Use :LspDebug to check LSP status
-- Also provides :LspInfo as an alias if lspconfig command is not available

-- Check LSP status (alternative to :LspInfo)
vim.api.nvim_create_user_command('LspInfo', function()
  local clients = vim.lsp.get_active_clients()
  local bufnr = vim.api.nvim_get_current_buf()
  local attached_clients = vim.lsp.get_clients({ bufnr = bufnr })
  
  print("=== LSP Information ===")
  print("Active LSP clients: " .. #clients)
  print("")
  
  if #clients > 0 then
    for _, client in ipairs(clients) do
      print("✓ " .. client.name .. " (ID: " .. client.id .. ")")
    end
  else
    print("No active LSP clients")
  end
  
  print("")
  print("Current buffer:")
  print("  - Filetype: " .. vim.bo.filetype)
  print("  - Attached clients: " .. #attached_clients)
  if #attached_clients > 0 then
    for _, client in ipairs(attached_clients) do
      print("    ✓ " .. client.name)
    end
  end
end, { desc = 'Show LSP information' })

-- Detailed LSP debugging
vim.api.nvim_create_user_command('LspDebug', function()
  local clients = vim.lsp.get_active_clients()
  
  print("=== LSP Debug Information ===")
  print("Active LSP clients: " .. #clients)
  print("")
  
  if #clients == 0 then
    print("❌ No LSP clients are currently active!")
    print("")
    print("Troubleshooting steps:")
    print("1. Check if LSP servers are installed:")
    print("   - Rust: pkg install rust rust-analyzer")
    print("   - C++: pkg install clang cmake")
    print("")
    print("2. Check if binaries exist:")
    print("   - rust-analyzer: " .. (vim.fn.executable('rust-analyzer') == 1 and "✓ Found" or "✗ Not found"))
    print("   - clangd: " .. (vim.fn.executable('clangd') == 1 and "✓ Found" or "✗ Not found"))
    print("")
    print("3. Open a file with the correct filetype:")
    print("   - Rust: :e test.rs")
    print("   - C++: :e test.cpp")
    print("")
    print("4. Check LSP status:")
    print("   :LspInfo")
  else
    for _, client in ipairs(clients) do
      print("✓ " .. client.name)
      print("  - ID: " .. client.id)
      print("  - Root: " .. (client.config.root_dir or "N/A"))
      print("  - CMD: " .. vim.inspect(client.config.cmd or {}))
      print("")
    end
  end
  
  -- Check current buffer
  local bufnr = vim.api.nvim_get_current_buf()
  local attached_clients = vim.lsp.get_clients({ bufnr = bufnr })
  local filetype = vim.bo.filetype
  
  print("Current buffer:")
  print("  - Filetype: " .. (filetype ~= "" and filetype or "none"))
  print("  - Attached clients: " .. #attached_clients)
  
  if #attached_clients > 0 then
    for _, client in ipairs(attached_clients) do
      print("    ✓ " .. client.name)
    end
  else
    print("    ❌ No LSP client attached to this buffer")
    if filetype == "rust" then
      print("    → Try: :e Cargo.toml (create a Rust project)")
    elseif filetype == "cpp" or filetype == "c" then
      print("    → Try: Create a compile_commands.json or .git directory")
    end
  end
end, { desc = 'Debug LSP configuration and status' })

