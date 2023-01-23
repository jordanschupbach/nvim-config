std = "min"
files["config/nvim/**/*.lua"] = {
  read_globals = {
    vim = {
      fields = {
        api = {
          other_fields = true,
        },
        cmd = {
          read_only = true,
        },
        defer_fn = {
          read_only = true,
        },
        diagnostic = {
          other_fields = true,
        },
        fn = {
          other_fields = true,
        },
        g = {
          other_fields = true,
          read_only = false,
        },
        keymap = {
          other_fields = true,
        },
        lsp = {
          fields = {
            handlers = {
              other_fields = true,
              read_only = false,
            }
          },
          other_fields = true,
        },
        notify = {
          read_only = false,
        },
        o = {
          other_fields = true,
          read_only = false,
        },
        opt = {
          other_fields = true,
          read_only = false,
        },
      },
    },
  },
}



-- -- Rerun tests only if their modification time changed.
-- cache = true
--
-- ignore = {
--   "122", -- Setting a read-only field of a global variable.
--   "212", -- Unused argument, In the case of callback function, _arg_name is easier to understand than _, so this option is set to off.
--   "631", -- max_line_length, vscode pkg URL is too long
-- }
--
-- -- Global objects defined by the C code
-- read_globals = {
--   "vim",
-- }
