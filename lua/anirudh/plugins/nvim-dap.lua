return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require("dap")

      -- Update this path depending on your system
      -- Homebrew LLVM installs here on macOS:
      local lldb = "/Applications/Xcode.app/Contents/Developer/usr/bin/lldb-dap"

      dap.adapters.lldb = {
        type = "executable",
        command = lldb,
        name = "lldb",
      }

      dap.configurations.cpp = {
        {
          name = "LLDB Debug",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
          end,
            args = function()
              local input = vim.fn.input("Arguments: ")
              return vim.split(input, " ", { trimempty = true })
            end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      dap.configurations.c = dap.configurations.cpp

      -- Keymaps
      vim.keymap.set("n", "<F5>", dap.continue)
      vim.keymap.set("n", "<F10>", dap.step_over)
      vim.keymap.set("n", "<F11>", dap.step_into)
      vim.keymap.set("n", "<F12>", dap.step_out)

      vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint)
      vim.keymap.set("n", "<Leader>B", function()
        dap.set_breakpoint(vim.fn.input("Condition: "))
      end)
      vim.keymap.set("n", "<Leader>dr", dap.repl.open)

      -- dap-ui
      local dapui = require("dapui")
      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Virtual text
      require("nvim-dap-virtual-text").setup()
    end,
  },
}
