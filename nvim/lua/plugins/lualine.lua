vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-lualine/lualine.nvim",
})

local lualine = require("lualine")
lualine.setup({
  options = {
    theme = "ayu_mirage",
  },
  sections = {
    lualine_x = {
      { "encoding" },
      { "fileformat" },
      { "filetype" },
    },
  },
})
