-- Treesitter config
-- https://github.com/nvim-treesitter/nvim-treesitter
return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = function()
    pcall(require('nvim-treesitter.install').update { with_sync = true })
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    require('nvim-treesitter.configs').setup {
      -- Add languages to be installed here that you want installed for treesitter
      ensure_installed = {
        "bash",
        "bibtex",
        "c",
        "clojure",
        "cmake",
        "cpp",
        "css",
        "cuda",
        "dockerfile",
        "elixir",
        "html",
        "go",
        'help',
        "java",
        "javascript",
        "kotlin",
        "latex",
        "lua",
        "make",
        "markdown",
        "python",
        "r",
        "rust",
        "scheme",
        "toml",
        "typescript",
        "vim",
        "yaml",
        "zig",
      },

      sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
      auto_install = true, -- Automatically install missing parsers when entering buffer
      ignore_install = {}, -- List of parsers to ignore installing (for "all")
      highlight = { enable = true },
      indent = { enable = true, disable = { 'python' } },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<c-backspace>',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ['<C-j>'] = '@function.outer', -- was ]m
            ['<C-l>'] = '@class.outer', -- was ]]
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['<C-k>'] = '@function.outer',
            ['<C-h>'] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      },
    }
  end,
}
