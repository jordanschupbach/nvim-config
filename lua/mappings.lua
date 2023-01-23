-- local hover = require(".my.lsp.hover")

local function mymap(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

mymap('n', '[d', ':lua vim.diagnostics.goto_prev()')
mymap('n', ']d', ':lua vim.diagnostics.goto_next()')
mymap('n', '<leader>e', ':lua vim.diagnostics.open_float()')
mymap('n', '<leader>q', ':lua vim.diagnostics.setloclist()')

mymap('n', '<localleader>uz', ":lua require('zen-mode').toggle({ window = { width = .85} })<cr>")

-- TODO: figure out why these remaps aren't working....
-- vim.api.nvim_set_keymap('n', "<C-o>", "<C-O>", { noremap = false, silent = true })
-- vim.api.nvim_set_keymap('n', "<C-i>", "<C-I>", { noremap = false, silent = true })

-- {{{ fix to use mymap
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- }}} fix to use mymap

-- {{{ Buffer bindings
mymap("n", "<localleader>bb", ":Telescope buffers theme=ivy<CR>")
mymap("n", "<localleader>bd", ":lua require('bufdelete').bufdelete(0)<CR>")
-- }}} Buffer bindings

-- {{{ Error Bindings
-- mymap("n", "<localleader>ej", ":lnext<CR>")
-- mymap("n", "<localleader>ek", ":lprevious<CR>")

mymap("n", "<localleader>ej", "lua require('trouble').next({skip_groups = true, jump = true})");
mymap("n", "<localleader>ek", "lua require('trouble').previous({skip_groups = true, jump = true})");
mymap("n", "<localleader>egg", "lua require('trouble').first({skip_groups = true, jump = true})");
mymap("n", "<localleader>eG", "lua require('trouble').last({skip_groups = true, jump = true})");


-- }}} Error Bindings

-- {{{ GoTo bindings
mymap("n", "gd", ':lua require("goto-preview").goto_preview_definition()<CR>')
mymap("n", "gt", ':lua require("goto-preview").goto_type_definition()<CR>')
mymap("n", "gt", ':lua require("goto-preview").goto_type_implementation()<CR>')
mymap("n", "<A-return>", ":SlimeSendCurrentLine<CR>")
mymap("v", "<A-return>", ":SlimeSend<CR>")
-- }}} GoTo bindings

-- {{{ Tabs
mymap("n", "<C-w>", ":BufferClose<CR>")
mymap("n", "<localleader><Tab>k", ":tabonly<CR>")
mymap("n", "<localleader><Tab>h", ":tabprevious<CR>")
mymap("n", "<localleader><Tab>l", ":tabnext<CR>")
mymap("n", "<localleader><Tab>L", ":tabmove<CR>")
-- mymap('n', '<localleader><Tab>H', ':BufferMove<CR>')
mymap("n", "<localleader><Tab>d", ":tabclose<CR>")
mymap("n", "<localleader><Tab>c", ":tabnew<CR>")
mymap("n", "<C-Tab>", ":tabnext<CR>")
mymap("n", "<A-S-Tab>", ":tabprevious<CR>")
mymap("n", "<A-Tab>", ":tabnext<CR>")
mymap("n", "<C-t>", ":tabnew<CR>")
mymap("n", "<C-Tab>", ":tabnext<CR>")
mymap("n", "<C-S-Tab>", ":tabprevious<CR>")
mymap("n", "<A-1>", ":tabn1<CR>")
mymap("n", "<A-2>", ":tabn2<CR>")
mymap("n", "<A-3>", ":tabn3<CR>")
mymap("n", "<A-4>", ":tabn4<CR>")
mymap("n", "<A-5>", ":tabn5<CR>")
mymap("n", "<A-6>", ":tabn6<CR>")
mymap("n", "<A-7>", ":tabn7<CR>")
mymap("n", "<A-8>", ":tabn8<CR>")
mymap("n", "<A-9>", ":tabn9<CR>")
-- }}} Tabs

-- {{{ Terminal
mymap("t", "<C-Tab>", ":tabnext<CR>")
mymap("t", "<C-S-Tab>", ":tabprevious<CR>")
mymap("t", "<leader><Esc>", "<C-\\><C-n>")
mymap("t", "<A-h>", "<C-\\><C-n><C-w>h")
mymap("t", "<A-j>", "<C-\\><C-n><C-w>j")
mymap("t", "<A-k>", "<C-\\><C-n><C-w>k")
mymap("t", "<A-l>", "<C-\\><C-n><C-w>l")
mymap("t", "<A-S-j>", "<C-\\><C-n>:resize -1<CR>i")
mymap("t", "<A-S-k>", "<C-\\><C-n>:resize +1<CR>i")
mymap("t", "<A-S-l>", "<C-\\><C-n>:vertical resize +1<CR>i")
mymap("t", "<A-S-h>", "<C-\\><C-n>:vertical resize -1<CR>i")
mymap("t", "<A-s>", "<C-\\><C-n><C-w>s")
mymap("t", "<A-v>", "<C-\\><C-n><C-w>v")
mymap("t", "<A-1>", ":tabn1<CR>")
mymap("t", "<A-2>", ":tabn2<CR>")
mymap("t", "<A-3>", ":tabn3<CR>")
mymap("t", "<A-4>", ":tabn4<CR>")
mymap("t", "<A-5>", ":tabn5<CR>")
mymap("t", "<A-6>", ":tabn6<CR>")
mymap("t", "<A-7>", ":tabn7<CR>")
mymap("t", "<A-8>", ":tabn8<CR>")
mymap("t", "<A-9>", ":tabn9<CR>")
-- }}} Terminal

-- {{{ UI bindings
mymap("n", "<C-=>", function()
    ResizeGuiFont(1) end
)
mymap("n", "<C-->", function()
    ResizeGuiFont(-1)
end)
mymap("n", "<localleader>uu", ":ToggleDarkMode<CR>")
mymap("n", "<localleader>ub", ":RandomBackground<CR>")
-- }}} UI bindings

-- {{{ Window bindings
mymap("n", "<A-l>", "<C-w>l")
mymap("n", "<A-j>", "<C-w>j")
mymap("n", "<A-k>", "<C-w>k")
mymap("n", "<A-h>", "<C-w>h")
mymap("n", "<A-s>", "<C-w>s")
mymap("n", "<A-v>", "<C-w>v")
mymap("n", "<A-d>", "<C-w>q")
mymap("n", "<A-S-j>", ":resize -1<CR>")
mymap("n", "<A-S-k>", ":resize +1<CR>")
mymap("n", "<A-S-l>", ":vertical resize +1<CR>")
mymap("n", "<A-S-h>", ":vertical resize -1<CR>")
-- }}} Window bindings


-- Move these below...

-- {{{ Debugger
mymap("n", "<localleader>dd",  ":lua require'dap-go'.debug_test()<CR>") -- Make this filetype dependent
mymap("n", "<localleader>db",  ":lua require'dap'.toggle_breakpoint()<CR>")
mymap("n", "<localleader>dB",  ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
mymap("n", "<localleader>dlp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log opint message: '))<CR>")
mymap("n", "<localleader>dd",  ":lua require'dap'.continue()<CR>")
mymap("n", "<localleader>do",  ":lua require'dap'.step_over()<CR>")
mymap("n", "<localleader>di",  ":lua require'dap'.step_into()<CR>")
mymap("n", "<localleader>dO",  ":lua require'dap'.step_out()<CR>")
mymap("n", "<localleader>dr",  ":lua require'dap'.repl.open()<CR>")
mymap("n", "<localleader>dm",  ":lua require'jdtls.dap'.setup_dap_main_class_configs()<CR>")
-- }}} Debugger

-- {{{ Todo
mymap("n", "<localleader>TT", ":TodoTrouble<CR>")
--  }}}

-- {{{ Snippets
mymap("n", "<localleader>yy", ":Telescope ultisnips theme=ivy<CR>")
-- }}} Snippets

-- {{{ Telescope
mymap("n", "<localleader>pf", ":Telescope fd theme=ivy<CR>")
mymap("n", "<localleader>po", ":Telescope project theme=ivy<CR>")
mymap("n", "<localleader>pr", ":Telescope live_grep theme=ivy<CR>")
mymap("n", "/", ":Telescope current_buffer_fuzzy_find theme=ivy<CR>")
mymap("n", "<A-x>", ":Telescope builtin theme=ivy<CR>")
mymap("i", "<A-x>", ":Telescope builtin theme=ivy<CR>")
mymap("n", "<C-p>", ":Telescope <CR>")
mymap("n", "<localleader><CR>", ":terminal<CR>")
-- }}} Telescope

-- {{{ Commenting
mymap("v", "<localleader>cc", ":CommentToggle<CR>")
mymap("n", "<localleader>cc", ":CommentToggle<CR>")

mymap("v", "<C-c><C-c>", ":CommentToggle<CR>")
mymap("n", "<C-c><C-c>", ":CommentToggle<CR>")


-- }}} Commenting

-- {{{ Error bindings
mymap("n", "<localleader>ee", ":TroubleToggle<CR>")
mymap("n", "<localleader>eb", ":Trouble document_diagnostics<CR>")
mymap("n", "<localleader>ep", ":Trouble workspace_diagnostics<CR>")
mymap("n", "<localleader>ef", ":CodeActionMenu<CR>")

-- Use diaglist???
mymap( "n", "<localleader>ea", ":lua require('diaglist').open_all_diagnostics()<CR>")


-- -- nmap <space>dw <cmd>lua require('diaglist').open_all_diagnostics()<cr>
-- -- nmap <space>d0 <cmd>lua require('diaglist').open_buffer_diagnostics()<cr>
--

-- }}} Error bindings

-- {{{ Jump bindings
mymap("n", "<localleader>jj", ":HopChar2<CR>")


-- jump bindings
mymap("n", "<localleader>jd", ":Telescope lsp_definitions<CR>")
-- mymap("n", "<localleader>jj", ':lua require("goto-preview").goto_preview_definition()<CR>')

-- mymap("n", "<C-h>", ":lua vim.lsp.buf.hover()<CR>")

-- mymap("n", "<localleader>k", ":lua hover.hover()<CR>")

mymap(
    "n",
    "<localleader>jq",
    ':lua require("goto-preview").close_all_win()<CR>'
)
mymap(
    "n",
    "<localleader>jt",
    ':lua require("goto-preview").goto_preview_type_definition()<CR>'
)
mymap(
    "n",
    "<localleader>ji",
    ':lua require("goto-preview").goto_preview_implementation()<CR>'
)
mymap(
    "n",
    "<localleader>jr",
    ':lua require("goto-preview").goto_preview_references()<CR>'
)




-- }}} Jump bindings

-- {{{ Test bindings
mymap("n", "<localleader>tt", ":lua require('neotest').run.run()<CR>")
mymap("n", "<localleader>tb", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>")
mymap("n", "<localleader>tf", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>")
mymap("n", "<localleader>ts", ":lua require('neotest').summary.toggle()<CR>")
mymap("n", "<localleader>to", ":lua require('neotest').output_panel.toggle()<CR>")
-- --   nnoremap <silent>[n <cmd>lua require("neotest").jump.prev({ status = "failed" })<CR>
-- --   nnoremap <silent>]n <cmd>lua require("neotest").jump.next({ status = "failed" })<CR>


-- }}} Test bindings

-- {{{ Java dev bindings
-- -- jdtls test bindings...?
-- -- mymap("n", "<localleader>Tc", ":lua require'jdtls'.test_class()<CR>")
-- -- mymap("n", "<localleader>Tm", ":lua require'jdtls'.test_nearest_method()<CR>")
-- }}} Java dev bindings

-- {{{ Git bindings
-- Git bindings
-- mymap('n', '<localleader>gg', ':Magit<CR>')
mymap(
    "n",
    "<localleader>gg",
    ':lua require("neogit").open({ kind = "vsplit" })<CR>'
)
mymap("n", "<localleader>gj", ":VGit hunk_down <CR>")
mymap("n", "<localleader>gk", ":VGit hunk_up <CR>")

mymap(
    "n",
    "<localleader>gj",
    ':lua require("gitsigns.actions").next_hunk()<CR>'
)
mymap(
    "n",
    "<localleader>gk",
    ':lua require("gitsigns.actions").prev_hunk()<CR>'
)
mymap(
    "n",
    "<localleader>gs",
    ':lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>'
)
-- mymap('n', '<localleader>gs', 'lua require"gitsigns".stage_hunk()<CR>')

-- 		['x <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
-- 		['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',

-- mymap('n', '<localleader>gs', ':VGit buffer_hunk_stage <CR>')

-- mymap('n', '<localleader>gc', ':lua require("neogit").open({ "commit" })<CR>')

-- open using defaults
-- neogit.open()

-- open commit popup
-- neogit.open({ "commit" })

-- open with split kind
-- neogit.open({ kind = "split" })

-- open home directory
-- neogit.open({ cwd = "~" })

mymap("n", "<localleader>gb", ":Telescope git_branches theme=ivy<CR>")
mymap("n", "<localleader>gc", ":Telescope git_commits theme=ivy<CR>")

-- nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
-- nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
-- " Only set if you have telescope installed
-- nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>
--

-- mymap('n', '<localleader>gs', ':Telescope git_status theme=ivy<CR>')
mymap("n", "<localleader>gf", ":Telescope git_files theme=ivy<CR>")




-- }}}

-- {{{ Help bindings
mymap("n", "<localleader>hk", ":Telescope keymaps theme=ivy<CR>")
-- }}} Help bindings

-- {{{ Todo
mymap("n", "<localleader>TT", ":TodoTrouble<CR>")
-- }}} Todo

-- {{{ Project bindings
-- mymap("n", "<C-k>", ":BuildMe<CR>")
mymap("n", "<localleader>pf", ":Telescope fd theme=ivy<CR>")
mymap("n", "<localleader>po", ":Telescope project theme=ivy<CR>")
mymap("n", "<localleader>pr", ":Telescope live_grep theme=ivy<CR>")
mymap("n", "<localleader>ps", ":split<CR>:terminal<CR>")
--  mymap("n", "<C-k>", ":BuildMe<CR>")

-- }}} Project bindings

-- {{{ language bindings?
mymap("n", "<localleader>ll", ":AerialToggle<CR>")
-- }}} language bindings?

-- {{{ Rust bindings
mymap("n", "<localleader>rr", ":RustRunnables<CR>")
-- }}} Rust bindings

-- {{{ Window bindings
mymap("n", "<localleader>ww", ":WindowsMaximize<CR>")
-- }}} Window bindings


-- TODO: find a home for this
-- -- Return to last edit position when opening files
-- vim.cmd([[
-- augroup augroup_all_files_vimscript
--   autocmd!
--   autocmd BufReadPost *
--       \ if line("'\"") > 0 && line("'\"") <= line("$") |
--       \   exe "normal! g`\"" |
--       \ endif
-- augroup END
-- ]])
