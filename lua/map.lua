vim.cmd('noremap <C-b> :noh<cr>:call clearmatches()<cr>') -- clear matches Ctrl+b

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

function cmap(shortcut, command)
  map('c', shortcut, command)
end

function tmap(shortcut, command)
  map('t', shortcut, command)
end

-- sane regexes
nmap('/', '/\\v')
vmap('/', '/\\v')

-- don't jump when using *
nmap('*', '*<c-o>')




--Map Ctrl+/ to toggle comments with Vim-Commentary
nmap( '/', 'gc')
imap( '<c-/>', 'gc')
-- keep search matches in the middle of the window
nmap('n', 'nzzzv')
nmap('N', 'Nzzzv')

-- Same when jumping around
nmap('g;', 'g;zz')
--nmap('g', 'g,zz') -- for some reason doesn't work well

-- Open a Quickfix window for the last search.
nmap("<leader>?", ":execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>")

-- Begining & End of line in Normal mode
nmap('H', '^')
nmap('L', 'g_')

-- more natural movement with wrap on
nmap('j', 'gj')
nmap('k', 'gk')
vmap('j', 'gj')
vmap('k', 'gk')

-- Easy buffer navigation
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')

-- Reselect visual block after indent/outdent
vmap('<', '<gv')
vmap('>', '>gv')


cmap('<C-a>', '<Home>')
cmap('<C-e>', '<End>')

-- Terminal
-- ESC to go to normal mode in terminal
tmap('<C-s>', '<C-\\><C-n>')
tmap('<Esc><Esc>', '<C-\\><C-n>')

-- Easy window split; C-w v -> vv, C-w - s -> ss
nmap('vv', '<C-w>v')
nmap('ss', '<C-w>s')
vim.o.splitbelow = true -- when splitting horizontally, move coursor to lower pane
vim.o.splitright = true -- when splitting vertically, mnove coursor to right pane

-- PLUGINS

-- Find files using Telescope command-line sugar.
nmap("<leader>ff", "<cmd>Telescope find_files<cr>")
nmap("<leader>fl", "<cmd>Telescope live_grep<cr>")
nmap("<leader>bb", "<cmd>Telescope buffers<cr>")
nmap("<leader>hh", "<cmd>Telescope help_tags<cr>")

-- LSP
nmap('K', '<cmd>Lspsaga hover_doc<cr>')
imap('<C-k>', '<cmd>Lspsaga hover_doc<cr>')
nmap('gh', '<cmd>Lspsaga lsp_finder<cr>')
nmap('<C-e>', '<cmd>Lspsaga show_line_diagnostics<CR>')

-- git
nmap('<C-g>', '<cmd>GitMessenger<cr>')

-- nvim- tree
nmap('n', [[:NvimTreeToggle<CR>]])
--imap('<C-d>', [[:NvimTreeToggle<CR>]])

-- debugger
-- nvim-dap keymappings
-- Press f5 to debug
nmap( '<F5>', [[:lua require'dap'.continue()<CR>]], {})
-- Press CTRL + b to toggle regular breakpoint
nmap( '<C-b>', [[:lua require'dap'.toggle_breakpoint()<CR>]], {})

-- nvim-dap keymappings
-- Press f5 to debug
nmap('<F5>', [[:lua require'dap'.continue()<CR>]], {})
-- Press CTRL + b to toggle regular breakpoint
nmap('<C-b>', [[:lua require'dap'.toggle_breakpoint()<CR>]], {})
-- Press CTRL + c to toggle Breakpoint with Condition
nmap( '<C-c>', [[:lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>]], {})
-- Press CTRL + l to toggle Logpoint
nmap( '<C-l>', [[:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log Point Msg: '))<CR>]], {})
-- Pressing F10 to step over
nmap( '<F10>', [[:lua require'dap'.step_over()<CR>]], {})
-- Pressing F11 to step into
nmap( '<F11>', [[:lua require'dap'.step_into()<CR>]], {})
-- Pressing F12 to step out
nmap( '<F12>', [[:lua require'dap'.step_out()<CR>]], {})
-- Press F6 to open REPL
nmap( '<F6>', [[:lua require'dap'.repl.open()<CR>]], {})
-- Press dl to run last ran configuration (if you used f5 before it will re run it etc)
nmap('dl', [[:lua require'dap'.run_last()<CR>]], {})

--neogen for doc generating
--
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>gd", ":lua require('neogen').generate()<CR>", opts)

-- Press Ctrl+d to toggle debug mode, will remove NvimTree also
nmap( '<C-d>', [[:NvimTreeClose<CR> :lua require'dapui'.toggle()<CR>]], {})





--new mppings
-- Mappings.
local opts = { noremap=true, silent=true }

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<space>K', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
end




-- Ctrl + Alt + Up to duplicate the current line
nmap('<C-A-Up>', 'Yp')

-- Ctrl + Alt + Down to duplicate the current line
nmap('<C-A-Down>', 'YP')
-- Select all text with Ctrl+A
nmap('<C-a>', 'ggVG')

-- Copy selected text with Ctrl+C
--vmap('<C-c>', '"+y')
--nmap('<C-c>', '"+yy')

-- Paste clipboard content with Ctrl+V
nmap('<C-v>', '"+p')
imap('<C-v>', '<C-r>+')

-- Cut selected text with Ctrl+X
vmap('<C-x>', '"+d')
nmap('<C-x>', '"+dd')

-- Undo with Ctrl+Z
nmap('<C-z>', 'u')
imap('<C-z>', '<C-o>u')

-- Redo with Ctrl+Y
nmap('<C-y>', '<C-r>')
imap('<C-y>', '<C-o><C-r>')


-- Key mappings
--vmap('<C-c>', '"+y')
--nmap('<C-c>', '"+yy')
--nmap('<C-v>', '"+p')
--nmap('/', 'gc')
imap('<C-/>', 'gc')

-- -- Ctrl+X Cut line (empty selection)
--nmap('<C-x>', '"+dd')

-- Ctrl+C Copy line (empty selection)
nmap('<C-c>', '"+yy')
vmap('<C-c>', '"+y')
-- Additional VSCode shortcuts
--nmap('<C-x>', 'dd')  -- Cut line
nmap('<C-c>', 'yy')  -- Copy line

-- Alt + ↑ / ↓ Move line up/down
nmap('<A-Up>', ':m .-2<CR>==')
nmap('<A-Down>', ':m .+1<CR>==')

-- Shift + Alt + ↑ / ↓ Copy line up/down
nmap('<S-A-Up>', ':t .-1<CR>')
nmap('<S-A-Down>', ':t .<CR>')

-- Ctrl + Shift + K Delete line
nmap('<C-S-k>', 'dd')

-- Ctrl + Enter Insert line below
nmap('<C-CR>', 'o<ESC>')

-- Ctrl + Shift + Enter Insert line above
nmap('<C-S-CR>', 'O<ESC>')

-- Ctrl + Shift + \ Jump to matching bracket
nmap('<C-S-\\>', '%')

-- Ctrl + ] / [ Indent/outdent line
nmap('<C-]>', '>>')
nmap('<C-[>', '<<')

-- Home / End Go to beginning/end of line
nmap('<Home>', '^')
nmap('<End>', '$')

-- Ctrl + Home Go to beginning of file
nmap('<C-Home>', 'gg')

-- Ctrl + End Go to end of file
nmap('<C-End>', 'G')

-- Ctrl + ↑ / ↓ Scroll line up/down
nmap('<C-Up>', '<C-y>')
nmap('<C-Down>', '<C-e>')

-- Alt + PgUp / PgDn Scroll page up/down
nmap('<A-PgUp>', '<C-u>')
nmap('<A-PgDn>', '<C-d>')

-- Ctrl + Shift + [ Fold (collapse) region
nmap('<C-S-[>', 'zc')

-- Ctrl + Shift + ] Unfold (uncollapse) region
nmap('<C-S-]>', 'zo')

-- Ctrl + K Ctrl + [ Fold (collapse) all subregions
nmap('<C-k><C-[>', 'zM')

-- Ctrl + K Ctrl + ] Unfold (uncollapse) all subregions
nmap('<C-k><C-]>', 'zR')

-- Ctrl + K Ctrl + 0 Fold (collapse) all regions
nmap('<C-k><C-0>', 'zM')

-- Ctrl + K Ctrl + J Unfold (uncollapse) all regions
nmap('<C-k><C-j>', 'zR')

-- Ctrl + K Ctrl + C Add line comment
nmap('<C-k><C-c>', ':Commentary<CR>')

-- Ctrl + K Ctrl + U Remove line comment
nmap('<C-k><C-u>', ':Commentary<CR>')

-- Ctrl + / Toggle line comment
nmap('<C-/>', ':Commentary<CR>')

-- Shift + Alt + A Toggle block comment
vmap('<S-A-a>', ':Commentary<CR>')

-- Alt + Z Toggle word wrap
nmap('<A-z>', ':set wrap!<CR>')

-- Ctrl + T Show all Symbols
nmap('<C-t>', ':Telescope lsp_workspace_symbols<CR>')

-- Ctrl + G Go to Line...
nmap('<C-g>', ':Telescope lsp_document_symbols<CR>')

-- Ctrl + P Go to File...
nmap('<C-p>', ':Telescope find_files<CR>')

-- Ctrl + Shift + O Go to Symbol...
nmap('<C-S-o>', ':Telescope lsp_dynamic_workspace_symbols<CR>')

-- Ctrl + Shift + M Show Problems panel
nmap('<C-S-m>', ':TroubleToggle<CR>')

-- F8 Go to next error or warning
nmap('<F8>', ':lua vim.diagnostic.goto_next()<CR>')

-- Shift + F8 Go to previous error or warning
nmap('<S-F8>', ':lua vim.diagnostic.goto_prev()<CR>')

-- Ctrl + Shift + Tab Navigate editor group history
nmap('<C-S-Tab>', ':bprev<CR>')

-- Ctrl + F Find
nmap('<C-f>', ':Telescope live_grep<CR>')

-- Ctrl + H Replace
nmap('<C-h>', ':Telescope grep_string<CR>')

-- F3 / Shift + F3 Find next/previous
nmap('<F3>', 'n')
nmap('<S-F3>', 'N')

-- Alt + Enter Select all occurrences of Find match
-- Custom implementation needed

-- Ctrl + D Add selection to next Find match
-- Custom implementation needed

-- Ctrl + K Ctrl + D Move last selection to next Find match
-- Custom implementation needed

-- Alt + C / R / W Toggle case-sensitive / regex / whole word
-- Custom implementation needed

-- Multi-cursor and selection
-- Alt + Click Insert cursor
-- Custom implementation needed

-- Ctrl + Alt + ↑ / ↓ Insert cursor above / below
-- Custom implementation needed

-- Ctrl + U Undo last cursor operation
nmap('<C-u>', 'u')

-- Shift + Alt + I Insert cursor at end of each line selected
-- Custom implementation needed

-- Ctrl + L Select current line
nmap('<C-l>', 'V')

-- Ctrl + Shift + L Select all occurrences of current selection
-- Custom implementation needed

-- Ctrl + F2 Select all occurrences of current word
-- Custom implementation needed

-- Shift + Alt + → Expand selection
-- Custom implementation needed

-- Shift + Alt + ← Shrink selection
-- Custom implementation needed

-- Shift + Alt + (drag mouse) Column (box) selection
-- Custom implementation needed

-- Ctrl + Shift + Alt + (arrow key) Column (box) selection
-- Custom implementation needed

-- Ctrl + Shift + Alt + PgUp/PgDn Column (box) selection page up/down
-- Custom implementation needed

-- Rich languages editing
-- Ctrl + Space, Ctrl + I Trigger suggestion
nmap('<C-Space>', ':lua vim.lsp.buf.completion()<CR>')
nmap('<C-i>', ':lua vim.lsp.buf.completion()<CR>')

-- Ctrl + Shift + Space Trigger parameter hints
nmap('<C-S-Space>', ':lua vim.lsp.buf.signature_help()<CR>')

-- Shift + Alt + F Format document
nmap('<S-A-f>', ':lua vim.lsp.buf.formatting()<CR>')

-- Ctrl + K Ctrl + F Format selection
nmap('<C-k><C-f>', ':lua vim.lsp.buf.range_formatting()<CR>')

-- F12 Go to Definition
nmap('<F12>', ':lua vim.lsp.buf.definition()<CR>')

-- Alt + F12 Peek Definition
nmap('<A-F12>', ':lua vim.lsp.buf.hover()<CR>')

-- Ctrl + K F12 Open Definition to the side
nmap('<C-k><F12>', ':vsplit<CR>:lua vim.lsp.buf.definition()<CR>')

-- Ctrl + . Quick Fix
nmap('<C-.>', ':lua vim.lsp.buf.code_action()<CR>')

-- Shift + F12 Show References
nmap('<S-F12>', ':lua vim.lsp.buf.references()<CR>')

-- F2 Rename Symbol
nmap('<F2>', ':lua vim.lsp.buf.rename()<CR>')

-- Ctrl + K Ctrl + X Trim trailing whitespace
nmap('<C-k><C-x>', ':lua vim.cmd(":%s/\\s\\+$//e")<CR>')

-- Ctrl + K M Change file language
-- Custom implementation needed

-- Editor management
-- Ctrl + F4, Ctrl + W Close editor
nmap('<C-F4>', ':q<CR>')
nmap('<C-w>', ':q<CR>')

-- Ctrl + K F Close folder
-- Custom implementation needed

-- Ctrl + \ Split editor
nmap('<C-\\>', ':vsplit<CR>')

-- Ctrl + 1 / 2 / 3 Focus into 1st, 2nd, or 3rd editor group
-- Custom implementation needed

-- Ctrl + K Ctrl + ←/→ Focus into previous/next editor group
-- Custom implementation needed

-- Ctrl + Shift + PgUp / PgDn Move editor left/right
-- Custom implementation needed

-- Ctrl + K ← / → Move active editor group
-- Custom implementation needed

-- Ctrl + N New File
nmap('<C-n>', ':enew<CR>')

-- Ctrl + O Open File...
nmap('<C-o>', ':Telescope find_files<CR>')

-- Ctrl + S Save
nmap('<C-s>', ':w<CR>')

-- Ctrl + Shift + S Save As...
-- Custom implementation needed

-- Ctrl + K S Save All
-- Custom implementation needed

-- Ctrl + F4 Close
--
--
--
--
--
--
--
-- Ctrl + K S Save All
nmap('<C-k><S>', ':wa<CR>')

-- Ctrl + F4 Close
nmap('<C-F4>', ':q<CR>')

-- Ctrl + K Ctrl + W Close All
nmap('<C-k><C-w>', ':qa<CR>')

-- Ctrl + Shift + T Reopen closed editor
nmap('<C-S-T>', ':e#<CR>')

-- Ctrl + K Enter Keep preview mode editor open
-- Custom implementation needed

-- Ctrl + Tab Open next
nmap('<C-Tab>', ':bnext<CR>')

-- Ctrl + Shift + Tab Open previous
nmap('<C-S-Tab>', ':bprev<CR>')

-- Ctrl + K P Copy path of active file
-- Custom implementation needed

-- Ctrl + K R Reveal active file in Explorer
-- Custom implementation needed

-- Ctrl + K O Show active file in new window/instance
-- Custom implementation needed

-- Display
-- F11 Toggle full screen
-- Custom implementation needed

-- Shift + Alt + 0 Toggle editor layout (horizontal/vertical)
-- Custom implementation needed

-- Ctrl + = / - Zoom in/out
-- Custom implementation needed

-- Ctrl + B Toggle Sidebar visibility
nmap('<C-b>', ':NvimTreeToggle<CR>')

-- Ctrl + Shift + E Show Explorer / Toggle focus
nmap('<C-S-e>', ':NvimTreeFocus<CR>')

-- Ctrl + Shift + F Show Search
nmap('<C-S-f>', ':Telescope live_grep<CR>')

-- Ctrl + Shift + G Show Source Control
nmap('<C-S-g>', ':LazyGit<CR>')

-- Ctrl + Shift + D Show Debug
-- Custom implementation needed

-- Ctrl + Shift + X Show Extensions
-- Custom implementation needed

-- Ctrl + Shift + H Replace in files
-- Custom implementation needed

-- Ctrl + Shift + J Toggle Search details
-- Custom implementation needed

-- Ctrl + Shift + U Show Output panel
nmap('<C-S-u>', ':Telescope quickfix<CR>')

-- Ctrl + Shift + V Open Markdown preview
-- Custom implementation needed

-- Ctrl + K V Open Markdown preview to the side
-- Custom implementation needed

-- Ctrl + K Z Zen Mode (Esc Esc to exit)
-- Custom implementation needed

-- Debug
-- F9 Toggle breakpoint
nmap('<F9>', ':lua require"dap".toggle_breakpoint()<CR>')

-- F5 Start/Continue
nmap('<F5>', ':lua require"dap".continue()<CR>')

-- Shift + F5 Stop
nmap('<S-F5>', ':lua require"dap".terminate()<CR>')

-- F11 / Shift + F11 Step into/out
nmap('<F11>', ':lua require"dap".step_into()<CR>')
nmap('<S-F11>', ':lua require"dap".step_out()<CR>')

-- F10 Step over
nmap('<F10>', ':lua require"dap".step_over()<CR>')

-- Ctrl + K Ctrl + I Show hover
nmap('<C-k><C-i>', ':lua vim.lsp.buf.hover()<CR>')

-- Integrated terminal
-- Ctrl + ` Show integrated terminal
nmap('<C-`>', ':ToggleTerm<CR>')

-- Ctrl + Shift + ` Create new terminal
nmap('<C-S-`>', ':ToggleTerm<CR>')

-- Ctrl + C Copy selection
vmap('<C-c>', '"+y')
nmap('<C-c>', '"+yy')

-- Ctrl + V Paste into active terminal
vmap('<C-v>', '"+p')
nmap('<C-v>', '"+p')

-- Ctrl + ↑ / ↓ Scroll up/down
nmap('<C-Up>', '<C-y>')
nmap('<C-Down>', '<C-e>')

-- Shift + PgUp / PgDn Scroll page up/down
nmap('<S-PgUp>', '<C-b>')
nmap('<S-PgDn>', '<C-f>')

-- Ctrl + Home / End Scroll to top/bottom
nmap('<C-Home>', 'gg')
nmap('<C-End>', 'G')

-- Multi-cursor and selection (Custom implementation needed)
-- Alt + Click Insert cursor
-- Custom implementation needed

-- Ctrl + Alt + ↑ / ↓ Insert cursor above / below
-- Custom implementation needed

-- Ctrl + U Undo last cursor operation
nmap('<C-u>', 'u')

-- Shift + Alt + I Insert cursor at end of each line selected
-- Custom implementation needed

-- Ctrl + L Select current line
nmap('<C-l>', 'V')

-- Ctrl + Shift + L Select all occurrences of current selection
-- Custom implementation needed

-- Ctrl + F2 Select all occurrences of current word
-- Custom implementation needed

-- Shift + Alt + → Expand selection
-- Custom implementation needed

-- Shift + Alt + ← Shrink selection
-- Custom implementation needed

-- Shift + Alt + (drag mouse) Column (box) selection
-- Custom implementation needed

-- Ctrl + Shift + Alt + (arrow key) Column (box) selection
-- Custom implementation needed

-- Ctrl + Shift + Alt + PgUp/PgDn Column (box) selection page up/down
-- Custom implementation needed

-- Rich languages editing
-- Ctrl + Space, Ctrl + I Trigger suggestion
nmap('<C-Space>', ':lua vim.lsp.buf.completion()<CR>')
nmap('<C-i>', ':lua vim.lsp.buf.completion()<CR>')

-- Ctrl + Shift + Space Trigger parameter hints
nmap('<C-S-Space>', ':lua vim.lsp.buf.signature_help()<CR>')

-- Shift + Alt + F Format document
nmap('<S-A-f>', ':lua vim.lsp.buf.formatting()<CR>')

-- Ctrl + K Ctrl + F Format selection
nmap('<C-k><C-f>', ':lua vim.lsp.buf.range_formatting()<CR>')

-- F12 Go to Definition
nmap('<F12>', ':lua vim.lsp.buf.definition()<CR>')

-- Alt + F12 Peek Definition
nmap('<A-F12>', ':lua vim.lsp.buf.hover()<CR>')

-- Ctrl + K F12 Open Definition to the side
nmap('<C-k><F12>', ':vsplit<CR>:lua vim.lsp.buf.definition()<CR>')

-- Ctrl + . Quick Fix
nmap('<C-.>', ':lua vim.lsp.buf.code_action()<CR>')

-- Shift + F12 Show References
nmap('<S-F12>', ':lua vim.lsp.buf.references()<CR>')

-- F2 Rename Symbol
nmap('<F2>', ':lua vim.lsp.buf.rename()<CR>')

-- Ctrl + K Ctrl + X Trim trailing whitespace
nmap('<C-k><C-x>', ':lua vim.cmd(":%s/\\s\\+$//e")<CR>')

-- Ctrl + K M Change file language
-- Custom implementation needed

-- Editor management
-- Ctrl + F4, Ctrl + W Close editor
nmap('<C-F4>', ':q<CR>')
nmap('<C-w>', ':q<CR>')

-- Ctrl + K F Close folder
-- Custom implementation needed

-- Ctrl + \ Split editor
nmap('<C-\\>', ':vsplit<CR>')

-- Ctrl + 1 / 2 / 3 Focus into 1st, 2nd, or 3rd editor group
-- Custom implementation needed

-- Ctrl + K Ctrl + ←/→ Focus into previous/next editor group
-- Custom implementation needed

-- Ctrl + Shift + PgUp / PgDn Move editor left/right
-- Custom implementation needed

-- Ctrl + K ← / → Move active editor group
-- Custom implementation needed

-- Ctrl + N New File
nmap('<C-n>', ':enew<CR>')

-- Ctrl + O Open File...
nmap('<C-o>', ':Telescope find_files<CR>')

-- Ctrl + S Save
nmap('<C-s>', ':w<CR>')

-- Ctrl + Shift + S Save As...
-- Custom implementation needed

-- Ctrl + K S Save All
-- Custom implementation needed

-- Ctrl + F4 Close
nmap('<C-F4>', ':q<CR>')

-- Ctrl + K Ctrl + W Close All
nmap('<C-k><C-w>', ':qa<CR>')

-- Ctrl + Shift + T Reopen closed editor
nmap('<C-S-T>', ':e#<CR>')

-- Ctrl + K Enter Keep preview mode editor open
-- Custom implementation needed

-- Ctrl + Tab Open next
nmap('<C-Tab>', ':bnext<CR>')

-- Ctrl + Shift + Tab Open previous
nmap('<C-S-Tab>', ':bprev<CR>')

-- Ctrl + K P Copy path of active file
-- Custom implementation needed

-- Ctrl + K R Reveal active file in Explorer
-- Custom implementation needed

-- Ctrl + K O Show active file in new window/instance
-- Custom implementation needed

-- Display
-- F11 Toggle full screen
-- Custom implementation needed

-- Shift + Alt + 0 Toggle editor layout (horizontal/vertical)
-- Custom implementation needed

-- Ctrl + = / - Zoom in/out
-- Custom implementation needed

-- Ctrl + B Toggle Sidebar visibility
nmap('<C-b>', ':NvimTreeToggle<CR>')

-- Ctrl + Shift + E Show Explorer / Toggle focus
nmap('<C-S-e>', ':NvimTreeFocus<CR>')

-- Ctrl + Shift + F Show Search
nmap('<C-S-f>', ':Telescope live_grep<CR>')

-- Ctrl + Shift + G
--
--
--
--
--
--
-- Ctrl + Shift + G Show Source Control
nmap('<C-S-g>', ':Telescope git_status<CR>')

-- Ctrl + Shift + D Show Debug
-- Custom implementation needed

-- Ctrl + Shift + X Show Extensions
-- Custom implementation needed

-- Ctrl + Shift + H Replace in files
nmap('<C-S-h>', ':Telescope grep_string<CR>')

-- Ctrl + Shift + J Toggle Search details
-- Custom implementation needed

-- Ctrl + Shift + U Show Output panel
nmap('<C-S-u>', ':Telescope quickfix<CR>')

-- Ctrl + Shift + V Open Markdown preview
-- Custom implementation needed

-- Ctrl + K V Open Markdown preview to the side
-- Custom implementation needed

-- Ctrl + K Z Zen Mode (Esc Esc to exit)
-- Custom implementation needed

-- Debug
-- F9 Toggle breakpoint
nmap('<F9>', ':lua require"dap".toggle_breakpoint()<CR>')

-- F5 Start/Continue
nmap('<F5>', ':lua require"dap".continue()<CR>')

-- Shift + F5 Stop
nmap('<S-F5>', ':lua require"dap".terminate()<CR>')

-- F11 / Shift + F11 Step into/out
nmap('<F11>', ':lua require"dap".step_into()<CR>')
nmap('<S-F11>', ':lua require"dap".step_out()<CR>')

-- F10 Step over
nmap('<F10>', ':lua require"dap".step_over()<CR>')

-- Ctrl + K Ctrl + I Show hover
nmap('<C-k><C-i>', ':lua vim.lsp.buf.hover()<CR>')

-- Integrated terminal
-- Ctrl + ` Show integrated terminal
nmap('<C-`>', ':ToggleTerm<CR>')

-- Ctrl + Shift + ` Create new terminal
nmap('<C-S-`>', ':ToggleTerm<CR>')

-- Ctrl + C Copy selection
vmap('<C-c>', '"+y')
nmap('<C-c>', '"+yy')

-- Ctrl + V Paste into active terminal
vmap('<C-v>', '"+p')
nmap('<C-v>', '"+p')

-- Ctrl + ↑ / ↓ Scroll up/down
nmap('<C-Up>', '<C-y>')
nmap('<C-Down>', '<C-e>')

-- Shift + PgUp / PgDn Scroll page up/down
nmap('<S-PgUp>', '<C-b>')
nmap('<S-PgDn>', '<C-f>')

-- Ctrl + Home / End Scroll to top/bottom
nmap('<C-Home>', 'gg')
nmap('<C-End>', 'G')

-- Custom multi-cursor implementation
-- Alt + Click Insert cursor
-- Custom implementation needed

-- Ctrl + Alt + ↑ / ↓ Insert cursor above / below
-- Custom implementation needed

-- Ctrl + U Undo last cursor operation
nmap('<C-u>', 'u')

-- Shift + Alt + I Insert cursor at end of each line selected
-- Custom implementation needed

-- Ctrl + L Select current line
nmap('<C-l>', 'V')

-- Ctrl + Shift + L Select all occurrences of current selection
-- Custom implementation needed

-- Ctrl + F2 Select all occurrences of current word
-- Custom implementation needed

-- Shift + Alt + → Expand selection
-- Custom implementation needed

-- Shift + Alt + ← Shrink selection
-- Custom implementation needed

-- Shift + Alt + (drag mouse) Column (box) selection
-- Custom implementation needed

-- Ctrl + Shift + Alt + (arrow key) Column (box) selection
-- Custom implementation needed

-- Ctrl + Shift + Alt + PgUp/PgDn Column (box) selection page up/down
-- Custom implementation needed

-- Rich languages editing
-- Ctrl + Space, Ctrl + I Trigger suggestion
nmap('<C-Space>', ':lua vim.lsp.buf.completion()<CR>')
nmap('<C-i>', ':lua vim.lsp.buf.completion()<CR>')

-- Ctrl + Shift + Space Trigger parameter hints
nmap('<C-S-Space>', ':lua vim.lsp.buf.signature_help()<CR>')

-- Shift + Alt + F Format document
nmap('<S-A-f>', ':lua vim.lsp.buf.formatting()<CR>')

-- Ctrl + K Ctrl + F Format selection
nmap('<C-k><C-f>', ':lua vim.lsp.buf.range_formatting()<CR>')

-- F12 Go to Definition
nmap('<F12>', ':lua vim.lsp.buf.definition()<CR>')

-- Alt + F12 Peek Definition
nmap('<A-F12>', ':lua vim.lsp.buf.hover()<CR>')

-- Ctrl + K F12 Open Definition to the side
nmap('<C-k><F12>', ':vsplit<CR>:lua vim.lsp.buf.definition()<CR>')

-- Ctrl + . Quick Fix
nmap('<C-.>', ':lua vim.lsp.buf.code_action()<CR>')

-- Shift + F12 Show References
nmap('<S-F12>', ':lua vim.lsp.buf.references()<CR>')

-- F2 Rename Symbol
nmap('<F2>', ':lua vim.lsp.buf.rename()<CR>')

-- Ctrl + K Ctrl + X Trim trailing whitespace
nmap('<C-k><C-x>', ':lua vim.cmd(":%s/\\s\\+$//e")<CR>')

-- Ctrl + K M Change file language
-- Custom implementation needed

-- Editor management
-- Ctrl + F4, Ctrl + W Close editor
nmap('<C-F4>', ':q<CR>')
nmap('<C-w>', ':q<CR>')

-- Ctrl + K F Close folder
-- Custom implementation needed

-- Ctrl + \ Split editor
nmap('<C-\\>', ':vsplit<CR>')

-- Ctrl + 1 / 2 / 3 Focus into 1st, 2nd, or 3rd editor group
-- Custom implementation needed

-- Ctrl + K Ctrl + ←/→ Focus into previous/next editor group
-- Custom implementation needed

-- Ctrl + Shift + PgUp / PgDn Move editor left/right
-- Custom implementation needed

-- Ctrl + K ← / → Move active editor group
-- Custom implementation needed

-- Ctrl + N New File
nmap('<C-n>', ':enew<CR>')

-- Ctrl + O Open File...
nmap('<C-o>', ':Telescope find_files<CR>')

-- Ctrl + S Save
nmap('<C-s>', ':w<CR>')

-- Ctrl + Shift + S Save As...
-- Custom implementation needed

-- Ctrl + K S Save All
-- Custom implementation needed

-- Ctrl + F4 Close
nmap('<C-F4>', ':q<CR>')

-- Ctrl + K Ctrl + W Close All
nmap('<C-k><C-w>', ':qa<CR>')

-- Ctrl + Shift + T Reopen closed editor
nmap('<C-S-T>', ':e#<CR>')

-- Ctrl + K Enter Keep preview mode editor open
-- Custom implementation needed

-- Ctrl + Tab Open next
nmap('<C-Tab>', ':bnext<CR>')

-- Ctrl + Shift + Tab Open previous
nmap('<C-S-Tab>', ':bprev<CR>')

-- Ctrl + K P Copy path of active file
-- Custom implementation needed

-- Ctrl + K R Reveal active file in Explorer
-- Custom implementation needed

-- Ctrl + K O Show active file in new window/instance
-- Custom implementation needed

-- Display
-- F11 Toggle full screen
-- Custom implementation needed

-- Shift + Alt + 0 Toggle editor layout (horizontal/vertical)
-- Custom implementation needed

-- Ctrl + = / - Zoom in/out
-- Custom implementation needed

-- Ctrl + B Toggle Sidebar visibility
nmap('<C-b>', ':NvimTreeToggle<CR>')

-- Ctrl + Shift + E Show Explorer / Toggle focus
nmap('<C-S-e>', ':NvimTreeFocus<CR>')

-- Ctrl + Shift + F Show Search
nmap('<C-S-f>', ':Telescope live_grep<CR>')

-- Ctrl + Shift + G Show Source Control
nmap('<C-S-g>', ':Telescope git_status<CR>')

-- Ctrl + Shift + D Show Debug
-- Custom implementation needed

-- Ctrl + Shift + X Show Extensions
-- Custom implementation needed

-- Ctrl + Shift + H Replace in files
nmap('<C-S-h>', ':Telescope grep_string<CR>')

-- Ctrl + Shift + J Toggle Search details
-- Custom implementation needed

-- Ctrl + Shift + U Show Output panel
nmap('<C-S-u>', ':Telescope quickfix<CR>')

-- Ctrl + Shift + V Open Markdown preview
-- Custom implementation needed

-- Ctrl + K V Open Markdown preview to the side
-- Custom implementation needed

-- Ctrl + K Z Zen Mode (Esc Esc to exit)
-- Custom implementation needed

-- Debug
-- F9 Toggle breakpoint
nmap('<F9>', ':lua require"dap".toggle_breakpoint()<CR>')

-- F5 Start/Continue
nmap('<F5>', ':lua require"dap".continue()<CR>')

-- Shift + F5 Stop
nmap('<S-F5>', ':lua require"dap".terminate()<CR>')

-- F11 / Shift + F11 Step into/out
nmap('<F11>', ':lua require"dap".step_into()<CR>')
nmap('<S-F11>', ':lua require"dap".step_out()<CR>')

-- F10 Step over
nmap('<F10>', ':lua require"dap".step_over()<CR>')

-- Ctrl + K Ctrl + I Show hover





nmap('<C-k><C-i>', ':lua vim.lsp.buf.hover()<CR>')

-- Integrated terminal
-- Ctrl + ` Show integrated terminal
nmap('<C-`>', ':ToggleTerm<CR>')

-- Ctrl + Shift + ` Create new terminal
nmap('<C-S-`>', ':ToggleTerm<CR>')

-- Ctrl + C Copy selection
vmap('<C-c>', '"+y')
nmap('<C-c>', '"+yy')

-- Ctrl + V Paste into active terminal
vmap('<C-v>', '"+p')
nmap('<C-v>', '"+p')

-- Ctrl + ↑ / ↓ Scroll up/down
nmap('<C-Up>', '<C-y>')
nmap('<C-Down>', '<C-e>')

-- Shift + PgUp / PgDn Scroll page up/down
nmap('<S-PgUp>', '<C-b>')
nmap('<S-PgDn>', '<C-f>')

-- Ctrl + Home / End Scroll to top/bottom
nmap('<C-Home>', 'gg')
nmap('<C-End>', 'G')

-- Multi-cursor and selection (Custom implementation needed)
-- Alt + Click Insert cursor
-- Custom implementation needed

-- Ctrl + Alt + ↑ / ↓ Insert cursor above / below
-- Custom implementation needed

-- Ctrl + U Undo last cursor operation
nmap('<C-u>', 'u')

-- Shift + Alt + I Insert cursor at end of each line selected
-- Custom implementation needed

-- Ctrl + L Select current line
nmap('<C-l>', 'V')

-- Ctrl + Shift + L Select all occurrences of current selection
-- Custom implementation needed

-- Ctrl + F2 Select all occurrences of current word
-- Custom implementation needed

-- Shift + Alt + → Expand selection
-- Custom implementation needed

-- Shift + Alt + ← Shrink selection
-- Custom implementation needed

-- Shift + Alt + (drag mouse) Column (box) selection
-- Custom implementation needed

-- Ctrl + Shift + Alt + (arrow key) Column (box) selection
-- Custom implementation needed

-- Ctrl + Shift + Alt + PgUp/PgDn Column (box) selection page up/down
-- Custom implementation needed

-- Rich languages editing
-- Ctrl + Space, Ctrl + I Trigger suggestion
--
--
--
--
--
--

