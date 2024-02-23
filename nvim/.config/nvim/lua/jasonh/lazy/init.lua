function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
	    "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                style = "storm",
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                    sidebars = "dark",
                    floats = "dark",
                },
            })

            ColorMyPencils()
        end
    },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd "colorscheme rose-pine"
            require('rose-pine').setup({
                disable_background = true
            })
		end
	},
	{
		"nvim-lua/plenary.nvim",
		name = "plenary",
        config = function()
            vim.keymap.set('n', '<leader>pt', '<Plug>PlenaryTestFile')
        end
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd "colorscheme rose-pine"
		end
	},
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup {
				icons = false
			}

            vim.keymap.set('n', '<leader>tt', function()
                require("trouble").toggle()
            end)
            vim.keymap.set('n', '<leader>tn', function()
                require("trouble").next({skip_groups = true, jump = true})
            end)
            vim.keymap.set('n', '<leader>tp', function()
                require("trouble").previous({skip_groups = true, jump = true})
            end)

		end
	},
	{
		'ThePrimeagen/harpoon',
        branch = "harpoon2",
		dependencies = {
		    "nvim-lua/plenary.nvim",
		},
        config = function()
            local harpoon = require("harpoon")

            -- REQUIRED
            harpoon:setup()
            -- REQUIRED

            vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

            -- Toggle previous & next buffers stored within Harpoon list
            vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
            vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
        end
	},
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    }

}
