return {
    -- lspconfig
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                clangd = {},
            },
        },
    },

    -- nvim-dap
    {
        "jay-babu/mason-nvim-dap.nvim",
        opts = function (_, opts)
            if type(opts.ensure_installed) == "table" then
                vim.list_extend(opts.ensure_installed, { "codelldb" })
            end
        end
    },
}
