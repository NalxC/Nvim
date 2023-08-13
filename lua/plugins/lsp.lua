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
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local servers = require("custom").lsp_servers
            local lspconfig = require("lspconfig")

            -- sign-icon
            if require("custom").use_icons then
                local dia_icons = require("icons").diagnostics
                local signs = { Error = dia_icons.Error, Warn = dia_icons.Warning, Hint = dia_icons.Hint, Info = dia_icons.Information }
                for type, icon in pairs(signs) do
                  local hl = "DiagnosticSign" .. type
                  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
                end
            end
            -- sign-icon

            for _, server in pairs(servers) do
                lspconfig[server].setup {
                    capabilities = capabilities,
                }
            end
        end
    }
}
