vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.lsp.enable('pyright')
vim.lsp.enable('tsserver')
vim.lsp.enable('gopls')
require('plugins')
require('setting')
require('map')

--require("buffer_line")
require('ntree')
require('test')
require('vue')
require('autocomplete')
require('tel')
require('lsp')
require('run')

require('pair_bracket')
require('pyrights')
require('debug')
require('sitter')
require('saga')
require('noicer')
require('inlay_hint')

require('null')
require("which_key")

--require("buffer_line")

require("buf")
--require("dad_bod")
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

