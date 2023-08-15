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
        config = function()
            local servers = require("custom").lsp_servers
            require("mason-lspconfig").setup {
                ensure_installed = servers,
            }
        end
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function ()
            local daps = require("custom").debug_adapters
            require ('mason-nvim-dap').setup({
                ensure_installed = daps,
                handlers = {}, -- sets up dap in the predefined manner
            })
        end
    },
}