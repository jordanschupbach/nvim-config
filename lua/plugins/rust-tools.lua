return {
 'simrat39/rust-tools.nvim',
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  ft = {
    "rust",
  },
  config = function()
    require('rust-tools').setup({
      server = {
        on_attach = function(_, bufnr)
          -- Hover actions
          vim.keymap.set("n", "<C-space>", require'rust-tools'.hover_actions.hover_actions, { buffer = bufnr })
          -- Code action groups
          vim.keymap.set("n", "<Leader>a", require'rust-tools'.code_action_group.code_action_group, { buffer = bufnr })
        end,
      },})
  end}



-- use 'simrat39/rust-tools.nvim'
-- require'rust-tools'.setup({
--   server = {
--     on_attach = function(_, bufnr)
--       -- Hover actions
--       vim.keymap.set("n", "<C-space>", require'rust-tools'.hover_actions.hover_actions, { buffer = bufnr })
--       -- Code action groups
--       vim.keymap.set("n", "<Leader>a", require'rust-tools'.code_action_group.code_action_group, { buffer = bufnr })
--     end,
--   },
-- })
