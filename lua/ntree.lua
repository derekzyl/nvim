-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true



require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 25,
  },
  on_attach = function(bufnr)
    local api = require('nvim-tree.api')
    
    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    
    -- Custom mappings
    vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
  end,
  renderer = {
    group_empty = true,
  },


  update_cwd = true,
  actions = {
    open_file = {
      resize_window = true,
    },
  },

  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  filters = {
    dotfiles = false,
  },
  diagnostics = {
    enable = true,
  },





})
