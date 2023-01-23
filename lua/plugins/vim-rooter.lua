return {
  "airblade/vim-rooter",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.rooter_patterns = {'.git', 'Makefile', '*.sln', 'build/env.sh'}
    -- require('vim-rooter').setup()
  end
}
