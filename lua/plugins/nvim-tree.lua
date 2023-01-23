return {
  "kyazdani42/nvim-tree.lua",
  requires = {
    "kyazdani42/nvim-web-devicons", -- optional, for file icons
  },
  tag = "nightly", -- optional, updated every week. (see issue #1193)
  keys = {
    { "<localleader>ff", "<cmd>NvimTreeToggle<cr>", desc = "Nvim-tree"},
  },
  config = {
    respect_buf_cwd = true,
    sync_root_with_cwd = true,
    update_cwd = false,
    sort_by = "case_sensitive",
    update_focused_file = {
        enable = true,
        update_root = true,
    },
    view = {
        adaptive_size = false,
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
}
}



