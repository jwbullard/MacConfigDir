return {
  "anuvyklack/windows.nvim",
  opts = {},
  dependencies = {
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim",
  },
  config = function()
    vim.g.mapleader = ","
    vim.o.winwidth = 10
    vim.o.winminwidth = 10
    vim.o.equalalwyas = false
    require("windows").setup()
  end,
}
