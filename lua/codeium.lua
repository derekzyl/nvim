-- Codeium configuration
local M = {}

function M.setup()
  require("codeium").setup({
    -- Enable Codeium
    enable = true,
    
    -- Key mappings
    keymaps = {
      -- Accept suggestion
      accept = "<C-y>",
      -- Next suggestion
      next = "<C-]>",
      -- Previous suggestion
      prev = "<C-[>",
      -- Clear suggestion
      clear = "<C-x>",
    },
    
    -- Language server settings
    language_server = {
      -- Enable language server
      enable = true,
      -- Server name
      name = "codeium",
      -- Server command
      cmd = { "codeium", "lsp" },
    },
    
    -- UI settings
    ui = {
      -- Enable popup
      popup = true,
      -- Popup position
      position = "bottom",
      -- Popup size
      size = { width = 80, height = 20 },
    },
    
    -- File types to enable Codeium for
    filetypes = {
      "python",
      "javascript",
      "typescript",
      "lua",
      "rust",
      "go",
      "cpp",
      "c",
      "java",
      "html",
      "css",
      "json",
      "yaml",
      "markdown",
    },
  })
end

return M
