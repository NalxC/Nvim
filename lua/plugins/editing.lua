return {
    -- autopairs
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    -- Comment
    {
        'numToStr/Comment.nvim',
        event = "VeryLazy",
        opts = {}
    },
    -- surround
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    -- visual-multi
    {
        'mg979/vim-visual-multi',
        version = "*",
        event = "VeryLazy",
        -- init = function()
        --     vim.g.VM_maps = {
        --         ["Find Under"] = ""
        --     }
        -- end,
    },
}
