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
            local servers = require("langs").lsp_servers
            require("mason-lspconfig").setup {
                ensure_installed = servers,
            }
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local servers = require("langs").lsp_servers
            local lspconfig = require("lspconfig")
            for _, server in pairs(servers) do
                lspconfig[server].setup {
                    capabilities = capabilities,
                }
            end
        end
    }
}
