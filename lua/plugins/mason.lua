return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        -- config = function()
        --     local servers = Conf.custom.lsp_servers
        --     require("mason-lspconfig").setup {
        --         ensure_installed = servers,
        --     }
        -- end
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
            ensure_installed = {},
        },
        config = function (_, opts)
            local daps = opts.ensure_installed
            require ('mason-nvim-dap').setup({
                ensure_installed = daps,
                handlers = {}, -- sets up dap in the predefined manner
            })
        end
    },
}
