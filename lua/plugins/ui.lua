return {
    -- Colorscheme
    {
        'ellisonleao/gruvbox.nvim',
        cond = require("custom").colorschemes == "gruvbox",
        lazy = false,
        priority = 1000,
        config = function()
            vim.o.background = "dark" -- or "light" for light mode
            vim.cmd([[colorscheme gruvbox]])
        end
    },
    {
        'navarasu/onedark.nvim',
        cond = require("custom").colorschemes == "onedark",
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
        cond = require("custom").colorschemes == "monokai-pro",
        lazy = false,
        priority = 1000,
        config = function ()
            require("monokai-pro").setup({
                filter = "machine", -- classic | octagon | pro | machine | ristretto | spectrum
            })
            vim.cmd([[colorscheme monokai-pro]])
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
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            vim.opt.termguicolors = true
            require("bufferline").setup{
                options = {
                    always_show_bufferline = false,
                    diagnostics = "nvim_lsp",
                    diagnostics_update_in_insert = false,
                    diagnostics_indicator = function(_, _, diag)
                        local icons = require("icons").diagnostics
                        local ret = (diag.error and icons.Error .. diag.error .. " " or "")
                        .. (diag.warning and icons.Warning .. diag.warning or "")
                        return vim.trim(ret)
                    end,
                    -- 左侧让出 nvim-tree 的位置
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "EXPLORER",
                            highlight = "PanelHeading",
                            text_align = "left"
                        },
                    }
                },
            }
        end
    },
    -- show tabs
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            -- vim.opt.list = true
            -- vim.opt.listchars:append "space:⋅"
            -- vim.opt.listchars:append "eol:↴"
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
