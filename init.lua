--  TODO: add a header

-- Lazy bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- pre-lazy requires
require('options')
require('autocommands')
require('theme')

-- Setup plugins using lazy
require('lazy').setup('plugins')

require('mappings')

-- Setup lsp (after lazy)
require('lsp')

-- vim.cmd [[colorscheme onedark]] -- TODO: move me into post plugin require? (or add to base16 config?

-- vim: ts=2 sts=2 sw=2 et
