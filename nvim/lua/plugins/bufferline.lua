vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/akinsho/bufferline.nvim",
})

local bufferline = require("bufferline")
bufferline.setup({
  options = {
    mode = "buffers",
    style_preset = bufferline.style_preset.default,
  },
})
