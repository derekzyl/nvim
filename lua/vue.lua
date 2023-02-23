


vim.cmd('autocmd FileType vue syntax syn" c fromstart') -- ensure highlighting works
vim.g.vue_disable_pre_processors = 1 -- speed up vim-vue


local null_ls = require("null-ls")

local my_source = {}
-- source will run on LSP code action request
my_source.method = null_ls.methods.CODE_ACTION

-- source will run on LSP diagnostics request
my_source.method = null_ls.methods.DIAGNOSTICS

-- source will run on LSP formatting request
my_source.method = null_ls.methods.FORMATTING

-- source will run on LSP hover request
my_source.method = null_ls.methods.HOVER

-- source will run on LSP completion request
my_source.method = null_ls.methods.COMPLETION



vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
--function M.setup()
  -- null-ls
 --require("null-ls").setup(opts)

  -- Installer
 -- require("config.lsp.installer").setup(servers, opts)

  -- Inlay hints
   --require("inlay_hints").setup()
--end
require("luasnip.loaders.from_vscode").lazy_load()
