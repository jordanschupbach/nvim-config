return {
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  },
  {
      "nvim-zh/colorful-winsep.nvim",
      config = function ()
          require('colorful-winsep').setup()
      end
  },
--{ 'vigoux/ltex-ls.nvim',
--        dependencies = 'neovim/nvim-lspconfig',
--        config = function()
--            require 'ltex-ls'.setup {
--              -- on_attach = on_attach,
--              -- capabilities = capabilities,
--              use_spellfile = true,
--              filetypes = { "latex", "tex", "bib", "markdown", "gitcommit", "text" },
--              settings = {
--                ltex = {
--                  enabled = { "latex", "tex", "bib", "markdown", },
--                  language = "auto",
--                  diagnosticSeverity = "information",
--                  sentenceCacheSize = 2000,
--                  additionalRules = {
--                    enablePickyRules = true,
--                    motherTongue = "fr",
--                  },
--                  disabledRules = {
--                    fr = { "APOS_TYP", "FRENCH_WHITESPACE",},
--                    en_us = { "MORFOLOGIK_RULE_EN_US" }
--                  },
--                  dictionary = (function()
--                    -- For dictionary, search for files in the runtime to have
--                    -- and include them as externals the format for them is
--                    -- dict/{LANG}.txt
--                    --
--                    -- Also add dict/default.txt to all of them
--                    local files = {}
--                    for _, file in ipairs(vim.api.nvim_get_runtime_file("dict/*", true)) do
--                      local lang = vim.fn.fnamemodify(file, ":t:r")
--                      local fullpath = vim.fs.normalize(file, ":p")
--                      files[lang] = { ":" .. fullpath }
--                    end
--                    if files.default then
--                      for lang, _ in pairs(files) do
--                        if lang ~= "default" then
--                          vim.list_extend(files[lang], files.default)
--                        end
--                      end
--                      files.default = nil
--                    end
--                    return files
--                  end)(),
--                },
--              },
--            }
--
--
--
--
--
--        end
--    },
  -- {
  --   'code-biscuits/nvim-biscuits',
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --      run = ':TSUpdate'
  --   },
  --     config = function()
  --       require('nvim-biscuits').setup({})
  --     end
  -- },

    {"stevearc/aerial.nvim",
    config = function()
        require('aerial').setup({
          -- optionally use on_attach to set keymaps when aerial has attached to a buffer
          on_attach = function(bufnr)
            -- Jump forwards/backwards with '{' and '}'
            vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
            vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
          end
        })

        end
    },
  {
      "mcauley-penney/tidy.nvim",
      config = function()
          require("tidy").setup()
      end
  },

{'mfussenegger/nvim-lint',
        config = function()
            require('lint').linters_by_ft = {
              -- markdown = {'markdownlint',},
              lua = {'luacheck',}
            }
        end

    },

  {
    'sudormrfbin/cheatsheet.nvim',
    dependencies = {
      {'nvim-telescope/telescope.nvim'},
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    },
      config = function()
        require("cheatsheet").setup({
          -- Whether to show bundled cheatsheets

          -- For generic cheatsheets like default, unicode, nerd-fonts, etc
          -- bundled_cheatsheets = {
          --     enabled = {},
          --     disabled = {},
          -- },
          bundled_cheatsheets = true,

          -- For plugin specific cheatsheets
          -- bundled_plugin_cheatsheets = {
          --     enabled = {},
          --     disabled = {},
          -- }
          bundled_plugin_cheatsheets = true,

          -- For bundled plugin cheatsheets, do not show a sheet if you
          -- don't have the plugin installed (searches runtimepath for
          -- same directory name)
          include_only_installed_plugins = true,

          -- Key mappings bound inside the telescope window
          telescope_mappings = {
              ['<CR>'] = require('cheatsheet.telescope.actions').select_or_fill_commandline,
              ['<A-CR>'] = require('cheatsheet.telescope.actions').select_or_execute,
              ['<C-Y>'] = require('cheatsheet.telescope.actions').copy_cheat_value,
              ['<C-E>'] = require('cheatsheet.telescope.actions').edit_user_cheatsheet,
          }
        })
      end
  },


{'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require'treesitter-context'.setup{
          enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
          max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
          trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
          min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
          patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
              -- For all filetypes
              -- Note that setting an entry here replaces all other patterns for this entry.
              -- By setting the 'default' entry below, you can control which nodes you want to
              -- appear in the context window.
              default = {
                  'class',
                  'function',
                  'method',
                  'for',
                  'while',
                  'if',
                  'switch',
                  'case',
                  'interface',
                  'struct',
                  'enum',
              },
              -- Patterns for specific filetypes
              -- If a pattern is missing, *open a PR* so everyone can benefit.
              tex = {
                  'chapter',
                  'section',
                  'subsection',
                  'subsubsection',
              },
              haskell = {
                  'adt'
              },
              rust = {
                  'impl_item',

              },
              terraform = {
                  'block',
                  'object_elem',
                  'attribute',
              },
              scala = {
                  'object_definition',
              },
              vhdl = {
                  'process_statement',
                  'architecture_body',
                  'entity_declaration',
              },
              markdown = {
                  'section',
              },
              elixir = {
                  'anonymous_function',
                  'arguments',
                  'block',
                  'do_block',
                  'list',
                  'map',
                  'tuple',
                  'quoted_content',
              },
              json = {
                  'pair',
              },
              typescript = {
                  'export_statement',
              },
              yaml = {
                  'block_mapping_pair',
              },
          },
          exact_patterns = {
              -- Example for a specific filetype with Lua patterns
              -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
              -- exactly match "impl_item" only)
              -- rust = true,
          },

          -- [!] The options below are exposed but shouldn't require your attention,
          --     you can safely ignore them.

          zindex = 20, -- The Z-index of the context window
          mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
          -- Separator between context and content. Should be a single character string, like '-'.
          -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
          separator = nil,
      }
    end
  },


{
  'mvllow/modes.nvim',
  tag = 'v0.2.0',
  config = function()
    require('modes').setup()
  end
},
{
  'gorbit99/codewindow.nvim',
  config = function()
    local codewindow = require('codewindow')
    codewindow.setup()
    codewindow.apply_default_keybinds()
  end,
},


{
  'RRethy/nvim-treesitter-endwise',
    config = function()
      require('nvim-treesitter.configs').setup {
          endwise = {
              enable = true,
          },
      }
    end,
},

  {"sidebar-nvim/sidebar.nvim", -- BUG:
    config = function()
        local sidebar = require("sidebar-nvim")
        local opts = {open = false,
                      todos = { -- Seem to not be working.....
                          icon = "",
                          ignored_paths = {'~'}, -- ignore certain paths, this will prevent huge folders like $HOME to hog Neovim with TODO searching
                          initially_closed = false, -- whether the groups should be initially closed on start. You can manually open/close groups later.
                      }

      }
        sidebar.setup(opts)
    end
  },


{
  "luukvbaal/statuscol.nvim",
  config = function() require("statuscol").setup() end
},
{'rainbowhxch/beacon.nvim',
    config = function()
      require('beacon').setup({
        enable = true,
        size = 70,
        fade = true,
        minimal_jump = 10,
        show_jumps = true,
        focus_gained = false,
        shrink = true,
        timeout = 500,
        ignore_buffers = {},
        ignore_filetypes = {},
      })
    end,
},


{'feline-nvim/feline.nvim',
    config = function()
      require('feline').setup()
      require('feline').winbar.setup()
    end

  },



{"mrjones2014/nvim-ts-rainbow",
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = {
            -- ...
        },
        -- ...
        rainbow = {
          enable = true,
          -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
          -- colors = {}, -- table of hex strings
          -- termcolors = {} -- table of colour name strings
        }
      }
    end,
  },



  "p00f/clangd_extensions.nvim",
  "onsails/diaglist.nvim",
{"folke/trouble.nvim",
      config = function()
            require('trouble').setup(
{
    position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    icons = true, -- use devicons for filenames
    mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    fold_open = "", -- icon used for open folds
    fold_closed = "", -- icon used for closed folds
    group = true, -- group results by file
    padding = true, -- add an extra new line on top of the list
    action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" }, -- open buffer in new split
        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
        open_tab = { "<c-t>" }, -- open buffer in new tab
        jump_close = {"o"}, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small popup with the full multiline message
        preview = "p", -- preview the diagnostic location
        close_folds = {"zM", "zm"}, -- close all folds
        open_folds = {"zR", "zr"}, -- open all folds
        toggle_fold = {"zA", "za"}, -- toggle fold of current file
        previous = "k", -- previous item
        next = "j" -- next item
    },
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = false, -- automatically fold a file trouble list at creation
    auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result
    signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
    use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
})
      end



  },







  {"folke/todo-comments.nvim",
    config = function()
      require('todo-comments').setup()
    end,
  },

  "mtikekar/nvim-send-to-term", -- TODO: need to rebind and add again ()

  {"jose-elias-alvarez/null-ls.nvim", -- Formatting engine
    ft = {"lua", "r", "python", "markdown", "zig"},
    config = function()
        local null_ls = require('null-ls')
        require("null-ls").setup({
            sources = {
              -- null_ls.builtins.diagnostics.cspell,
              -- null_ls.builtins.code_actions.cspell,
                null_ls.builtins.diagnostics.chktex,
                null_ls.builtins.code_actions.gitsigns,
                null_ls.builtins.code_actions.ltrs,
                null_ls.builtins.code_actions.refactoring,
                null_ls.builtins.code_actions.shellcheck,
                null_ls.builtins.diagnostics.clang_check,
                null_ls.builtins.diagnostics.cmake_lint,
                -- null_ls.builtins.diagnostics.codespell,
                null_ls.builtins.diagnostics.commitlint,
                null_ls.builtins.diagnostics.cppcheck,
                null_ls.builtins.diagnostics.cpplint,
                -- null_ls.builtins.diagnostics.cspell,
                null_ls.builtins.diagnostics.editorconfig_checker,
                null_ls.builtins.diagnostics.flake8,
                -- null_ls.builtins.diagnostics.markdownlint,
                -- null_ls.builtins.diagnostics.markdownlint.with({
                --     method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
                -- }),
                -- null_ls.builtins.diagnostics.misspell,
                null_ls.builtins.diagnostics.mypy,
                -- null_ls.builtins.diagnostics.proselint,
                null_ls.builtins.diagnostics.pydocstyle,
                null_ls.builtins.diagnostics.pycodestyle,
                null_ls.builtins.diagnostics.rstcheck,
                null_ls.builtins.diagnostics.selene,
                null_ls.builtins.diagnostics.shellcheck,
                -- null_ls.builtins.diagnostics.vale,
                -- null_ls.builtins.diagnostics.vulture,
                null_ls.builtins.formatting.beautysh,
                null_ls.builtins.formatting.bibclean,
                null_ls.builtins.hover.dictionary,
                require("null-ls").builtins.formatting.stylua,
                -- require("null-ls").builtins.diagnostics.eslint,
                -- require("null-ls").builtins.completion.spell,
            },
        })
    end,
},

  'stevearc/dressing.nvim', -- UI hooks
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },

  {
    "brenoprata10/nvim-highlight-colors",
    dependencies = "nvim-lua/plenary.nvim",
  },

  'lewis6991/impatient.nvim', -- TODO: investigate if this is doing anything
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
    config = function()
    -- examples for your init.lua
    -- disable netrw at the very start of your init.lua (strongly advised)
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        -- set termguicolors to enable highlight groups
        vim.opt.termguicolors = true
        -- OR setup with some options
        require("nvim-tree").setup({
          sort_by = "case_sensitive",
          view = {
            adaptive_size = true,
            mappings = {
              list = {
                { key = "u", action = "dir_up" },
              },
            },
          },
          renderer = {
            group_empty = true,
          },
          filters = {
            dotfiles = true,
          },
        })
    end,
    tag = "nightly", -- optional, updated every week. (see issue #1193)
  },

  'RRethy/nvim-base16',

  "SirVer/ultisnips",

  "junegunn/fzf",
  "junegunn/fzf.vim",
  "ray-x/cmp-treesitter",


  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'lewis6991/gitsigns.nvim',

  'navarasu/onedark.nvim', -- Theme inspired by Atom
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which dependencies local dependencies to be built. Only load if `make` is available
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },

  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua

  {
      "folke/zen-mode.nvim",
      config = function()
        require("zen-mode").setup {
      }
    end
  },

  "folke/which-key.nvim",
  {'lukas-reineke/headlines.nvim',
    config = function()
      require('headlines').setup()
    end,
  },


  {'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end,
  },


  {'ggandor/leap-spooky.nvim',
        config = function()
            require('leap-spooky').setup {
              affixes = {
                -- These will generate mappings for all native text objects, like:
                -- (ir|ar|iR|aR|im|am|iM|aM){obj}.
                -- Special line objects will also be added, by repeating the affixes.
                -- E.g. `yrr<leap>` and `ymm<leap>` will yank a line in the current
                -- window.
                -- You can also use 'rest' & 'move' as mnemonics.
                remote   = { window = 'r', cross_window = 'R' },
                magnetic = { window = 'm', cross_window = 'M' },
              },
              -- If this option is set to true, the yanked text will automatically be pasted
              -- at the cursor position if the unnamed register is in use.
              paste_on_remote_yank = false,
            }
        end
},

  -- {'phaazon/hop.nvim',
  --   branch = 'v2',
  --   config = function()
  --     require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  --   end
  -- },
  {'m-demare/hlargs.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  },
  "ojroques/nvim-buildme",
  {"TimUntersberger/neogit",
    requires = "nvim-lua/plenary.nvim"
  },
{
  'lewis6991/satellite.nvim',
  config = function()
    require('satellite').setup()
  end
},


-- competitor to satellite
-- {"petertriho/nvim-scrollbar",
--     config = function()
--       require("scrollbar").setup()
--
--     end
--   },



  {"sindrets/diffview.nvim",
    requires = "nvim-lua/plenary.nvim"
  },

  {"nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim"
    }
  },

  "nvim-neotest/neotest-python",
  "nvim-neotest/neotest-plenary",
  "rouge8/neotest-rust",
  "shunsambongi/neotest-testthat",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "RRethy/nvim-treesitter-textsubjects",
  { "anuvyklack/windows.nvim",
     dependencies = {
        "anuvyklack/middleclass",
        "anuvyklack/animation.nvim"
     },
     config = function()
        vim.o.winwidth = 10
        vim.o.winminwidth = 10
        vim.o.equalalways = false
        require('windows').setup()
     end
  },

  "famiu/bufdelete.nvim",
  "monaqa/dial.nvim",

  "ziglang/zig.vim",-- zig
  "tmux-plugins/vim-tmux", -- tmux highlightings
  {
      "AckslD/nvim-neoclip.lua",
      dependencies = {
          { "kkharji/sqlite.lua", module = "sqlite" },
          { "nvim-telescope/telescope.nvim" },
      },
  },

  {"windwp/nvim-autopairs",
    config = function()
    require("nvim-autopairs").setup {}
    end,
  },
  {"weilbith/nvim-code-action-menu",
    cmd = 'CodeActionMenu',
  },
  {
  'kosayoda/nvim-lightbulb',
    dependencies = 'antoinemadec/FixCursorHold.nvim',
  },


--     use("ray-x/lsp_signature.nvim")

"hrsh7th/cmp-nvim-lsp",
"hrsh7th/cmp-nvim-lua",
"hrsh7th/cmp-buffer",
"hrsh7th/cmp-path",
"hrsh7th/cmp-cmdline",
"L3MON4D3/LuaSnip",
"saadparwaiz1/cmp_luasnip",
"onsails/lspkind-nvim",

{"lukas-reineke/virt-column.nvim",
    config = function()
      vim.g.virtcolumn_char = '▕' -- char to display the line
      vim.g.virtcolumn_priority = 10 -- priority of extmark
      require("virt-column").setup()
    end,
},


--     use("mfussenegger/nvim-jdtls") -- TODO: config me

  -- {"kylechui/nvim-surround", tag = "*" },

-- Process below...
------------------------
--
--     -- Common sense helpers
--
--     -- use("mzlogin/vim-markdown-toc")
--
--     -- TODO: put this into servers section
--     require("lspconfig").csharp_ls.setup({})
--     require("lspconfig").rust_analyzer.setup({})
--     require("lspconfig").r_language_server.setup({})
--
--     use({
--         "rmagatti/goto-preview",
--         config = function()
--             require("goto-preview").setup({})
--         end,
--     })
--     use("mfussenegger/nvim-dap") -- TODO: config me
--
--     -- -- Searching
--     use("junegunn/fzf")
--     use("junegunn/fzf.vim")
--
--     use("ray-x/cmp-treesitter")
--     -- -- use 'ray-x/navigator.lua'
--


  -- {{{ Unused but interesting
  --
  -- use("tpope/vim-repeat")
  -- use("notomo/lreload.nvim")
  -- use("nvim-lua/popup.nvim")
  --
  -- use {'edluffy/hologram.nvim'}
  -- require('hologram').setup{
  --     auto_display = true -- WIP automatic markdown image display, may be prone to breaking
  -- }
  --
  --
  -- TODO: eventually start using nvim-ide
  -- use {
  --     'ldelossa/nvim-ide'
  -- }
  --
  -- -- default components
  -- local bufferlist      = require('ide.components.bufferlist')
  -- local explorer        = require('ide.components.explorer')
  -- local outline         = require('ide.components.outline')
  -- local callhierarchy   = require('ide.components.callhierarchy')
  -- local timeline        = require('ide.components.timeline')
  -- local terminal        = require('ide.components.terminal')
  -- local terminalbrowser = require('ide.qqcomponents.terminal.terminalbrowser')
  -- local changes         = require('ide.components.changes')
  -- local commits         = require('ide.components.commits')
  -- local branches        = require('ide.components.branches')
  -- local bookmarks       = require('ide.components.bookmarks')
  --
  -- require('ide').setup({
  --     -- The global icon set to use.
  --     -- values: "nerd", "codicon", "default"
  --     icon_set = "default",
  --     -- Set the log level for nvim-ide's log. Log can be accessed with
  --     -- 'Workspace OpenLog'. Values are 'debug', 'warn', 'info', 'error'
  --     log_level = "info",
  --     -- Component specific configurations and default config overrides.
  --     components = {
  --         -- The global keymap is applied to all Components before construction.
  --         -- It allows common keymaps such as "hide" to be overridden, without having
  --         -- to make an override entry for all Components.
  --         --
  --         -- If a more specific keymap override is defined for a specific Component
  --         -- this takes precedence.
  --         global_keymaps = {
  --             -- example, change all Component's hide keymap to "h"
  --             -- hide = h
  --         },
  --         -- example, prefer "x" for hide only for Explorer component.
  --         -- Explorer = {
  --         --     keymaps = {
  --         --         hide = "x",
  --         --     }
  --         -- }
  --     },
  --     -- default panel groups to display on left and right.
  --     panels = {
  --         left = "explorer",
  --         right = "git"
  --     },
  --     -- panels defined by groups of components, user is free to redefine the defaults
  --     -- and/or add additional.
  --     panel_groups = {
  --         explorer = { outline.Name, bufferlist.Name, explorer.Name, bookmarks.Name, callhierarchy.Name, terminalbrowser.Name },
  --         terminal = { terminal.Name },
  --         git = { changes.Name, commits.Name, timeline.Name, branches.Name }
  --     },
  --     -- workspaces config
  --     workspaces = {
  --         -- which panels to open by default, one of: 'left', 'right', 'both', 'none'
  --         auto_open = 'left',
  --     },
  --     -- default panel sizes for the different positions
  --     panel_sizes = {
  --         left = 30,
  --         right = 30,
  --         bottom = 15
  --     }
  -- })
  --
  --
  --
  --
  -- {{{ Lua line
  --  return {
  --    'nvim-lualine/lualine.nvim', -- Fancier statusline
  --    config = function()
  --      local colors = {
  --          -- bg       = vim.g.terminal_color_8,
  --          bg = vim.g.terminal_color_0,
  --          light_bg = vim.g.terminal_color_15,
  --          -- fg       = '#202328',
  --          -- bg       = vim.g.terminal_color_8
  --          fg = "#bbc2cf",
  --          yellow = vim.g.terminal_color_3,
  --          cyan = vim.g.terminal_color_4,
  --          darkblue = vim.g.terminal_color_5,
  --          --darkblue = '#081633',
  --          green = vim.g.terminal_color_2,
  --          --green    = '#98be65',
  --          orange = "#FF8800",
  --          violet = "#a9a1e1",
  --          magenta = "#c678dd",
  --          blue = "#51afef",
  --          red = "#ec5f67",
  --      }
  --
  --      local conditions = {
  --          buffer_not_empty = function()
  --              return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  --          end,
  --          hide_in_width = function()
  --              return vim.fn.winwidth(0) > 80
  --          end,
  --          check_git_workspace = function()
  --              local filepath = vim.fn.expand("%:p:h")
  --              local gitdir = vim.fn.finddir(".git", filepath .. ";")
  --              return gitdir and #gitdir > 0 and #gitdir < #filepath
  --          end,
  --      }
  --
  --      -- Config
  --      local lualine_config = {
  --          options = {
  --              -- Disable sections and component separators
  --              component_separators = "",
  --              section_separators = "",
  --              theme = {
  --                  -- We are going to use lualine_c an lualine_x as left and
  --                  -- right section. Both are highlighted by c theme .  So we
  --                  -- are just setting default looks o statusline
  --                  normal = {
  --                      c = function()
  --                          if darkmode then
  --                              return { fg = colors.fg, bg = colors.bg }
  --                          else
  --                              return { fg = colors.bg, bg = colors.light_bg }
  --                          end
  --                      end,
  --                      padding = { right = 1 },
  --                  },
  --
  --                  -- { fg = colors.fg, bg = colors.bg } },
  --                  -- inactive = { c = { fg = colors.fg, bg = colors.bg } },
  --              },
  --          },
  --          sections = {
  --              -- these are to remove the defaults
  --              lualine_a = {},
  --              lualine_b = {},
  --              lualine_y = {},
  --              lualine_z = {},
  --              -- These will be filled later
  --              lualine_c = {},
  --              lualine_x = {},
  --          },
  --          inactive_sections = {
  --              -- these are to remove the defaults
  --              lualine_a = {},
  --              lualine_b = {},
  --              lualine_y = {},
  --              lualine_z = {},
  --              lualine_c = {},
  --              lualine_x = {},
  --          },
  --      }
  --
  --      -- Inserts a component in lualine_c at left section
  --      local function ins_left(component)
  --          table.insert(lualine_config.sections.lualine_c, component)
  --      end
  --
  --      -- Inserts a component in lualine_x ot right section
  --      local function ins_right(component)
  --          table.insert(lualine_config.sections.lualine_x, component)
  --      end
  --
  --      ins_left({
  --          function()
  --              return "▊"
  --          end,
  --          color = { fg = colors.blue }, -- Sets highlighting of component
  --          padding = { left = 0, right = 1 }, -- We don't need space before this
  --      })
  --
  --      ins_left({
  --          -- mode component
  --          function()
  --              return ""
  --          end,
  --          color = function()
  --              -- auto change color according to neovims mode
  --              local mode_color = {
  --                  n = colors.red,
  --                  i = colors.green,
  --                  v = colors.blue,
  --                  [""] = colors.blue,
  --                  V = colors.blue,
  --                  c = colors.magenta,
  --                  no = colors.red,
  --                  s = colors.orange,
  --                  S = colors.orange,
  --                  [""] = colors.orange,
  --                  ic = colors.yellow,
  --                  R = colors.violet,
  --                  Rv = colors.violet,
  --                  cv = colors.red,
  --                  ce = colors.red,
  --                  r = colors.cyan,
  --                  rm = colors.cyan,
  --                  ["r?"] = colors.cyan,
  --                  ["!"] = colors.red,
  --                  t = colors.red,
  --              }
  --              return { fg = mode_color[vim.fn.mode()] }
  --          end,
  --          padding = { right = 1 },
  --      })
  --
  --      ins_left({
  --          -- filesize component
  --          "filesize",
  --          cond = conditions.buffer_not_empty,
  --      })
  --
  --      ins_left({
  --          "filename",
  --          cond = conditions.buffer_not_empty,
  --          -- color = { fg = colors.magenta, gui = 'bold' },
  --      })
  --
  --      ins_left({ "location" })
  --
  --      ins_left({
  --          "progress",
  --          --color = { fg = colors.fg, gui = 'bold' }
  --      })
  --
  --      ins_left({
  --          "diagnostics",
  --          sources = { "nvim_diagnostic" },
  --          symbols = { error = " ", warn = " ", info = " " },
  --          diagnostics_color = {
  --              color_error = { fg = colors.red },
  --              color_warn = { fg = colors.yellow },
  --              color_info = { fg = colors.cyan },
  --          },
  --      })
  --
  --      -- Insert mid section. You can make any number of sections in neovim :)
  --      -- for lualine it's any number greater then 2
  --      ins_left({
  --          function()
  --              return "%="
  --          end,
  --      })
  --
  --      ins_left({
  --          -- Lsp server name .
  --          function()
  --              local msg = "No Active Lsp"
  --              local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
  --              local clients = vim.lsp.get_active_clients()
  --              if next(clients) == nil then
  --                  return msg
  --              end
  --              for _, client in ipairs(clients) do
  --                  local filetypes = client.config.filetypes
  --                  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
  --                      return client.name
  --                  end
  --              end
  --              return msg
  --          end,
  --          icon = " LSP:",
  --          -- color = { fg = '#ffffff', gui = 'bold' },
  --          color = {
  --              c = function()
  --                  if darkmode then
  --                      return { fg = colors.fg, bg = colors.bg, gui = "bold" }
  --                  else
  --                      return { fg = colors.bg, bg = colors.light_bg, gui = "bold" }
  --                  end
  --              end,
  --          },
  --      })
  --      require('lualine').setup(lualine_config)
  --    end,
  --  }
  --
  -- }}}
  --
  --
  -- }}} Unused but interesting

  -- Process below here...
  ------------------------------------




}
