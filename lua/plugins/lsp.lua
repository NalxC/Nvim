return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        opts = {
            servers = {
                lua_ls = {},
                marksman = {},
            },
            setup = {},
        },
        config = function(_, opts)
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")
            local servers = opts.servers

            -- sign-icon
            if Conf.custom.use_icons then
                local dia_icons = Conf.icons.diagnostics
                local signs = { Error = dia_icons.Error, Warn = dia_icons.Warning, Hint = dia_icons.Hint, Info = dia_icons.Information }
                for type, icon in pairs(signs) do
                  local hl = "DiagnosticSign" .. type
                  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
                end
            end

            -- on_attach
            local on_attach = function (_, bufnr)
               local key_map = {
                   ["n"] = {
                      ["K"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show hover" },
                      ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Goto definition" },
                      ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Goto Declaration" },
                      ["gr"] = { "<cmd>lua vim.lsp.buf.references()<cr>", "Goto references" },
                      ["gI"] = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Goto Implementation" },
                      ["gs"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "show signature help" },
                      ["gl"] = {
                        function()
                          local float = vim.diagnostic.config().float

                          if float then
                            local config = type(float) == "table" and float or {}
                            config.scope = "line"

                            vim.diagnostic.open_float(config)
                          end
                        end,
                        "Show line diagnostics",
                      },
                   },
               }

               for mode, mapping in pairs(key_map) do
                   for key, remap in pairs(mapping) do
                       local opts = { buffer = bufnr, desc = remap[2], noremap = true, silent = true }
                       vim.keymap.set(mode, key, remap[1], opts)
                   end
               end
            end

            local function setup(server)
                local server_opts = vim.tbl_deep_extend("force", {
                    capabilities = vim.deepcopy(capabilities),
                }, {on_attach = on_attach}, servers[server] or {})

                if opts.setup[server] then
                    if opts.setup[server](server, server_opts) then
                        return
                    end
                end
                lspconfig[server].setup(server_opts)
            end
            -- setup
            local ensure_installed = {}
            for server, server_opts in pairs(servers) do
                setup(server)
                ensure_installed[#ensure_installed + 1] = server
            end
            -- mason-lspconfig
            require("mason-lspconfig").setup {
                ensure_installed = ensure_installed,
            }
        end
    }
}
