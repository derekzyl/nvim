-- ===========================================
-- 📱 MOBILE TERMUX NEOVIM OPTIMIZATIONS 📱
-- ===========================================

-- Mobile detection function
local function is_mobile()
  -- Check if we're running in Termux (mobile environment)
  local term = os.getenv("TERMUX_VERSION")
  return term ~= nil
end

-- Mobile-specific settings
if is_mobile() then
  print("📱 Mobile mode detected - applying mobile optimizations")
  
  -- ===========================================
  -- MOBILE UI OPTIMIZATIONS
  -- ===========================================
  
  -- Reduce UI elements for more screen space
  vim.o.numberwidth = 2          -- Reduce line number width
  vim.o.signcolumn = 'no'        -- Hide sign column to save space
  vim.o.showmode = false         -- Hide mode indicator (saves space)
  vim.o.ruler = false            -- Hide ruler
  vim.o.laststatus = 0           -- Hide status line by default
  
  -- Mobile-friendly scrolling
  vim.o.scrolloff = 1            -- Reduce scroll offset for small screens
  vim.o.sidescrolloff = 1        -- Reduce horizontal scroll offset
  
  -- Mobile-optimized text display
  vim.o.wrap = true              -- Enable line wrapping for mobile
  vim.o.linebreak = true         -- Break lines at word boundaries
  vim.o.breakindent = true       -- Indent wrapped lines
  vim.o.showbreak = '↳ '         -- Mobile-friendly line break indicator
  
  -- Mobile-friendly search
  vim.o.incsearch = true         -- Incremental search
  vim.o.hlsearch = false         -- Don't highlight search by default (saves CPU)
  
  -- Mobile performance optimizations
  vim.o.lazyredraw = true        -- Don't redraw during macros (performance)
  vim.o.synmaxcol = 300          -- Keep syntax highlighting for all languages
  vim.o.updatetime = 1000        -- Increase update time for better performance
  
  -- Mobile-friendly backup settings
  vim.o.backup = false           -- Disable backup files (save space)
  vim.o.writebackup = false      -- Disable write backup
  vim.o.swapfile = false         -- Disable swap files (save space)
  
  -- Mobile clipboard integration
  vim.o.clipboard = 'unnamedplus' -- Use system clipboard
  
  -- Mobile-friendly completion
  vim.o.completeopt = 'menu,menuone,noinsert,noselect'
  vim.o.pumheight = 8            -- Reduce popup menu height
  
  -- Mobile cursor and selection
  vim.o.cursorline = true        -- Highlight current line
  vim.o.cursorcolumn = false     -- Don't highlight current column (performance)
  
  -- Mobile file operations
  vim.o.autoread = true          -- Auto-reload files when changed externally
  vim.o.autowrite = false        -- Don't auto-write (mobile safety)
  
  -- Mobile terminal integration
  vim.o.termguicolors = true     -- Enable true colors for better mobile display
  
  -- ===========================================
  -- MOBILE KEYBINDINGS
  -- ===========================================
  
  -- Mobile leader key (easy to reach on mobile keyboards)
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '
  
  -- Mobile-friendly navigation
  vim.keymap.set('n', '<leader>h', '<C-w>h', { desc = 'Move to left window' })
  vim.keymap.set('n', '<leader>j', '<C-w>j', { desc = 'Move to bottom window' })
  vim.keymap.set('n', '<leader>k', '<C-w>k', { desc = 'Move to top window' })
  vim.keymap.set('n', '<leader>l', '<C-w>l', { desc = 'Move to right window' })
  
  -- Mobile file operations
  vim.keymap.set('n', '<leader>f', ':Telescope find_files<CR>', { desc = 'Find files' })
  vim.keymap.set('n', '<leader>b', ':Telescope buffers<CR>', { desc = 'Show buffers' })
  vim.keymap.set('n', '<leader>g', ':Telescope live_grep<CR>', { desc = 'Live grep' })
  vim.keymap.set('n', '<leader>s', ':w<CR>', { desc = 'Save file' })
  vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit' })
  vim.keymap.set('n', '<leader>w', ':wq<CR>', { desc = 'Save and quit' })
  
  -- Mobile tree navigation
  vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>', { desc = 'Toggle file tree' })
  vim.keymap.set('n', '<leader>e', ':NvimTreeFocus<CR>', { desc = 'Focus file tree' })
  
  -- Mobile search and replace
  vim.keymap.set('n', '<leader>/', ':nohlsearch<CR>', { desc = 'Clear search highlight' })
  vim.keymap.set('n', '<leader>r', ':%s/', { desc = 'Replace in file' })
  
  -- Mobile buffer navigation
  vim.keymap.set('n', '<leader>n', ':bnext<CR>', { desc = 'Next buffer' })
  vim.keymap.set('n', '<leader>p', ':bprev<CR>', { desc = 'Previous buffer' })
  vim.keymap.set('n', '<leader>d', ':bdelete<CR>', { desc = 'Delete buffer' })
  
  -- Mobile LSP shortcuts
  vim.keymap.set('n', '<leader>c', ':lua vim.lsp.buf.code_action()<CR>', { desc = 'Code action' })
  vim.keymap.set('n', '<leader>d', ':lua vim.lsp.buf.definition()<CR>', { desc = 'Go to definition' })
  vim.keymap.set('n', '<leader>i', ':lua vim.lsp.buf.hover()<CR>', { desc = 'Show hover info' })
  vim.keymap.set('n', '<leader>r', ':lua vim.lsp.buf.rename()<CR>', { desc = 'Rename symbol' })
  
  -- Mobile comment toggle
  vim.keymap.set('n', '<leader>/', ':CommentToggle<CR>', { desc = 'Toggle comment' })
  vim.keymap.set('v', '<leader>/', ':CommentToggle<CR>', { desc = 'Toggle comment' })
  
  -- Mobile terminal
  vim.keymap.set('n', '<leader>v', ':vsplit<CR>', { desc = 'Vertical split' })
  vim.keymap.set('n', '<leader>h', ':split<CR>', { desc = 'Horizontal split' })
  
  -- Mobile escape alternatives (for mobile keyboards)
  vim.keymap.set('i', 'jj', '<Esc>', { desc = 'Escape insert mode' })
  vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Escape insert mode' })
  vim.keymap.set('i', 'kj', '<Esc>', { desc = 'Escape insert mode' })
  
  -- Mobile copy/paste
  vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Copy to clipboard' })
  vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Copy to clipboard' })
  vim.keymap.set('n', '<leader>p', '"+p', { desc = 'Paste from clipboard' })
  vim.keymap.set('v', '<leader>p', '"+p', { desc = 'Paste from clipboard' })
  
  -- Mobile undo/redo
  vim.keymap.set('n', '<leader>u', 'u', { desc = 'Undo' })
  vim.keymap.set('n', '<leader>U', '<C-r>', { desc = 'Redo' })
  
  -- Mobile help
  vim.keymap.set('n', '<leader>?', ':help<CR>', { desc = 'Open help' })
  
  -- ===========================================
  -- MOBILE PLUGIN CONFIGURATIONS
  -- ===========================================
  
  -- Configure NvimTree for mobile
  if pcall(require, 'nvim-tree') then
    require('nvim-tree').setup({
      view = {
        width = 30,              -- Reduce width for mobile
        side = 'left',
        preserve_window_proportions = false,
      },
      renderer = {
        icons = {
          show = {
            file = false,        -- Hide file icons (performance)
            folder = false,      -- Hide folder icons (performance)
          },
        },
      },
      actions = {
        open_file = {
          resize_window = true,
        },
      },
    })
  end
  
  -- Configure Telescope for mobile
  if pcall(require, 'telescope') then
    require('telescope').setup({
      defaults = {
        layout_config = {
          width = 0.9,           -- Use more screen width
          height = 0.8,          -- Use more screen height
        },
        prompt_prefix = "🔍 ",   -- Mobile-friendly prompt
        selection_caret = "➤ ",
        entry_prefix = "  ",
        initial_mode = "insert", -- Start in insert mode for mobile
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        file_sorter = require('telescope.sorters').get_fuzzy_file,
        generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" },
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
        buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
      },
    })
  end
  
  -- Configure Lualine for mobile
  if pcall(require, 'lualine') then
    require('lualine').setup({
      options = {
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = {}
    })
  end
  
  -- ===========================================
  -- MOBILE PERFORMANCE OPTIMIZATIONS
  -- ===========================================
  
  -- Disable heavy features for mobile
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  vim.g.loaded_matchit = 1
  vim.g.loaded_matchparen = 1
  vim.g.loaded_2html_plugin = 1
  vim.g.loaded_getscript = 1
  vim.g.loaded_getscriptPlugin = 1
  vim.g.loaded_gzip = 1
  vim.g.loaded_logipat = 1
  vim.g.loaded_rrhelper = 1
  vim.g.loaded_spellfile_plugin = 1
  vim.g.loaded_tar = 1
  vim.g.loaded_tarPlugin = 1
  vim.g.loaded_vimball = 1
  vim.g.loaded_vimballPlugin = 1
  vim.g.loaded_zip = 1
  vim.g.loaded_zipPlugin = 1
  
  -- Mobile-specific autocmds
  vim.api.nvim_create_autocmd('VimEnter', {
    pattern = '*',
    callback = function()
      print('📱 Mobile Neovim ready! Use <leader>? for help')
    end,
  })
  
  -- Mobile help function
  function MobileHelp()
    print("==========================================")
    print("📱 MOBILE NEOVIM SHORTCUTS 📱")
    print("==========================================")
    print("File Operations:")
    print("  <leader>f  - Find files")
    print("  <leader>b  - Show buffers")
    print("  <leader>s  - Save file")
    print("  <leader>q  - Quit")
    print("  <leader>w  - Save and quit")
    print("")
    print("Navigation:")
    print("  <leader>t  - Toggle file tree")
    print("  <leader>e  - Focus file tree")
    print("  <leader>n  - Next buffer")
    print("  <leader>p  - Previous buffer")
    print("")
    print("Search & Replace:")
    print("  <leader>g  - Live grep")
    print("  <leader>/  - Clear search highlight")
    print("  <leader>r  - Replace in file")
    print("")
    print("LSP:")
    print("  <leader>c  - Code action")
    print("  <leader>d  - Go to definition")
    print("  <leader>i  - Show hover info")
    print("  <leader>r  - Rename symbol")
    print("")
    print("Mobile Tips:")
    print("  jj, jk, kj - Escape insert mode")
    print("  <leader>y  - Copy to clipboard")
    print("  <leader>p  - Paste from clipboard")
    print("  <leader>?  - Show this help")
    print("==========================================")
  end
  
  -- Add mobile help command
  vim.api.nvim_create_user_command('MobileHelp', MobileHelp, {})
  vim.keymap.set('n', '<leader>?', ':MobileHelp<CR>', { desc = 'Show mobile help' })
  
  print("📱 Mobile optimizations applied successfully!")
  
else
  print("🖥️  Desktop mode detected - using standard configuration")
end

return {
  is_mobile = is_mobile,
}
