-- ===========================================
-- 📱 MOBILE TERMUX PLUGIN CONFIGURATIONS 📱
-- ===========================================

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

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- ===========================================
  -- MOBILE-OPTIMIZED CORE PLUGINS
  -- ===========================================

  -- Essential utilities
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  -- ===========================================
  -- MOBILE-OPTIMIZED ESSENTIAL PLUGINS
  -- ===========================================

  -- Vim surround (mobile-optimized)
  use { 
    "tpope/vim-surround", 
    event = "BufReadPre",
    config = function()
      -- Mobile-optimized surround settings
      vim.g.surround_no_mappings = 0
    end
  }

  -- Git integration (mobile-optimized)
  use { 
    'tpope/vim-fugitive',
    config = function()
      -- Mobile-optimized git settings
      vim.g.fugitive_no_maps = 0
    end
  }

  -- Wakatime (mobile-optimized)
 use 'wakatime/vim-wakatime'


  -- ===========================================
  -- MOBILE FILE NAVIGATION
  -- ===========================================

  -- File tree (mobile-optimized)
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup({
        view = {
          width = 30,              -- Reduced width for mobile
          side = 'left',
          preserve_window_proportions = false,
          number = false,
          relativenumber = false,
          signcolumn = 'no',
        },
        renderer = {
          icons = {
            show = {
              file = false,        -- Hide file icons for performance
              folder = false,      -- Hide folder icons for performance
              git = true,          -- Keep git icons
            },
            glyphs = {
              default = '📄',
              symlink = '🔗',
              folder = {
                arrow_closed = '▶',
                arrow_open = '▼',
                default = '📁',
                open = '📂',
                empty = '📁',
                empty_open = '📂',
                symlink = '🔗',
                symlink_open = '🔗',
              },
            },
          },
          indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
              corner = '└',
              edge = '│',
              item = '│',
              bottom = '─',
              none = ' ',
            },
          },
        },
        actions = {
          open_file = {
            resize_window = true,
            window_picker = {
              enable = true,
            },
          },
        },
        filters = {
          dotfiles = false,
          custom = {},
        },
        git = {
          enable = true,
          ignore = false,
          show_on_dirs = true,
          show_on_open_dirs = true,
          timeout = 400,
        },
      })
    end
  }

  -- File finder (mobile-optimized)
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
    },
    config = function()
      require('telescope').setup({
        defaults = {
          layout_config = {
            width = 0.9,           -- Use more screen width
            height = 0.8,          -- Use more screen height
            prompt_position = 'top',
          },
          prompt_prefix = "🔍 ",
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
        pickers = {
          find_files = {
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })
    end
  }

  -- ===========================================
  -- MOBILE LSP AND COMPLETION
  -- ===========================================

  -- LSP configuration
  use {
    'neovim/nvim-lspconfig',
    config = function()
      -- Mobile-optimized LSP settings
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          virtual_text = false,  -- Disable virtual text for performance
          signs = true,
          underline = true,
          update_in_insert = false,
        }
      )
    end
  }

  -- Mason for LSP management (supports all languages)
  use {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({
        ui = {
          border = 'rounded',
          icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗'
          }
        },
        -- Ensure all language servers are available
        ensure_installed = {
          -- Core languages
          'lua-language-server',
          'pyright',
          'typescript-language-server',
          'javascript-language-server',
          'html-lsp',
          'css-lsp',
          'json-lsp',
          'yaml-language-server',
          'markdown-language-server',
          
          -- Additional languages
          'ruby-lsp',
          'gopls',
          'rust-analyzer',
          'jdtls',
          'clangd',
          'phpactor',
          'sqls',
          'dockerfile-language-server',
          'cmake-language-server',
          'vim-language-server',
          'bash-language-server',
          'powershell-editor-services',
          'zls',
          'nimlsp',
          'dart',
          'kotlin-language-server',
          'metals',
          'haskell-language-server',
          'ocaml-lsp',
          'fsautocomplete',
          'clojure-lsp',
          'elixir-ls',
          'erlang-ls',
          'perlnavigator',
          'r-lsp',
          'julia-lsp',
          'racket-langserver',
          'ada-language-server',
          'fortls',
          'cobol-language-support',
          'pascal-language-server',
          'verible',
          'vhdl-tool',
          'systemverilog',
          'tcl-lsp',
          'awk-language-server',
          'fish-lsp',
          'zsh-language-server',
          'terraform-ls',
          'nixd',
          'protolint',
          'pug-lsp',
          'rst-language-server',
          'solidity-ls',
          'svelte-language-server',
          'astro-language-server',
          'vue-language-server',
          'angular-language-service',
          'ember-language-server',
          'elm-language-server',
          'reason-language-server',
          'rescript-lsp',
          'gleam',
          'nickel-lang-lsp',
          'taplo',
          'wgsl-analyzer',
          'wgsl-analyzer',
          'wgsl-analyzer',
        }
      })
    end
  }

  use 'williamboman/mason-lspconfig.nvim'

  -- Null-ls for formatting and linting
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup({
        sources = {
          -- Formatting
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.formatting.rustfmt,
          null_ls.builtins.formatting.gofmt,
          null_ls.builtins.formatting.clang_format,
          
          -- Linting
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.diagnostics.flake8,
          null_ls.builtins.diagnostics.shellcheck,
          null_ls.builtins.diagnostics.rubocop,
          null_ls.builtins.diagnostics.golangci_lint,
          
          -- Code actions
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.code_actions.eslint_d,
        },
        -- Mobile-optimized settings
        debug = false,
        update_in_insert = false,
        on_attach = function(client, bufnr)
          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end,
      })
    end
  }

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
          { name = 'path' },
        }),
        experimental = {
          ghost_text = false,  -- Disable for mobile performance
        },
      })
    end
  }

  -- ===========================================
  -- MOBILE UI ENHANCEMENTS
  -- ===========================================

  -- Status line (mobile-optimized)
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
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
          lualine_b = {'branch', 'diff'},
          lualine_c = {'filename'},
          lualine_x = {'filetype'},
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
  }

  -- Buffer line (mobile-optimized)
  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup({
        options = {
          mode = 'buffers',
          themable = true,
          numbers = 'none',
          close_command = 'bdelete! %d',
          right_mouse_command = 'bdelete! %d',
          left_mouse_command = 'buffer %d',
          middle_mouse_command = nil,
          indicator = {
            icon = '▎',
            style = 'icon',
          },
          buffer_close_icon = '󰅖',
          modified_icon = '●',
          close_icon = '󰅖',
          left_trunc_marker = '󰅖',
          right_trunc_marker = '󰅖',
          max_name_length = 18,
          max_prefix_length = 15,
          tab_size = 18,
          diagnostics = 'nvim_lsp',
          diagnostics_update_in_insert = false,
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "(" .. count .. ")"
          end,
          offsets = {
            {
              filetype = 'NvimTree',
              text = 'File Explorer',
              text_align = 'left',
              separator = true
            }
          },
          color_icons = true,
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          persist_buffer_sort = true,
          separator_style = 'thin',
          enforce_regular_tabs = false,
          always_show_bufferline = true,
          hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
          },
          sort_by = 'insert_after_current',
        }
      })
    end
  }

  -- ===========================================
  -- MOBILE SYNTAX AND HIGHLIGHTING
  -- ===========================================

  -- Treesitter (mobile-optimized but supports all languages)
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        -- Install parsers on-demand when opening files
        auto_install = true,
        ensure_installed = {
          -- Only install essential parsers by default
          'lua',
          'vim',
          'vimdoc',
          'query',
        },
        highlight = {
          enable = true,
          -- Support all languages - no restrictions for mobile
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
          },
        },
      })
    end
  }

  -- Treesitter autotag (mobile-optimized)
  use {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    config = function()
      require('nvim-ts-autotag').setup({
        -- Mobile-optimized autotag settings
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = {
          'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript', 'xml', 'php', 'markdown', 'astro', 'glimmer', 'handlebars', 'hbs'
        }
      })
    end
  }

  -- ===========================================
  -- MOBILE COMMENTING
  -- ===========================================

  -- Comment plugin
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        padding = true,
        sticky = true,
        ignore = '^$',
        toggler = {
          line = '<leader>/',
          block = '<leader>b/',
        },
        opleader = {
          line = '<leader>/',
          block = '<leader>b/',
        },
        extra = {
          above = '<leader>/O',
          below = '<leader>/o',
          eol = '<leader>/A',
        },
        mappings = {
          basic = true,
          extra = true,
        },
        pre_hook = nil,
        post_hook = nil,
      })
    end
  }

  -- ===========================================
  -- MOBILE GIT INTEGRATION
  -- ===========================================

  -- Git signs
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup({
        current_line_blame = false,  -- Disable for mobile performance
        signcolumn = false,          -- Hide for mobile space
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = {
          interval = 1000,
          follow_files = true
        },
        attach_to_untracked = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol',
          delay = 1000,
          ignore_whitespace = false,
        },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        max_file_length = 40000,
        preview_config = {
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          -- Actions
          map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
          map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
          map('n', '<leader>hS', gs.stage_buffer)
          map('n', '<leader>hu', gs.undo_stage_hunk)
          map('n', '<leader>hR', gs.reset_buffer)
          map('n', '<leader>hp', gs.preview_hunk)
          map('n', '<leader>hb', function() gs.blame_line{full=true} end)
          map('n', '<leader>tb', gs.toggle_current_line_blame)
          map('n', '<leader>hd', gs.diffthis)
          map('n', '<leader>hD', function() gs.diffthis('~') end)
          map('n', '<leader>td', gs.toggle_deleted)

          -- Text object
          map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      })
    end
  }

  -- ===========================================
  -- MOBILE THEMES
  -- ===========================================

  -- Mobile-friendly themes
  use {
    'folke/tokyonight.nvim',
    config = function()
      require('tokyonight').setup({
        style = 'night',
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          functions = {},
          variables = {},
        },
        sidebars = { 'qf', 'help', 'NvimTree' },
        day_brightness = 0.3,
        hide_inactive_statusline = false,
        dim_inactive = false,
        lualine_bold = false,
      })
    end
  }

  use {
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function()
      require('catppuccin').setup({
        flavour = 'mocha',
        background = {
          light = 'latte',
          dark = 'mocha',
        },
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = true,
        dim_inactive = {
          enabled = false,
          shade = 'dark',
          percentage = 0.15,
        },
        no_italic = true,  -- Disable italics for mobile readability
        no_bold = false,
        no_underline = false,
        styles = {
          comments = {},
          conditionals = {},
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          notify = false,
          mini = false,
        },
      })
    end
  }

  -- ===========================================
  -- MOBILE UTILITIES
  -- ===========================================

  -- Auto pairs
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({
        check_ts = true,
        ts_config = {
          lua = {'string', 'source'},
          javascript = {'string', 'template_string'},
          java = false,
        },
        disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
        fast_wrap = {
          map = '<M-e>',
          chars = { '{', '[', '(', '"', "'" },
          pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
          offset = 0,
          end_key = '$',
          keys = 'qwertyuiopzxcvbnmasdfghjkl',
          check_comma = true,
          highlight = 'PmenuSel',
          highlight_grey = 'LineNr'
        },
      })
    end
  }

  -- Which key
  use {
    'folke/which-key.nvim',
    config = function()
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
  }

  -- ===========================================
  -- MOBILE DEBUGGING
  -- ===========================================

  -- Debug adapter protocol
  use {
    'mfussenegger/nvim-dap',
    config = function()
      -- Mobile-optimized DAP configuration
      local dap = require('dap')
      
      -- Python debugging
      dap.adapters.python = {
        type = 'executable',
        command = 'python',
        args = { '-m', 'debugpy.adapter' },
      }
      
      dap.configurations.python = {
        {
          type = 'python',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          console = 'integratedTerminal',
        },
      }
    end
  }

  use {
    'rcarriga/nvim-dap-ui',
    requires = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    after = 'nvim-dap',
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')
      
      dapui.setup({
        icons = { expanded = '▾', collapsed = '▸', current_frame = '▸' },
        mappings = {
          expand = { '<CR>', '<2-LeftMouse>' },
          open = 'o',
          remove = 'd',
          edit = 'e',
          repl = 'r',
          toggle = 't',
        },
        expand_lines = false,  -- Disable for mobile space
        layouts = {
          {
            elements = {
              { id = 'scopes', size = 0.25 },
              { id = 'breakpoints', size = 0.25 },
              { id = 'stacks', size = 0.25 },
              { id = 'watches', size = 0.25 },
            },
            size = 40,
            position = 'left',
          },
          {
            elements = {
              { id = 'repl', size = 0.5 },
              { id = 'console', size = 0.5 },
            },
            size = 10,
            position = 'bottom',
          },
        },
        controls = {
          enabled = true,
          element = 'repl',
          icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = '⏪',
            run_last = '⏯',
            terminate = '⏹',
          },
        },
        floating = {
          max_height = nil,
          max_width = nil,
          border = 'single',
          mappings = {
            close = { 'q', '<Esc>' },
          },
        },
        windows = { indent = 1 },
        render = {
          max_type_length = nil,
          max_value_lines = 100,
        },
      })
      
      -- Auto open/close dapui with proper error handling
      vim.defer_fn(function()
        if dap and dap.listeners then
          dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close()
          end
        end
      end, 1000)
    end
  }

  -- ===========================================
  -- MOBILE UI ENHANCEMENTS
  -- ===========================================

  -- Noice for enhanced UI (mobile-optimized)
  use {
    'folke/noice.nvim',
    event = 'VimEnter',
    requires = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      require('noice').setup({
        lsp = {
          -- Override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
          },
        },
        -- You can add a custom command or keymap to open the messages popup
        presets = {
          bottom_search = true, -- Use a classic bottom cmdline for search
          command_palette = true, -- Position the cmdline and popupmenu together
          long_message_to_split = true, -- Long messages will be sent to a split
          inc_rename = false, -- Enable an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- Disable the popup border for lsp docs
        },
        -- Mobile-optimized settings
        views = {
          cmdline_popup = {
            position = {
              row = 5,
              col = '50%',
            },
            size = {
              width = 60,
              height = 'auto',
            },
          },
          popupmenu = {
            relative = 'editor',
            position = {
              row = 8,
              col = '50%',
            },
            size = {
              width = 60,
              height = 10,
            },
            border = {
              style = 'rounded',
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = { Normal = 'Normal', FloatBorder = 'DiagnosticInfo' },
            },
          },
        },
        routes = {
          {
            filter = {
              event = 'msg_show',
              kind = '',
              find = 'written',
            },
            opts = { skip = true },
          },
        },
      })
    end
  }

  -- ===========================================
  -- MOBILE TROUBLESHOOTING
  -- ===========================================

  -- Trouble for diagnostics
  use {
    'folke/trouble.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('trouble').setup({
        position = 'bottom',
        height = 10,
        width = 50,
        icons = true,
        mode = 'workspace_diagnostics',
        fold_open = '',
        fold_closed = '',
        group = true,
        padding = true,
        action_keys = {
          close = 'q',
          cancel = '<esc>',
          refresh = 'r',
          jump = { '<cr>', '<tab>' },
          open_split = { '<c-x>' },
          open_vsplit = { '<c-v>' },
          open_tab = { '<c-t>' },
          jump_close = { 'o' },
          toggle_mode = 'm',
          toggle_preview = 'P',
          hover = 'K',
          preview = 'p',
          close_folds = { 'zM', 'zm' },
          open_folds = { 'zR', 'zr' },
          toggle_fold = { 'zA', 'za' },
          previous = 'k',
          next = 'j'
        },
        indent_lines = true,
        auto_open = false,
        auto_close = false,
        auto_preview = true,
        auto_fold = false,
        auto_jump = { 'lsp_definitions' },
        signs = {
          error = '󰅚',
          warning = '󰀪',
          hint = '󰌶',
          information = '󰋽',
          other = '󰗠'
        },
        use_diagnostic_signs = false
      })
    end
  }

  -- ===========================================
  -- MOBILE AI ASSISTANCE
  -- ===========================================

  -- Codeium for AI assistance (mobile-optimized)
  use { 
    'Exafunction/codeium.vim',
    config = function()
      -- Mobile-optimized Codeium settings
      vim.g.codeium_disable_bindings = 1
      vim.g.codeium_no_map_tab = 1
      vim.g.codeium_enabled = 0  -- Disable by default to prevent errors
      
      -- Set up keymaps
      vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
      vim.keymap.set('i', '<C-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
      vim.keymap.set('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
      vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
      
      -- Manual setup command
      vim.api.nvim_create_user_command('CodeiumSetup', function()
        vim.g.codeium_enabled = 1
        vim.cmd('Codeium')
        print('Codeium: Enabled. Run :Codeium Auth to authenticate.')
      end, { desc = 'Enable and setup Codeium' })
    end
  }

  -- ===========================================
  -- MOBILE PERFORMANCE OPTIMIZATIONS
  -- ===========================================

  -- Auto-save for mobile
  use {
    'Pocco81/auto-save.nvim',
    config = function()
      require('auto-save').setup({
        enabled = true,
        execution_message = {
          message = function()
            return '📱 Auto-saved at ' .. vim.fn.strftime('%H:%M:%S')
          end,
          dim = 0.18,
          cleaning_interval = 1250,
        },
        trigger_events = { 'InsertLeave', 'TextChanged' },
        condition = function(buf)
          local fn = vim.fn
          local utils = require('auto-save.utils.data')
          
          if fn.getbufvar(buf, '&modifiable') == 1 and
             utils.not_in(fn.getbufvar(buf, '&filetype'), {}) then
            return true
          end
          return false
        end,
        write_all_buffers = false,
        debounce_delay = 135,
        callbacks = {
          enabling = nil,
          disabling = nil,
          before_asserting_save = nil,
          before_saving = nil,
          after_saving = nil
        }
      })
    end
  }

  -- ===========================================
  -- BOOTSTRAP PACKER
  -- ===========================================

  if packer_bootstrap then
    require('packer').sync()
  end
end)
