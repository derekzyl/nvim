-- Test LSP startup manually
-- Run :TestLspStart to manually start LSPs for current file

vim.api.nvim_create_user_command('TestLspStart', function()
  local bufnr = vim.api.nvim_get_current_buf()
  local filetype = vim.bo.filetype
  local filename = vim.api.nvim_buf_get_name(bufnr)
  
  print("=== Testing LSP Startup ===")
  print("File: " .. filename)
  print("Filetype: " .. (filetype ~= "" and filetype or "none"))
  print("")
  
  if filetype == "rust" then
    print("Attempting to start rust_analyzer...")
    -- Try to start rust_analyzer manually
    local rust_path = '/data/data/com.termux/files/usr/bin/rust-analyzer'
    if vim.fn.executable(rust_path) == 1 then
      vim.lsp.start({
        name = 'rust_analyzer',
        cmd = { rust_path },
        root_dir = vim.fs.dirname(filename),
      })
      print("✓ rust_analyzer start command sent")
    else
      print("✗ rust_analyzer not found at: " .. rust_path)
    end
  elseif filetype == "cpp" or filetype == "c" then
    print("Attempting to start clangd...")
    local clangd_path = '/data/data/com.termux/files/usr/bin/clangd'
    if vim.fn.executable(clangd_path) == 1 then
      vim.lsp.start({
        name = 'clangd',
        cmd = { clangd_path, '--background-index' },
        root_dir = vim.fs.dirname(filename),
      })
      print("✓ clangd start command sent")
    else
      print("✗ clangd not found at: " .. clangd_path)
    end
  else
    print("Filetype '" .. filetype .. "' - no LSP configured for this type")
    print("Supported: rust, cpp, c")
  end
  
  -- Wait a moment and check
  vim.defer_fn(function()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    print("")
    print("Active clients after start: " .. #clients)
    for _, client in ipairs(clients) do
      print("  ✓ " .. client.name)
    end
  end, 1000)
end, { desc = 'Manually test LSP startup for current file' })

