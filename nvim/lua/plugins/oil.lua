vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/stevearc/oil.nvim",
})

require("oil").setup({
  default_file_explorer = true,
})

vim.keymap.set("n", "<leader>oo", function()
  require("oil").toggle_float(".")
end, { noremap = true, silent = true, desc = "Oil float" })
vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
