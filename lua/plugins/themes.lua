return {
    -- Colorscheme
    {
        'ellisonleao/gruvbox.nvim',
        cond = Custom.settings.colorschemes == "gruvbox",
        lazy = false,
        priority = 1000,
        config = function()
            vim.o.background = "dark" -- or "light" for light mode
            vim.cmd([[colorscheme gruvbox]])
        end
    },
    {
        'navarasu/onedark.nvim',
        cond = Custom.settings.colorschemes == "onedark",
        lazy = false,
        priority = 1000,
        config = function()
            require('onedark').setup
            {
                style = 'dark'
            }
            require('onedark').load()
        end
    },
    {
        'loctvl842/monokai-pro.nvim',
        cond = Custom.settings.colorschemes == "monokai-pro",
        lazy = false,
        priority = 1000,
        config = function ()
            require("monokai-pro").setup({
                filter = "octagon", -- classic | octagon | pro | machine | ristretto | spectrum
            })
            vim.cmd([[colorscheme monokai-pro]])
        end
    },
    {
        "folke/tokyonight.nvim",
        cond = Custom.settings.colorschemes == "tokyonight",
        lazy = false,
        priority = 1000,
        config = function ()
            require("tokyonight").setup({
                style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            })
            vim.cmd[[colorscheme tokyonight]]
        end
    },
}
