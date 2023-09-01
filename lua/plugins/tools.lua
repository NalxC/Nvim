return {
    {
        'ggandor/leap.nvim',
        event = "VeryLazy",
        config = function()
            require('leap').add_default_mappings()
        end
    },

    {
        "folke/trouble.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    }
}
