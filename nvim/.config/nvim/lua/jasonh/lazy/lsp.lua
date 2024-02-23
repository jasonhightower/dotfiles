return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },
    config = function()
        require("fidget").setup()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "gopls",
                "pyright" },
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = {
                                        "vim",
                                        "P",
                                        "R",
                                    }
                                }
                            }
                        }
                    })
                end,
            },
        })

        local cmp = require('cmp')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            -- window = {
            --   completion = cmp.config.window.bordered(),
            --   documentation = cmp.config.window.bordered(),
            -- },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true}),
                ['<C-space>'] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                    { name = 'buffer' },
                })
        })

        vim.diagnostic.config({
            update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
--            virtual_text = true
        })

    end
}
