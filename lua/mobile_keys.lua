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

-- Mobile leader key (space for normal/visual, comma for insert)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Space as leader in normal and visual modes
vim.keymap.set('n', '<Space>', '<Nop>', { silent = true })
vim.keymap.set('v', '<Space>', '<Nop>', { silent = true })

-- Comma as leader in insert mode (to avoid space conflicts)
vim.keymap.set('i', ',', '<Nop>', { silent = true })

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

-- Hover diagnostics on cursor
nmap('<leader>e', ':lua vim.diagnostic.open_float()<CR>', { desc = 'Show diagnostic' })

-- Codeium toggle (works in all modes)
nmap('<leader>ai', ':CodeiumToggle<CR>', { desc = 'Toggle AI (Codeium)' })
imap(',ai', '<Esc>:CodeiumToggle<CR>a', { desc = 'Toggle AI (Codeium)' })
vmap('<leader>ai', '<Esc>:CodeiumToggle<CR>gv', { desc = 'Toggle AI (Codeium)' })

-- ===========================================
-- MOBILE INSERT MODE CTRL SHORTCUTS
-- ===========================================

-- File operations in insert mode
imap('<C-s>', '<Esc>:w<CR>a', { desc = 'Save file' })
imap('<C-n>', '<Esc>:enew<CR>a', { desc = 'New file' })
imap('<C-o>', '<Esc>:Telescope find_files<CR>', { desc = 'Open file' })

-- Navigation in insert mode
imap('<C-f>', '<Esc>:Telescope live_grep<CR>', { desc = 'Find text' })
imap('<C-b>', '<Esc>:NvimTreeToggle<CR>a', { desc = 'Toggle file tree' })

-- LSP functions in insert mode
imap('<C-d>', '<Esc>:lua vim.lsp.buf.definition()<CR>a', { desc = 'Go to definition' })
imap('<C-r>', '<Esc>:lua vim.lsp.buf.rename()<CR>a', { desc = 'Rename symbol' })
imap('<C-e>', '<Esc>:lua vim.diagnostic.open_float()<CR>a', { desc = 'Show diagnostic' })

-- Symbols in insert mode
imap('<C-t>', '<Esc>:Telescope lsp_workspace_symbols<CR>', { desc = 'Show all symbols' })
imap('<C-g>', '<Esc>:Telescope lsp_document_symbols<CR>', { desc = 'Document symbols' })

-- AI toggle in insert mode (using Alt instead of Ctrl to avoid conflict with select all)
imap('<A-a>', '<Esc>:CodeiumToggle<CR>a', { desc = 'Toggle AI (Codeium)' })

-- ===========================================
-- ADDITIONAL VSCode STYLE SHORTCUTS
-- ===========================================

-- VSCode-style line operations
nmap('<C-A-Up>', 'Yp', { desc = 'Duplicate line up' })
nmap('<C-A-Down>', 'YP', { desc = 'Duplicate line down' })
nmap('<A-Up>', ':m .-2<CR>==', { desc = 'Move line up' })
nmap('<A-Down>', ':m .+1<CR>==', { desc = 'Move line down' })
nmap('<S-A-Up>', ':t .-1<CR>', { desc = 'Copy line up' })
nmap('<S-A-Down>', ':t .<CR>', { desc = 'Copy line down' })

-- VSCode-style line editing
nmap('<C-S-k>', 'dd', { desc = 'Delete line' })
nmap('<C-CR>', 'o<ESC>', { desc = 'Insert line below' })
nmap('<C-S-CR>', 'O<ESC>', { desc = 'Insert line above' })

-- VSCode-style navigation
nmap('<C-S-\\>', '%', { desc = 'Jump to matching bracket' })
nmap('<C-]>', '>>', { desc = 'Indent line' })
nmap('<C-[>', '<<', { desc = 'Outdent line' })
nmap('<Home>', '^', { desc = 'Go to beginning of line' })
nmap('<End>', '$', { desc = 'Go to end of line' })
nmap('<C-Home>', 'gg', { desc = 'Go to beginning of file' })
nmap('<C-End>', 'G', { desc = 'Go to end of file' })

-- VSCode-style scrolling
nmap('<C-Up>', '<C-y>', { desc = 'Scroll line up' })
nmap('<C-Down>', '<C-e>', { desc = 'Scroll line down' })
nmap('<A-PgUp>', '<C-u>', { desc = 'Scroll page up' })
nmap('<A-PgDn>', '<C-d>', { desc = 'Scroll page down' })

-- VSCode-style folding
nmap('<C-S-[>', 'zc', { desc = 'Fold region' })
nmap('<C-S-]>', 'zo', { desc = 'Unfold region' })
nmap('<C-k><C-[>', 'zM', { desc = 'Fold all subregions' })
nmap('<C-k><C-]>', 'zR', { desc = 'Unfold all subregions' })

-- VSCode-style LSP operations
nmap('<F12>', ':lua vim.lsp.buf.definition()<CR>', { desc = 'Go to Definition' })
nmap('<A-F12>', ':lua vim.lsp.buf.hover()<CR>', { desc = 'Peek Definition' })
nmap('<C-k><F12>', ':vsplit<CR>:lua vim.lsp.buf.definition()<CR>', { desc = 'Open Definition to the side' })
nmap('<C-.>', ':lua vim.lsp.buf.code_action()<CR>', { desc = 'Quick Fix' })
nmap('<S-F12>', ':lua vim.lsp.buf.references()<CR>', { desc = 'Show References' })
nmap('<F2>', ':lua vim.lsp.buf.rename()<CR>', { desc = 'Rename Symbol' })

-- VSCode-style completion
nmap('<C-Space>', ':lua vim.lsp.buf.completion()<CR>', { desc = 'Trigger suggestion' })
nmap('<C-i>', ':lua vim.lsp.buf.completion()<CR>', { desc = 'Trigger suggestion' })
nmap('<C-S-Space>', ':lua vim.lsp.buf.signature_help()<CR>', { desc = 'Trigger parameter hints' })

-- VSCode-style formatting
nmap('<S-A-f>', ':lua vim.lsp.buf.formatting()<CR>', { desc = 'Format document' })
nmap('<C-k><C-f>', ':lua vim.lsp.buf.range_formatting()<CR>', { desc = 'Format selection' })

-- VSCode-style find operations
nmap('<F3>', 'n', { desc = 'Find next' })
nmap('<S-F3>', 'N', { desc = 'Find previous' })

-- VSCode-style selection
nmap('<C-l>', 'V', { desc = 'Select current line' })

-- Mobile symbol navigation (treesitter/LSP symbols) - VSCode style from map.lua
nmap('<C-t>', ':Telescope lsp_workspace_symbols<CR>', { desc = 'Show all Symbols' })
nmap('<C-g>', ':Telescope lsp_document_symbols<CR>', { desc = 'Go to Symbol...' })
nmap('<C-S-o>', ':Telescope lsp_dynamic_workspace_symbols<CR>', { desc = 'Go to Symbol...' })
nmap('<leader>o', ':Telescope lsp_document_symbols<CR>', { desc = 'Document symbols' })
nmap('<leader>O', ':Telescope lsp_workspace_symbols<CR>', { desc = 'Workspace symbols' })
nmap('<leader>S', ':Telescope lsp_dynamic_workspace_symbols<CR>', { desc = 'Dynamic workspace symbols' })

-- ===========================================
-- MOBILE COPY/PASTE - VSCode Style
-- ===========================================

-- VSCode-style clipboard operations
nmap('<C-c>', '"+y', { desc = 'Copy to clipboard' })
vmap('<C-c>', '"+y', { desc = 'Copy to clipboard' })
nmap('<C-v>', '"+p', { desc = 'Paste from clipboard' })
vmap('<C-v>', '"+p', { desc = 'Paste from clipboard' })
nmap('<C-x>', '"+d', { desc = 'Cut to clipboard' })
vmap('<C-x>', '"+d', { desc = 'Cut to clipboard' })

-- VSCode-style select all
nmap('<C-a>', 'ggVG', { desc = 'Select all' })
vmap('<C-a>', 'ggVG', { desc = 'Select all' })
imap('<C-a>', '<Esc>ggVG', { desc = 'Select all' })

-- Legacy clipboard operations (still available)
nmap('<leader>y', '"+y', { desc = 'Copy to clipboard' })
vmap('<leader>y', '"+y', { desc = 'Copy to clipboard' })
nmap('<leader>p', '"+p', { desc = 'Paste from clipboard' })
vmap('<leader>p', '"+p', { desc = 'Paste from clipboard' })
nmap('<leader>a', 'ggVG', { desc = 'Select all' })

-- ===========================================
-- MOBILE UNDO/REDO - VSCode Style
-- ===========================================

-- VSCode-style undo/redo
nmap('<C-z>', 'u', { desc = 'Undo' })
imap('<C-z>', '<C-o>u', { desc = 'Undo' })
nmap('<C-y>', '<C-r>', { desc = 'Redo' })
imap('<C-y>', '<C-o><C-r>', { desc = 'Redo' })

-- Legacy undo/redo operations
nmap('<leader>u', 'u', { desc = 'Undo' })
nmap('<leader>U', '<C-r>', { desc = 'Redo' })

-- ===========================================
-- MOBILE COMMENTING - VSCode Style
-- ===========================================

-- VSCode-style commenting
nmap('<C-/>', ':CommentToggle<CR>', { desc = 'Toggle line comment' })
imap('<C-/>', '<Esc>:CommentToggle<CR>a', { desc = 'Toggle line comment' })
vmap('<C-/>', ':CommentToggle<CR>', { desc = 'Toggle line comment' })

-- Legacy comment operations
nmap('<leader>/', ':CommentToggle<CR>', { desc = 'Toggle comment' })
vmap('<leader>/', ':CommentToggle<CR>', { desc = 'Toggle comment' })

-- ===========================================
-- MOBILE TERMINAL - VSCode Style
-- ===========================================

-- VSCode-style terminal operations
nmap('<C-`>', ':ToggleTerm<CR>', { desc = 'Show integrated terminal' })
nmap('<C-S-`>', ':ToggleTerm<CR>', { desc = 'Create new terminal' })

-- Legacy terminal operations
nmap('<leader>v', ':vsplit<CR>:terminal<CR>', { desc = 'Vertical terminal' })
nmap('<leader>s', ':split<CR>:terminal<CR>', { desc = 'Horizontal terminal' })

-- ===========================================
-- MOBILE HELP
-- ===========================================

-- Help operations
nmap('<leader>?', ':MobileKeyHelp<CR>', { desc = 'Show mobile help' })
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
-- MOBILE TELESCOPE SHORTCUTS - VSCode Style
-- ===========================================

-- VSCode-style search operations
nmap('<C-p>', ':Telescope find_files<CR>', { desc = 'Go to File...' })
nmap('<C-f>', ':Telescope live_grep<CR>', { desc = 'Find' })
nmap('<C-h>', ':Telescope grep_string<CR>', { desc = 'Replace' })
nmap('<C-S-f>', ':Telescope live_grep<CR>', { desc = 'Show Search' })
nmap('<C-S-h>', ':Telescope grep_string<CR>', { desc = 'Replace in files' })

-- VSCode-style navigation
nmap('<C-Tab>', ':bnext<CR>', { desc = 'Open next' })
nmap('<C-S-Tab>', ':bprev<CR>', { desc = 'Open previous' })

-- VSCode-style editor management
nmap('<C-\\>', ':vsplit<CR>', { desc = 'Split editor' })

-- Legacy telescope operations
nmap('<leader>ff', ':Telescope find_files<CR>', { desc = 'Find files' })
nmap('<leader>fg', ':Telescope live_grep<CR>', { desc = 'Live grep' })
nmap('<leader>fb', ':Telescope buffers<CR>', { desc = 'Show buffers' })
nmap('<leader>fh', ':Telescope help_tags<CR>', { desc = 'Help tags' })
nmap('<leader>fr', ':Telescope oldfiles<CR>', { desc = 'Recent files' })

-- ===========================================
-- MOBILE TROUBLE/DIAGNOSTICS - VSCode Style
-- ===========================================

-- VSCode-style diagnostics
nmap('<C-S-m>', ':TroubleToggle<CR>', { desc = 'Show Problems panel' })
nmap('<F8>', ':lua vim.diagnostic.goto_next()<CR>', { desc = 'Go to next error or warning' })
nmap('<S-F8>', ':lua vim.diagnostic.goto_prev()<CR>', { desc = 'Go to previous error or warning' })

-- Legacy diagnostics
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
    -- Mobile keybindings loaded! Use <leader>? for help
  end,
})

-- Mobile help function
function MobileKeyHelp()
  print("==========================================")
  print("📱 MOBILE NEOVIM KEYBINDINGS 📱")
  print("==========================================")
  print("Escape alternatives: jj, jk, kj, kk")
  print("Leader: SPACE (Normal/Visual), COMMA (Insert)")
  print("")
  print("File Operations:")
  print("  SPACE f    - Find files")
  print("  SPACE b    - Show buffers")
  print("  SPACE g    - Live grep")
  print("  SPACE w    - Save file")
  print("  SPACE q    - Quit")
  print("  SPACE W    - Save and quit")
  print("  Ctrl+S     - Save (VSCode style)")
  print("  Ctrl+N     - New file (VSCode style)")
  print("  Ctrl+O     - Open file (VSCode style)")
  print("")
  print("Navigation:")
  print("  n          - Toggle file tree (VSCode style)")
  print("  Ctrl+B     - Toggle Sidebar visibility")
  print("  Ctrl+Shift+E - Show Explorer / Toggle focus")
  print("  SPACE e    - Focus file tree")
  print("  SPACE n    - Next buffer")
  print("  SPACE p    - Previous buffer")
  print("")
  print("LSP:")
  print("  SPACE c    - Code action")
  print("  SPACE d    - Go to definition")
  print("  SPACE i    - Show hover info")
  print("  SPACE e    - Show diagnostic")
  print("  SPACE r    - Rename symbol")
  print("  Ctrl+T     - Show all Symbols (VSCode)")
  print("  Ctrl+G     - Go to Symbol... (VSCode)")
  print("  Ctrl+Shift+O - Go to Symbol... (VSCode)")
  print("  SPACE o    - Document symbols")
  print("  SPACE O    - Workspace symbols")
  print("  SPACE S    - Dynamic workspace symbols")
  print("  SPACE ai   - Toggle AI (Codeium) (Normal/Visual)")
  print("  ,ai        - Toggle AI (Codeium) (Insert)")
  print("")
  print("Insert Mode Shortcuts:")
  print("  Ctrl+S     - Save file")
  print("  Ctrl+N     - New file")
  print("  Ctrl+O     - Open file")
  print("  Ctrl+F     - Find text")
  print("  Ctrl+B     - Toggle file tree")
  print("  Ctrl+D     - Go to definition")
  print("  Ctrl+R     - Rename symbol")
  print("  Ctrl+E     - Show diagnostic")
  print("  Ctrl+T     - Show all symbols")
  print("  Ctrl+G     - Document symbols")
  print("  Alt+A      - Toggle AI (Codeium)")
  print("")
  print("VSCode Style Copy/Paste:")
  print("  Ctrl+C     - Copy to clipboard")
  print("  Ctrl+V     - Paste from clipboard")
  print("  Ctrl+X     - Cut to clipboard")
  print("  Ctrl+A     - Select all")
  print("")
  print("VSCode Style Undo/Redo:")
  print("  Ctrl+Z     - Undo")
  print("  Ctrl+Y     - Redo")
  print("")
  print("VSCode Style Comments:")
  print("  Ctrl+/     - Toggle line comment")
  print("")
  print("VSCode Style Terminal:")
  print("  Ctrl+`     - Show integrated terminal")
  print("  Ctrl+Shift+` - Create new terminal")
  print("")
  print("VSCode Style Navigation:")
  print("  Ctrl+Tab   - Open next")
  print("  Ctrl+Shift+Tab - Open previous")
  print("  Ctrl+\\     - Split editor")
  print("  Home/End   - Go to beginning/end of line")
  print("  Ctrl+Home/End - Go to beginning/end of file")
  print("")
  print("VSCode Style Line Operations:")
  print("  Ctrl+Shift+K - Delete line")
  print("  Ctrl+Enter   - Insert line below")
  print("  Ctrl+Shift+Enter - Insert line above")
  print("  Alt+Up/Down  - Move line up/down")
  print("  Shift+Alt+Up/Down - Copy line up/down")
  print("")
  print("VSCode Style LSP:")
  print("  F12        - Go to Definition")
  print("  Alt+F12    - Peek Definition")
  print("  Ctrl+.     - Quick Fix")
  print("  Shift+F12  - Show References")
  print("  F2         - Rename Symbol")
  print("  F8/Shift+F8 - Next/Previous error")
  print("")
  print("VSCode Style Find:")
  print("  F3/Shift+F3 - Find next/previous")
  print("  Ctrl+F     - Find")
  print("  Ctrl+H     - Replace")
  print("")
  print("Legacy Copy/Paste:")
  print("  SPACE y    - Copy to clipboard")
  print("  SPACE p    - Paste from clipboard")
  print("  SPACE a    - Select all")
  print("")
  print("Git:")
  print("  SPACE gs   - Git status")
  print("  SPACE ga   - Git add")
  print("  SPACE gc   - Git commit")
  print("  SPACE gp   - Git push")
  print("")
  print("Help:")
  print("  SPACE ?    - Show this help")
  print("  SPACE H    - Open help")
  print("==========================================")
end

-- Add mobile help command
vim.api.nvim_create_user_command('MobileKeyHelp', MobileKeyHelp, {})

print("📱 Mobile keybindings configured successfully!")
