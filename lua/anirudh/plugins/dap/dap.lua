return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")

        -- Adapter pointing to your LLDB DAP executable
        dap.adapters.lldb = {
            type = "executable",
            command = "/Applications/Xcode.app/Contents/Developer/usr/bin/lldb-dap",
            name = "lldb",
        }

        -- Configuration for C++
        dap.configurations.cpp = {
            {
                name = "Launch file",
                command = "/Applications/Xcode.app/Contents/Developer/usr/bin/lldb-dap",
                type = "lldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                args = {},
            },
        }
        -- For C use same as C++
        dap.configurations.c = dap.configurations.cpp

        -- Keybindings (optional but useful)
        local map = vim.keymap.set
        map("n", "<F5>", dap.continue)
        map("n", "<F10>", dap.step_over)
        map("n", "<F11>", dap.step_into)
        map("n", "<F12>", dap.step_out)
        map("n", "<leader>b", dap.toggle_breakpoint)
        map("n", "<leader>dr", dap.repl.open)
    end,
}
