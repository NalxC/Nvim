return {
    -- Colorscheme
    {
        'ellisonleao/gruvbox.nvim',
        cond = require("custom").colorschemes == "gruvbox",
        lazy = false,
        priority = 1000,
        opts = function()
            vim.o.background = "dark" -- or "light" for light mode
            vim.cmd([[colorscheme gruvbox]])
        end
    },
    {
        'navarasu/onedark.nvim',
        cond = require("custom").colorschemes == "onedark",
        lazy = false,
        priority = 1000,
        opts = function()
            require('onedark').setup
            {
                style = 'dark'
            }
            require('onedark').load()
        end
    },
    -- StatuslineSkin
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        config = function()
          require('lualine').setup {
              -- options = { theme = 'gruvbox' },
          }
        end
    },
    -- BufflineSkin
    {
        'akinsho/bufferline.nvim',
        --cond = false, -- 安装不加载 
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
          vim.opt.termguicolors = true
          require("bufferline").setup{}
        end
    },
    -- show tabs
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            --vim.opt.list = true
            vim.opt.listchars:append "space:⋅"
            vim.opt.listchars:append "eol:↴"
            require("indent_blankline").setup {
                show_end_of_line = true,
                space_char_blankline = " ",
            }
        end
    },
    -- file-tree
    {
        "nvim-tree/nvim-tree.lua",
        --cond = false, -- 安装不加载 
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            -- disable netrw at the very start of your init.lua
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            -- set termguicolors to enable highlight groups
            vim.opt.termguicolors = true

            require("nvim-tree").setup {}
        end
    }
}
