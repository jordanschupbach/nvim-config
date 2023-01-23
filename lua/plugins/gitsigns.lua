return {
 'lewis6991/gitsigns.nvim',
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  config = function()
    require('gitsigns').setup {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      }}
  end}
