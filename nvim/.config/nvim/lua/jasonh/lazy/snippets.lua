return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    -- build = "make install_jsregexp"
    config = function()
        local ls = require("luasnip")
        local types = require("luasnip.util.types")
        local ft_funcs = require("luasnip.extras.filetype_functions")

        ls.setup({
            update_events = "TextChanged,TextChangedI",

            delete_check_events = "TextChanged",
            ext_opts = {
                [types.choiceNode] = {
                    active = {
                        virt_text = { { "choiceNode", "Comment" } },
                    }
                }
            },
            ext_base_prio = 300,
            ext_prio_increase = 1,
            enable_autosnippets = true,
            store_selection_keys = "<Tab>",
            ft_func = ft_funcs.from_cursor
        })

        -- Expansion Key - will also jump to next item within snippet
        vim.keymap.set({'i', 's'}, "<C-k>", function()
            if ls.expand_or_jump() then
                ls.expand_or_jump()
            end
        end, { silent = true })

        -- Jump back key
        vim.keymap.set({'i', 's'}, "<C-j>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true })

        -- Cycle through list of options 
        vim.keymap.set('i', "<C-l>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end)

        vim.keymap.set('n', "<leader><leader>s", function()
            vim.cmd.Lazy("reload LuaSnip")
        end)

        local s, i, t = ls.s, ls.insert_node, ls.text_node
        local c, f = ls.choice_node, ls.function_node
        local fmt = require("luasnip.extras.fmt").fmt
        local rep = require("luasnip.extras").rep

        ls.add_snippets("all", {
            s("dt", f(function() return os.date("%A %B %d, %Y") end)),
        })
    end
}

--[[
# Tuesday November 12 2024

## Completed

## Progress Made

## Discussions

]]--
