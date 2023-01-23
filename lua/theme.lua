
-- {{{ Setup theme
darkmode = false -- TODO: Load this from a cache

-- TODO: something funny about the global darkmode variable
-- local ui = require(".misenplace.ui")
--ui.toggle_darkmode()

local set_lightmode = function()
    vim.cmd([[colorscheme base16-one-light]])
end

local set_darkmode = function()
    vim.cmd([[colorscheme base16-kanagawa]])
end

-- Toggle darkmode
--- Sets LD_THEME environment variable, runs waldark and sets colorscheme
local toggle_darkmode = function()
    if darkmode then
        vim.fn.setenv("LD_THEME", "light")
        os.execute("export LD_THEME='light'")
        os.execute("waldark")
        darkmode = false
        set_lightmode()
        -- vim.cmd[[colorscheme base16-one-light]]
    else
        vim.fn.setenv("LD_THEME", "dark")
        os.execute("export LD_THEME='dark'")
        os.execute("waldark")
        darkmode = true
        set_darkmode()
        -- vim.cmd[[colorscheme base16-material]]
    end
end

vim.api.nvim_create_user_command("ToggleDarkMode", function()
    toggle_darkmode()
end, {
    desc = "Toggle Dark Mode",
})

-- toggle_darkmode()

-- }}} Setup theme
