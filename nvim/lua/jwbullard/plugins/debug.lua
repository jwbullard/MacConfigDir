return {
  "mfusenegger/nvim-dap",
  dependencies = {
    "jay-babu/mason-nvim-dap.nvim",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    require("mason").setup()
    require("mason-nvim-dap").setup()
    local dap = require("dap")
    require("dapui").setup()
    local dapui = require("dapui")

    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopAtEntry = true,
      },
      {
        name = "Attach to gdbserver :1234",
        type = "cppdbg",
        request = "launch",
        MIMode = "gdb",
        miDebuggerServerAddress = "localhost:1234",
        miDebuggerPath = "/usr/bin/gdb",
        cwd = "${workspaceFolder}",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
      },
    }

    vim.g.mapleader = ","

    local keymap = vim.keymap -- for conciseness
    --
    keymap.set("n", "<leader>dt", ":lua dap.toggle_breakpoint()<CR>") -- Toggle break point
    keymap.set("n", "<leader>dc", ":lua dap.continue()<CR>") -- Continue after break point
    keymap.set("n", "<leader>dr", ":lua dap.repl.open()<CR>") -- Inspect
    keymap.set("n", "<leader>dk", ":lua dap.terminate()<CR>") -- Terminate debug session
    --
    keymap.set("n", "<leader>dso", ":lua dap.step_over()<CR>") -- Step over function
    keymap.set("n", "<leader>dsi", ":lua dap.step_into()<CR>") -- Step into function
    keymap.set("n", "<leader>dsu", ":lua dap.step_out())<CR>") -- Step out of function
    keymap.set("n", "<leader>dl", ":lua dap.run_last()<CR>") -- Run last
    --
    keymap.set("n", "<leader>duu", ":lua dapui.open()<CR>") -- Open the UI
    keymap.set("n", "<leader>duc", ":lua dapui.close()<CR>") -- Close the UI
  end,
}
