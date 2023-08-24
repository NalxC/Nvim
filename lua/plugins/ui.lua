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
                    diagnostics_indicator = function(num, _, diag)
                        if not Custom.settings.use_icons then
                            return "(" .. num .. ")"
                        end
                        local icons = Custom.icons.diagnostics
                        local symbols = {
                            error = icons.Error,
                            warning = icons.Warning,
                            info = icons.Information,
                        }
                        local result = {}
                        for name, count in pairs(diag) do
                            if symbols[name] and count > 0 then
                                table.insert(result, symbols[name] .. " " .. count)
                            end
                        end
                        result = table.concat(result, " ")
                        return #result > 0 and result or ""
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
