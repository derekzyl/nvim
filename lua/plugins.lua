
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

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

-- vim surround
use { "tpope/vim-surround", event = "BufReadPre" }
use 'wakatime/vim-wakatime'
  -- common
  use 'tpope/vim-fugitive' -- Git commands
  use 'vim-airline/vim-airline' -- powerline
  use 'vim-airline/vim-airline-themes'
  use 'rhysd/vim-grammarous' -- grammar check
  use 'andymass/vim-matchup' -- matching parens and more
  --use 'bronson/vim-trailing-whitespace' -- highlight trailing spaces
  use 'rhysd/git-messenger.vim'
  use 'marko-cerovac/material.nvim'
 -- require('material').set()
 --
 --
 --

 -- we want to try this ai tool
use    "Exafunction/codeium.nvim"
    
  use({
	"Pocco81/auto-save.nvim",
	config = function()
		 require("auto-save").setup {
			-- your config goes here
			-- or just leave it empty :)
		 }
	end,
})
-- plenary setup

use "nvim-lua/plenary.nvim"

  use { 'lewis6991/gitsigns.nvim', -- git added/removed in sidebar + inline blame
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup({
        current_line_blame = false
      })
    end
  }

  -- general dev
  

use {'williamboman/mason.nvim', opts={
  ensure_installed={"clangd", "rust_analyzer"}
}}
use 'williamboman/mason-lspconfig.nvim'
use {'neovim/nvim-lspconfig',


  wants = {
    
    "inlay-hints.nvim",
    
  },

  requires = {
    
    {
      "simrat39/inlay-hints.nvim",
      config = function()
        require("inlay-hints").setup()
      end,
    },
  
  },
}
--use 'kabouzeid/nvim-lspinstall'

   use({
    "glepnir/lspsaga.nvim",
    branch = "main",

    config = function()
        require("lspsaga").setup({})
    end,
    requires = {
        {"nvim-tree/nvim-web-devicons"},
        --Please make sure you install markdown and markdown_inline parser
        {"nvim-treesitter/nvim-treesitter"}
    }, 
})


-- Lualine information / Status bar
 use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
 }

--nvim lint
--
use 'mfussenegger/nvim-lint'

--lsp colors
use 'folke/lsp-colors.nvim'

--vim commentary
--
--
use { "tpope/vim-commentary", keys = { "gc", "/", "gbc", "gcc"}, disable = false }

-- dap
use 'mfussenegger/nvim-dap'
use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }


-- null-ls
use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
})



-- Hrsh7th Code Completion Suite
    use {'hrsh7th/nvim-cmp', }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'
    
use 'hrsh7th/vim-vsnip-integ'
  use {'L3MON4D3/LuaSnip',
	-- follow latest release.
	tag = "v<CurrentMajor>.*",
	-- install jsregexp (optional!:).
	run = "make install_jsregexp",
wants = { "friendly-snippets", "vim-snippets" },
    
        

} -- Snippets plugin
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
use "rafamadriz/friendly-snippets"

  use { 'nvim-treesitter/nvim-treesitter', 
  run = ':TSUpdate',
requires = {
        { "nvim-treesitter/nvim-treesitter-textobjects", event = "BufReadPre" },
        { "windwp/nvim-ts-autotag", event = "InsertEnter" },
        { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufReadPre" },
        { "p00f/nvim-ts-rainbow", event = "BufReadPre" },
        { "RRethy/nvim-treesitter-textsubjects", event = "BufReadPre" },
        -- { "nvim-treesitter/nvim-treesitter-context", event = "BufReadPre" },
        -- { "yioneko/nvim-yati", event = "BufReadPre" },
      },
}
  use 'scrooloose/nerdcommenter' -- commenting shortcuts

  require'nvim-treesitter.configs'.setup {
   highlight = {
    enable = true,
      disable = { "ruby" }
   },
   
  }

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
      }
  )

--  lsp init_l



  --require'lspsaga'.init_lsp_saga {
 --  error_sign = '!',
  --  warn_sign = '^',
   -- hint_sign = '?',
  -- infor_sign = '~',
  --u border_style = "round",
  -- code_action_prompt = {
      --enable = false }
 -- }

  -- search
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
  use 'tpope/vim-eunuch' -- wrappers UNIX command
  use 'tpope/vim-vinegar' -- file browser
  use 'kyazdani42/nvim-web-devicons' -- icons when searching

  -- testing
  use 'kassio/neoterm' -- terminal wrapper
  use 'janko-m/vim-test' -- testing commands

  --nvim-autopairs
use {
	"windwp/nvim-autopairs"}


-- nvim-tree
use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}

-- Dracula theme for styling
 use 'Mofiqul/dracula.nvim'

use ({ 'projekt0n/github-nvim-theme' })
--todo highlight
--
use {
  "folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
  config= function()
    require("todo-comments").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}


--vim-doge 
--
use {
 'kkoomen/vim-doge',
  run = ':call doge#install()'
}
use {
    "danymat/neogen",
    config = function()
        require('neogen').setup {
          enabled=true
        }
    end,
    requires = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    tag = "*"
}

use {
 "folke/trouble.nvim",
  requires = "nvim-tree/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}


use({
  "folke/noice.nvim",
  config = function()
    require("noice").setup({
    --    -- add any options here
    })
  end,
  requires = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
  --  -- OPTIONAL:
  --  --   `nvim-notify` is only needed, if you want to use the notification view.
  --  --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
})



use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}



-- Database
use {
  "tpope/vim-dadbod",
  opt = true,
  requires = {
    "kristijanhusak/vim-dadbod-ui",
    "kristijanhusak/vim-dadbod-completion",
  },
  config = function()
    require("config.dadbod").setup()
  end,
  cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
}

--neorg for file org

--use {
   -- "nvim-neorg/neorg",
   -- config = function()
       -- require('neorg').setup {
          --  load = {
              --  ["core.defaults"] = {}, -- Loads default behaviour
              --  ["core.concealer"] = {}, -- Adds pretty icons to your documents
            --    ["core.dirman"] = { -- Manages Neorg workspaces
                  --  config = {
                     --   workspaces = {
                       --     notes = "~/notes",
                      --  },
                  --  },
              --  },
          --  },
     --   }
 --   end,
  --  run = ":Neorg sync-parsers",
   -- requires = "nvim-lua/plenary.nvim",
--}



-- indentation 
--
use "lukas-reineke/indent-blankline.nvim"

-- bufferline setup 
use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
--use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

-- commenter
use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }



require('orgmode').setup_ts_grammar()

use {'nvim-orgmode/orgmode', config = function()
  require('orgmode').setup{}
end
}
  -- org mode 
  -- use {'nvim-orgmode/orgmode', config = function()
  -- require('orgmode').setup({
  -- org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
  -- org_default_notes_file = '~/Dropbox/org/refile.org',
-- })
-- -- end
-- } 

end )
