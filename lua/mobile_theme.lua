-- ===========================================
-- 📱 MOBILE TERMUX THEME CONFIGURATION 📱
-- ===========================================

-- Mobile theme setup
local function setup_mobile_theme()
  -- Set mobile-friendly theme
  vim.cmd('colorscheme catppuccin')
  
  -- Mobile-optimized highlight groups
  vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = '*',
    callback = function()
      -- Mobile-friendly highlight overrides
      vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'LineNr', { bg = 'NONE', fg = '#6c7086' })
      vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'NONE', fg = '#f5c2e7' })
      vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'TabLine', { bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'TabLineFill', { bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'TabLineSel', { bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'WinSeparator', { bg = 'NONE', fg = '#6c7086' })
      
      -- Mobile-friendly popup colors
      vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#1e1e2e', fg = '#cdd6f4' })
      vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#89b4fa', fg = '#1e1e2e' })
      vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = '#1e1e2e' })
      vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = '#6c7086' })
      
      -- Mobile-friendly diagnostic colors
      vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = '#f38ba8' })
      vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = '#f9e2af' })
      vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = '#89b4fa' })
      vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = '#cba6f7' })
      
      -- Mobile-friendly LSP colors
      vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = '#313244' })
      vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = '#313244' })
      vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = '#313244' })
      
      -- Mobile-friendly search colors
      vim.api.nvim_set_hl(0, 'Search', { bg = '#f9e2af', fg = '#1e1e2e' })
      vim.api.nvim_set_hl(0, 'IncSearch', { bg = '#f9e2af', fg = '#1e1e2e' })
      vim.api.nvim_set_hl(0, 'CurSearch', { bg = '#f9e2af', fg = '#1e1e2e' })
      
      -- Mobile-friendly visual selection
      vim.api.nvim_set_hl(0, 'Visual', { bg = '#313244' })
      vim.api.nvim_set_hl(0, 'VisualNOS', { bg = '#313244' })
      
      -- Mobile-friendly cursor
      vim.api.nvim_set_hl(0, 'Cursor', { bg = '#f5c2e7', fg = '#1e1e2e' })
      vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#313244' })
      vim.api.nvim_set_hl(0, 'CursorColumn', { bg = '#313244' })
      
      -- Mobile-friendly fold colors
      vim.api.nvim_set_hl(0, 'Folded', { bg = '#313244', fg = '#6c7086' })
      vim.api.nvim_set_hl(0, 'FoldColumn', { bg = 'NONE', fg = '#6c7086' })
      
      -- Mobile-friendly diff colors
      vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#a6e3a1', fg = '#1e1e2e' })
      vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#f9e2af', fg = '#1e1e2e' })
      vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#f38ba8', fg = '#1e1e2e' })
      vim.api.nvim_set_hl(0, 'DiffText', { bg = '#89b4fa', fg = '#1e1e2e' })
      
      -- Mobile-friendly git colors
      vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#a6e3a1' })
      vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#f9e2af' })
      vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#f38ba8' })
      
      -- Mobile-friendly telescope colors
      vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = '#1e1e2e', fg = '#cdd6f4' })
      vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = '#1e1e2e', fg = '#1e1e2e' })
      vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = '#313244', fg = '#cdd6f4' })
      vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = '#313244', fg = '#313244' })
      vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { bg = '#313244', fg = '#cdd6f4' })
      vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { bg = '#1e1e2e', fg = '#cdd6f4' })
      vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { bg = '#1e1e2e', fg = '#cdd6f4' })
      vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#89b4fa', fg = '#1e1e2e' })
      vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { bg = '#89b4fa', fg = '#1e1e2e' })
      
      -- Mobile-friendly nvim-tree colors
      vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = '#1e1e2e', fg = '#cdd6f4' })
      vim.api.nvim_set_hl(0, 'NvimTreeNormalNC', { bg = '#1e1e2e', fg = '#cdd6f4' })
      vim.api.nvim_set_hl(0, 'NvimTreeEndOfBuffer', { bg = '#1e1e2e', fg = '#1e1e2e' })
      vim.api.nvim_set_hl(0, 'NvimTreeCursorLine', { bg = '#313244' })
      vim.api.nvim_set_hl(0, 'NvimTreeCursorLineNr', { bg = '#313244', fg = '#f5c2e7' })
      vim.api.nvim_set_hl(0, 'NvimTreeLineNr', { bg = '#1e1e2e', fg = '#6c7086' })
      vim.api.nvim_set_hl(0, 'NvimTreeRootFolder', { bg = '#1e1e2e', fg = '#89b4fa' })
      vim.api.nvim_set_hl(0, 'NvimTreeFolderName', { bg = '#1e1e2e', fg = '#89b4fa' })
      vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { bg = '#1e1e2e', fg = '#89b4fa' })
      vim.api.nvim_set_hl(0, 'NvimTreeFileIcon', { bg = '#1e1e2e', fg = '#cdd6f4' })
      vim.api.nvim_set_hl(0, 'NvimTreeExecFile', { bg = '#1e1e2e', fg = '#a6e3a1' })
      vim.api.nvim_set_hl(0, 'NvimTreeOpenedFile', { bg = '#1e1e2e', fg = '#f9e2af' })
      vim.api.nvim_set_hl(0, 'NvimTreeSpecialFile', { bg = '#1e1e2e', fg = '#cba6f7' })
      vim.api.nvim_set_hl(0, 'NvimTreeImageFile', { bg = '#1e1e2e', fg = '#f5c2e7' })
      vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { bg = '#1e1e2e', fg = '#6c7086' })
      vim.api.nvim_set_hl(0, 'NvimTreeGitDirty', { bg = '#1e1e2e', fg = '#f9e2af' })
      vim.api.nvim_set_hl(0, 'NvimTreeGitStaged', { bg = '#1e1e2e', fg = '#a6e3a1' })
      vim.api.nvim_set_hl(0, 'NvimTreeGitMerge', { bg = '#1e1e2e', fg = '#89b4fa' })
      vim.api.nvim_set_hl(0, 'NvimTreeGitRenamed', { bg = '#1e1e2e', fg = '#cba6f7' })
      vim.api.nvim_set_hl(0, 'NvimTreeGitNew', { bg = '#1e1e2e', fg = '#a6e3a1' })
      vim.api.nvim_set_hl(0, 'NvimTreeGitDeleted', { bg = '#1e1e2e', fg = '#f38ba8' })
      
      -- Mobile-friendly bufferline colors
      vim.api.nvim_set_hl(0, 'BufferLineFill', { bg = '#1e1e2e' })
      vim.api.nvim_set_hl(0, 'BufferLineBackground', { bg = '#1e1e2e', fg = '#6c7086' })
      vim.api.nvim_set_hl(0, 'BufferLineBufferSelected', { bg = '#313244', fg = '#cdd6f4' })
      vim.api.nvim_set_hl(0, 'BufferLineBufferVisible', { bg = '#1e1e2e', fg = '#6c7086' })
      vim.api.nvim_set_hl(0, 'BufferLineTab', { bg = '#1e1e2e', fg = '#6c7086' })
      vim.api.nvim_set_hl(0, 'BufferLineTabSelected', { bg = '#313244', fg = '#cdd6f4' })
      vim.api.nvim_set_hl(0, 'BufferLineTabClose', { bg = '#1e1e2e', fg = '#f38ba8' })
      vim.api.nvim_set_hl(0, 'BufferLineCloseButton', { bg = '#1e1e2e', fg = '#f38ba8' })
      vim.api.nvim_set_hl(0, 'BufferLineCloseButtonVisible', { bg = '#1e1e2e', fg = '#f38ba8' })
      vim.api.nvim_set_hl(0, 'BufferLineCloseButtonSelected', { bg = '#313244', fg = '#f38ba8' })
      vim.api.nvim_set_hl(0, 'BufferLineIndicatorSelected', { bg = '#313244', fg = '#89b4fa' })
      vim.api.nvim_set_hl(0, 'BufferLineIndicatorVisible', { bg = '#1e1e2e', fg = '#89b4fa' })
      vim.api.nvim_set_hl(0, 'BufferLineModified', { bg = '#1e1e2e', fg = '#f9e2af' })
      vim.api.nvim_set_hl(0, 'BufferLineModifiedVisible', { bg = '#1e1e2e', fg = '#f9e2af' })
      vim.api.nvim_set_hl(0, 'BufferLineModifiedSelected', { bg = '#313244', fg = '#f9e2af' })
      vim.api.nvim_set_hl(0, 'BufferLineSeparator', { bg = '#1e1e2e', fg = '#6c7086' })
      vim.api.nvim_set_hl(0, 'BufferLineSeparatorVisible', { bg = '#1e1e2e', fg = '#6c7086' })
      vim.api.nvim_set_hl(0, 'BufferLineSeparatorSelected', { bg = '#313244', fg = '#6c7086' })
      vim.api.nvim_set_hl(0, 'BufferLineDuplicate', { bg = '#1e1e2e', fg = '#6c7086' })
      vim.api.nvim_set_hl(0, 'BufferLineDuplicateVisible', { bg = '#1e1e2e', fg = '#6c7086' })
      vim.api.nvim_set_hl(0, 'BufferLineDuplicateSelected', { bg = '#313244', fg = '#6c7086' })
      vim.api.nvim_set_hl(0, 'BufferLineError', { bg = '#1e1e2e', fg = '#f38ba8' })
      vim.api.nvim_set_hl(0, 'BufferLineErrorVisible', { bg = '#1e1e2e', fg = '#f38ba8' })
      vim.api.nvim_set_hl(0, 'BufferLineErrorSelected', { bg = '#313244', fg = '#f38ba8' })
      vim.api.nvim_set_hl(0, 'BufferLineErrorDiagnostic', { bg = '#1e1e2e', fg = '#f38ba8' })
      vim.api.nvim_set_hl(0, 'BufferLineErrorDiagnosticVisible', { bg = '#1e1e2e', fg = '#f38ba8' })
      vim.api.nvim_set_hl(0, 'BufferLineErrorDiagnosticSelected', { bg = '#313244', fg = '#f38ba8' })
      vim.api.nvim_set_hl(0, 'BufferLineWarning', { bg = '#1e1e2e', fg = '#f9e2af' })
      vim.api.nvim_set_hl(0, 'BufferLineWarningVisible', { bg = '#1e1e2e', fg = '#f9e2af' })
      vim.api.nvim_set_hl(0, 'BufferLineWarningSelected', { bg = '#313244', fg = '#f9e2af' })
      vim.api.nvim_set_hl(0, 'BufferLineWarningDiagnostic', { bg = '#1e1e2e', fg = '#f9e2af' })
      vim.api.nvim_set_hl(0, 'BufferLineWarningDiagnosticVisible', { bg = '#1e1e2e', fg = '#f9e2af' })
      vim.api.nvim_set_hl(0, 'BufferLineWarningDiagnosticSelected', { bg = '#313244', fg = '#f9e2af' })
      vim.api.nvim_set_hl(0, 'BufferLineInfo', { bg = '#1e1e2e', fg = '#89b4fa' })
      vim.api.nvim_set_hl(0, 'BufferLineInfoVisible', { bg = '#1e1e2e', fg = '#89b4fa' })
      vim.api.nvim_set_hl(0, 'BufferLineInfoSelected', { bg = '#313244', fg = '#89b4fa' })
      vim.api.nvim_set_hl(0, 'BufferLineInfoDiagnostic', { bg = '#1e1e2e', fg = '#89b4fa' })
      vim.api.nvim_set_hl(0, 'BufferLineInfoDiagnosticVisible', { bg = '#1e1e2e', fg = '#89b4fa' })
      vim.api.nvim_set_hl(0, 'BufferLineInfoDiagnosticSelected', { bg = '#313244', fg = '#89b4fa' })
      vim.api.nvim_set_hl(0, 'BufferLineHint', { bg = '#1e1e2e', fg = '#cba6f7' })
      vim.api.nvim_set_hl(0, 'BufferLineHintVisible', { bg = '#1e1e2e', fg = '#cba6f7' })
      vim.api.nvim_set_hl(0, 'BufferLineHintSelected', { bg = '#313244', fg = '#cba6f7' })
      vim.api.nvim_set_hl(0, 'BufferLineHintDiagnostic', { bg = '#1e1e2e', fg = '#cba6f7' })
      vim.api.nvim_set_hl(0, 'BufferLineHintDiagnosticVisible', { bg = '#1e1e2e', fg = '#cba6f7' })
      vim.api.nvim_set_hl(0, 'BufferLineHintDiagnosticSelected', { bg = '#313244', fg = '#cba6f7' })
      
      -- Mobile-friendly lualine colors
      vim.api.nvim_set_hl(0, 'LualineNormal', { bg = '#1e1e2e', fg = '#cdd6f4' })
      vim.api.nvim_set_hl(0, 'LualineNormalNC', { bg = '#1e1e2e', fg = '#6c7086' })
      vim.api.nvim_set_hl(0, 'LualineInsert', { bg = '#1e1e2e', fg = '#a6e3a1' })
      vim.api.nvim_set_hl(0, 'LualineVisual', { bg = '#1e1e2e', fg = '#f9e2af' })
      vim.api.nvim_set_hl(0, 'LualineReplace', { bg = '#1e1e2e', fg = '#f38ba8' })
      vim.api.nvim_set_hl(0, 'LualineCommand', { bg = '#1e1e2e', fg = '#cba6f7' })
      vim.api.nvim_set_hl(0, 'LualineTerminal', { bg = '#1e1e2e', fg = '#89b4fa' })
      vim.api.nvim_set_hl(0, 'LualineInactive', { bg = '#1e1e2e', fg = '#6c7086' })
      
      print('📱 Mobile theme colors applied!')
    end,
  })
end

-- Apply mobile theme
setup_mobile_theme()

-- Mobile theme commands
vim.api.nvim_create_user_command('MobileTheme', function()
  setup_mobile_theme()
  print('📱 Mobile theme refreshed!')
end, {})

vim.api.nvim_create_user_command('MobileThemeLight', function()
  vim.cmd('colorscheme catppuccin-latte')
  print('📱 Light mobile theme applied!')
end, {})

vim.api.nvim_create_user_command('MobileThemeDark', function()
  vim.cmd('colorscheme catppuccin-mocha')
  print('📱 Dark mobile theme applied!')
end, {})

print('📱 Mobile theme configuration loaded!')
