return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "williamboman/mason.nvim",
            "jay-babu/mason-nvim-dap.nvim",
        },
        config = function ()
            local dap, dapui = require("dap"), require("dapui")

            dapui.setup {
            -- Set icons to characters that are more likely to work in every terminal.
            --    Feel free to remove or use ones that you like more! :)
            --    Don't feel like these are good choices.
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
              controls = {
                icons = {
                  pause = '⏸',
                  play = '▶',
                  step_into = '⏎',
                  step_over = '⏭',
                  step_out = '⏮',
                  step_back = 'b',
                  run_last = '▶▶',
                  terminate = '⏹',
                  disconnect = '⏏',
                },
              },
            }

            dap.listeners.after.event_initialized["dapui_config"] = function()
              dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
              dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
              dapui.close()
            end
        end
    }
}
