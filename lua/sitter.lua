require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  -- Include C/C++ and Rust for mobile devices (where LSPs aren't available)
  ensure_installed = {  "lua", "rust", 'python', 'typescript', 'c', 'cpp', 'cuda' },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

  },
}



