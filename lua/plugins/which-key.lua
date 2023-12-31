return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        },
        config = function (_, opts)
            local nopts = {
                mode = "n", -- NORMAL mode
                -- prefix: use "<leader>f" for example for mapping everything related to finding files
                -- the prefix is prepended to every mapping part of `mappings`
                prefix = "<leader>",
                buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
                silent = true, -- use `silent` when creating keymaps
                noremap = true, -- use `noremap` when creating keymaps
                nowait = false, -- use `nowait` when creating keymaps
                expr = false, -- use `expr` when creating keymaps
            }

            local nmappings = {
                ["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
                ["o"] = { "<cmd>AerialToggle<CR>", "Outline" },
                b = {
                    name = "Buffers",
                    j = { "<cmd>BufferLinePick<cr>", "Jump" },
                    f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
                    b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
                    n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
                    -- W = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)" },
                    -- w = { "<cmd>BufferWipeout<cr>", "Wipeout" }, -- TODO: implement this for bufferline
                    e = {
                      "<cmd>BufferLinePickClose<cr>",
                      "Pick which buffer to close",
                    },
                    h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
                    l = {
                      "<cmd>BufferLineCloseRight<cr>",
                      "Close all to the right",
                    },
                    D = {
                      "<cmd>BufferLineSortByDirectory<cr>",
                      "Sort by directory",
                    },
                    L = {
                      "<cmd>BufferLineSortByExtension<cr>",
                      "Sort by language",
                    },
                },
                d = {
                    name = "Debug",
                    t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
                    b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
                    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
                    C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
                    d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
                    g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
                    i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
                    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
                    u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
                    p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
                    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
                    s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
                    q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
                    U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
                },
                p = {
                    name = "Plugins",
                    i = { "<cmd>Lazy install<cr>", "Install" },
                    s = { "<cmd>Lazy sync<cr>", "Sync" },
                    S = { "<cmd>Lazy clear<cr>", "Status" },
                    c = { "<cmd>Lazy clean<cr>", "Clean" },
                    u = { "<cmd>Lazy update<cr>", "Update" },
                    p = { "<cmd>Lazy profile<cr>", "Profile" },
                    l = { "<cmd>Lazy log<cr>", "Log" },
                    d = { "<cmd>Lazy debug<cr>", "Debug" },
                },
                s = {
                    name = "Search",
                    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
                    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
                    f = { "<cmd>Telescope find_files<cr>", "Find File" },
                    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
                    H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
                    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
                    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
                    R = { "<cmd>Telescope registers<cr>", "Registers" },
                    t = { "<cmd>Telescope live_grep<cr>", "Text" },
                    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
                    C = { "<cmd>Telescope commands<cr>", "Commands" },
                    l = { "<cmd>Telescope resume<cr>", "Resume last search" },
                    p = {
                      "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
                      "Colorscheme with Preview",
                    },
                },
                l = {
                    name = "LSP",
                    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
                    d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
                    w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
                    --f = { "<cmd>lua require('lvim.lsp.utils').format()<cr>", "Format" },
                    i = { "<cmd>LspInfo<cr>", "Info" },
                    I = { "<cmd>Mason<cr>", "Mason Info" },
                    j = {
                      "<cmd>lua vim.diagnostic.goto_next()<cr>",
                      "Next Diagnostic",
                    },
                    k = {
                      "<cmd>lua vim.diagnostic.goto_prev()<cr>",
                      "Prev Diagnostic",
                    },
                    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
                    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
                    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
                    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
                    S = {
                      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
                      "Workspace Symbols",
                    },
                    e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
                },
                g = {
                    name = "Git",
                    -- g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
                    j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
                    k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
                    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
                    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
                    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
                    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
                    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
                    u = {
                      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
                      "Undo Stage Hunk",
                    },
                    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
                    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
                    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
                    C = {
                      "<cmd>Telescope git_bcommits<cr>",
                      "Checkout commit(for current file)",
                    },
                    d = {
                      "<cmd>Gitsigns diffthis HEAD<cr>",
                      "Git Diff",
                    },
                },
                x = {
                    name = "Trouble",
                    x = {"<cmd>TroubleToggle<cr>", "Trouble"},
                    w = {"<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble workspace"},
                    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Trouble document"},
                    q = {"<cmd>TroubleToggle quickfix<cr>", "Trouble quickfix"},
                    l = {"<cmd>TroubleToggle loclist<cr>", "Trouble loclist"},
                },
            }

            local wk = require("which-key")
            wk.setup(opts)
            wk.register(nmappings, nopts)
        end
    }
}
