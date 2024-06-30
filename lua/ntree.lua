-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true



require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 25,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },


update_cwd = true,
open_on_setup = false,
open_on_setup_file = false,
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
