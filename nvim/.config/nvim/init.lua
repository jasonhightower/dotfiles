require("jasonh.set")
require("jasonh.remap")
require("jasonh.lazy_init")

vim.filetype.add({
    extension = {
        templ = 'templ'
    }
})

P = function(v)
    print(vim.inspect(v))
    return v
end

RELOAD = function(...)
    require('plenary.reload').reload_module(...)
end

R = function(name)
    RELOAD(name)
    return require(name)
end

--[[
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
]]--
