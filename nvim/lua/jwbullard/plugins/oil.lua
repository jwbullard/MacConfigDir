return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
    })
    -- set keymaps
    vim.g.mapleader = ","
    local keymap = vim.keymap

    keymap.set("n", "<leader>oo", "<cmd>lua require('oil').toggle_float('.')<CR>", { noremap = true, silent = true })
    keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
  end,
}
