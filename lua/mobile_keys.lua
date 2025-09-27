-- ===========================================
-- 📱 MOBILE TERMUX KEYBINDINGS 📱
-- ===========================================

-- Mobile-friendly keybinding helper functions
local function map(mode, shortcut, command, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, shortcut, command, options)
end

local function nmap(shortcut, command, opts)
  map('n', shortcut, command, opts)
end

local function imap(shortcut, command, opts)
  map('i', shortcut, command, opts)
end

local function vmap(shortcut, command, opts)
  map('v', shortcut, command, opts)
end

local function cmap(shortcut, command, opts)
  map('c', shortcut, command, opts)
end

-- Mobile leader key (space is easiest on mobile keyboards)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- ===========================================
-- MOBILE ESCAPE ALTERNATIVES
-- ===========================================
-- These are crucial for mobile keyboards where Esc is hard to reach
imap('jj', '<Esc>')
imap('jk', '<Esc>')
imap('kj', '<Esc>')
imap('kk', '<Esc>')

-- ===========================================
-- MOBILE NAVIGATION
-- ===========================================

-- Window navigation (simplified for mobile)
nmap('<leader>h', '<C-w>h', { desc = 'Move to left window' })
nmap('<leader>j', '<C-w>j', { desc = 'Move to bottom window' })
nmap('<leader>k', '<C-w>k', { desc = 'Move to top window' })
nmap('<leader>l', '<C-w>l', { desc = 'Move to right window' })

-- Quick window splits
nmap('<leader>v', ':vsplit<CR>', { desc = 'Vertical split' })
nmap('<leader>s', ':split<CR>', { desc = 'Horizontal split' })

-- ===========================================
-- MOBILE FILE OPERATIONS
-- ===========================================

-- File operations (most common on mobile)
nmap('<leader>f', ':Telescope find_files<CR>', { desc = 'Find files' })
nmap('<leader>b', ':Telescope buffers<CR>', { desc = 'Show buffers' })
nmap('<leader>g', ':Telescope live_grep<CR>', { desc = 'Live grep' })
nmap('<leader>h', ':Telescope help_tags<CR>', { desc = 'Help tags' })

-- Save and quit operations - VSCode style from map.lua
nmap('<C-s>', ':w<CR>', { desc = 'Save' })
nmap('<C-n>', ':enew<CR>', { desc = 'New File' })
nmap('<C-o>', ':Telescope find_files<CR>', { desc = 'Open File...' })
nmap('<C-w>', ':q<CR>', { desc = 'Close editor' })
nmap('<C-F4>', ':q<CR>', { desc = 'Close' })
nmap('<C-k><C-w>', ':qa<CR>', { desc = 'Close All' })
nmap('<C-S-T>', ':e#<CR>', { desc = 'Reopen closed editor' })
nmap('<leader>w', ':w<CR>', { desc = 'Save file' })
nmap('<leader>q', ':q<CR>', { desc = 'Quit' })
nmap('<leader>W', ':wq<CR>', { desc = 'Save and quit' })
nmap('<leader>Q', ':q!<CR>', { desc = 'Force quit' })

-- New file
nmap('<leader>n', ':enew<CR>', { desc = 'New file' })

-- ===========================================
-- MOBILE TREE NAVIGATION
-- ===========================================

-- File tree operations (using former mappings from map.lua)
nmap('n', ':NvimTreeToggle<CR>', { desc = 'Toggle file tree' })
nmap('<C-b>', ':NvimTreeToggle<CR>', { desc = 'Toggle Sidebar visibility' })
nmap('<C-S-e>', ':NvimTreeFocus<CR>', { desc = 'Show Explorer / Toggle focus' })
nmap('<leader>e', ':NvimTreeFocus<CR>', { desc = 'Focus file tree' })
nmap('<leader>r', ':NvimTreeRefresh<CR>', { desc = 'Refresh file tree' })

-- ===========================================
-- MOBILE BUFFER NAVIGATION
-- ===========================================

-- Buffer operations
nmap('<leader>n', ':bnext<CR>', { desc = 'Next buffer' })
nmap('<leader>p', ':bprev<CR>', { desc = 'Previous buffer' })
nmap('<leader>d', ':bdelete<CR>', { desc = 'Delete buffer' })
nmap('<leader>D', ':bdelete!<CR>', { desc = 'Force delete buffer' })

-- ===========================================
-- MOBILE SEARCH AND REPLACE
-- ===========================================

-- Search operations
nmap('<leader>/', ':nohlsearch<CR>', { desc = 'Clear search highlight' })
nmap('<leader>r', ':%s/', { desc = 'Replace in file' })

-- Find next/previous
nmap('<leader>j', 'n', { desc = 'Next search result' })
nmap('<leader>k', 'N', { desc = 'Previous search result' })

-- ===========================================
-- MOBILE LSP SHORTCUTS
-- ===========================================

-- LSP operations (simplified for mobile)
nmap('<leader>c', ':lua vim.lsp.buf.code_action()<CR>', { desc = 'Code action' })
nmap('<leader>d', ':lua vim.lsp.buf.definition()<CR>', { desc = 'Go to definition' })
nmap('<leader>i', ':lua vim.lsp.buf.hover()<CR>', { desc = 'Show hover info' })
nmap('<leader>r', ':lua vim.lsp.buf.rename()<CR>', { desc = 'Rename symbol' })
nmap('<leader>R', ':lua vim.lsp.buf.references()<CR>', { desc = 'Show references' })
nmap('<leader>f', ':lua vim.lsp.buf.formatting()<CR>', { desc = 'Format code' })

-- Mobile symbol navigation (treesitter/LSP symbols) - VSCode style from map.lua
nmap('<C-t>', ':Telescope lsp_workspace_symbols<CR>', { desc = 'Show all Symbols' })
nmap('<C-g>', ':Telescope lsp_document_symbols<CR>', { desc = 'Go to Symbol...' })
nmap('<C-S-o>', ':Telescope lsp_dynamic_workspace_symbols<CR>', { desc = 'Go to Symbol...' })
nmap('<leader>o', ':Telescope lsp_document_symbols<CR>', { desc = 'Document symbols' })
nmap('<leader>O', ':Telescope lsp_workspace_symbols<CR>', { desc = 'Workspace symbols' })
nmap('<leader>S', ':Telescope lsp_dynamic_workspace_symbols<CR>', { desc = 'Dynamic workspace symbols' })

-- ===========================================
-- MOBILE COPY/PASTE
-- ===========================================

-- Clipboard operations
nmap('<leader>y', '"+y', { desc = 'Copy to clipboard' })
vmap('<leader>y', '"+y', { desc = 'Copy to clipboard' })
nmap('<leader>p', '"+p', { desc = 'Paste from clipboard' })
vmap('<leader>p', '"+p', { desc = 'Paste from clipboard' })

-- Select all
nmap('<leader>a', 'ggVG', { desc = 'Select all' })

-- ===========================================
-- MOBILE UNDO/REDO
-- ===========================================

-- Undo/Redo operations
nmap('<leader>u', 'u', { desc = 'Undo' })
nmap('<leader>U', '<C-r>', { desc = 'Redo' })

-- ===========================================
-- MOBILE COMMENTING
-- ===========================================

-- Comment operations
nmap('<leader>/', ':CommentToggle<CR>', { desc = 'Toggle comment' })
vmap('<leader>/', ':CommentToggle<CR>', { desc = 'Toggle comment' })

-- ===========================================
-- MOBILE TERMINAL
-- ===========================================

-- Terminal operations
nmap('<leader>v', ':vsplit<CR>:terminal<CR>', { desc = 'Vertical terminal' })
nmap('<leader>s', ':split<CR>:terminal<CR>', { desc = 'Horizontal terminal' })

-- ===========================================
-- MOBILE HELP
-- ===========================================

-- Help operations
nmap('<leader>?', ':MobileHelp<CR>', { desc = 'Show mobile help' })
nmap('<leader>H', ':help<CR>', { desc = 'Open help' })

-- ===========================================
-- MOBILE DEBUGGING
-- ===========================================

-- Debug operations - VSCode style from map.lua
nmap('<F5>', ':lua require"dap".continue()<CR>', { desc = 'Start/Continue' })
nmap('<S-F5>', ':lua require"dap".terminate()<CR>', { desc = 'Stop' })
nmap('<F9>', ':lua require"dap".toggle_breakpoint()<CR>', { desc = 'Toggle breakpoint' })
nmap('<F10>', ':lua require"dap".step_over()<CR>', { desc = 'Step over' })
nmap('<F11>', ':lua require"dap".step_into()<CR>', { desc = 'Step into' })
nmap('<S-F11>', ':lua require"dap".step_out()<CR>', { desc = 'Step out' })
nmap('<F6>', ':lua require"dap".repl.open()<CR>', { desc = 'Open REPL' })
nmap('dl', ':lua require"dap".run_last()<CR>', { desc = 'Run last configuration' })
nmap('<leader>db', ':lua require"dap".toggle_breakpoint()<CR>', { desc = 'Toggle breakpoint' })
nmap('<leader>dc', ':lua require"dap".continue()<CR>', { desc = 'Continue debug' })
nmap('<leader>ds', ':lua require"dap".step_over()<CR>', { desc = 'Step over' })
nmap('<leader>di', ':lua require"dap".step_into()<CR>', { desc = 'Step into' })
nmap('<leader>do', ':lua require"dap".step_out()<CR>', { desc = 'Step out' })

-- ===========================================
-- MOBILE GIT OPERATIONS
-- ===========================================

-- Git operations
nmap('<leader>gs', ':Git status<CR>', { desc = 'Git status' })
nmap('<leader>ga', ':Git add<CR>', { desc = 'Git add' })
nmap('<leader>gc', ':Git commit<CR>', { desc = 'Git commit' })
nmap('<leader>gp', ':Git push<CR>', { desc = 'Git push' })
nmap('<leader>gl', ':Git log<CR>', { desc = 'Git log' })

-- ===========================================
-- MOBILE TELESCOPE SHORTCUTS
-- ===========================================

-- Telescope operations - VSCode style from map.lua
nmap('<C-p>', ':Telescope find_files<CR>', { desc = 'Go to File...' })
nmap('<C-f>', ':Telescope live_grep<CR>', { desc = 'Find' })
nmap('<C-h>', ':Telescope grep_string<CR>', { desc = 'Replace' })
nmap('<C-S-f>', ':Telescope live_grep<CR>', { desc = 'Show Search' })
nmap('<C-S-h>', ':Telescope grep_string<CR>', { desc = 'Replace in files' })
nmap('<leader>ff', ':Telescope find_files<CR>', { desc = 'Find files' })
nmap('<leader>fg', ':Telescope live_grep<CR>', { desc = 'Live grep' })
nmap('<leader>fb', ':Telescope buffers<CR>', { desc = 'Show buffers' })
nmap('<leader>fh', ':Telescope help_tags<CR>', { desc = 'Help tags' })
nmap('<leader>fr', ':Telescope oldfiles<CR>', { desc = 'Recent files' })

-- ===========================================
-- MOBILE TROUBLE/DIAGNOSTICS
-- ===========================================

-- Diagnostics
nmap('<leader>xx', ':TroubleToggle<CR>', { desc = 'Toggle trouble' })
nmap('<leader>xw', ':TroubleToggle workspace_diagnostics<CR>', { desc = 'Workspace diagnostics' })
nmap('<leader>xd', ':TroubleToggle document_diagnostics<CR>', { desc = 'Document diagnostics' })
nmap('<leader>xl', ':TroubleToggle loclist<CR>', { desc = 'Location list' })
nmap('<leader>xq', ':TroubleToggle quickfix<CR>', { desc = 'Quickfix list' })

-- ===========================================
-- MOBILE WHICH-KEY INTEGRATION
-- ===========================================

-- Configure which-key for mobile
if pcall(require, 'which-key') then
  require('which-key').setup({
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = true,
        g = true,
      },
    },
    operators = { gc = "Comments" },
    key_labels = {
      ["<space>"] = "SPC",
      ["<cr>"] = "RET",
      ["<tab>"] = "TAB",
    },
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
    },
    popup_mappings = {
      scroll_down = '<c-d>',
      scroll_up = '<c-u>',
    },
    window = {
      border = "rounded",
      position = "bottom",
      margin = { 1, 0, 1, 0 },
      padding = { 2, 2, 2, 2 },
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "left",
    },
    ignore_missing = true,
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
    show_help = true,
    triggers = "auto",
    triggers_blacklist = {
      i = { "j", "k" },
      v = { "j", "k" },
    },
  })
end

-- ===========================================
-- MOBILE AUTOCOMMANDS
-- ===========================================

-- Mobile-specific autocmds
vim.api.nvim_create_autocmd('VimEnter', {
  pattern = '*',
  callback = function()
    print('📱 Mobile keybindings loaded! Use <leader>? for help')
  end,
})

-- Mobile help function
function MobileKeyHelp()
  print("==========================================")
  print("📱 MOBILE NEOVIM KEYBINDINGS 📱")
  print("==========================================")
  print("Escape alternatives: jj, jk, kj, kk")
  print("")
  print("File Operations:")
  print("  <leader>f  - Find files")
  print("  <leader>b  - Show buffers")
  print("  <leader>g  - Live grep")
  print("  <leader>w  - Save file")
  print("  <leader>q  - Quit")
  print("  <leader>W  - Save and quit")
  print("")
  print("Navigation:")
  print("  n          - Toggle file tree (VSCode style)")
  print("  <C-b>      - Toggle Sidebar visibility")
  print("  <C-S-e>    - Show Explorer / Toggle focus")
  print("  <leader>e  - Focus file tree")
  print("  <leader>n  - Next buffer")
  print("  <leader>p  - Previous buffer")
  print("")
    print("LSP:")
    print("  <leader>c  - Code action")
    print("  <leader>d  - Go to definition")
    print("  <leader>i  - Show hover info")
    print("  <leader>r  - Rename symbol")
    print("  <C-t>      - Show all Symbols (VSCode)")
    print("  <C-g>      - Go to Symbol... (VSCode)")
    print("  <C-S-o>    - Go to Symbol... (VSCode)")
    print("  <leader>o  - Document symbols")
    print("  <leader>O  - Workspace symbols")
    print("  <leader>S  - Dynamic workspace symbols")
  print("")
  print("Copy/Paste:")
  print("  <leader>y  - Copy to clipboard")
  print("  <leader>p  - Paste from clipboard")
  print("  <leader>a  - Select all")
  print("")
  print("Git:")
  print("  <leader>gs - Git status")
  print("  <leader>ga - Git add")
  print("  <leader>gc - Git commit")
  print("  <leader>gp - Git push")
  print("")
  print("Help:")
  print("  <leader>?  - Show this help")
  print("  <leader>H  - Open help")
  print("==========================================")
end

-- Add mobile help command
vim.api.nvim_create_user_command('MobileKeyHelp', MobileKeyHelp, {})

print("📱 Mobile keybindings configured successfully!")
