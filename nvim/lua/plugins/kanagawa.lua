vim.pack.add({
  "https://github.com/rebelot/kanagawa.nvim",
})

local kanagawa = require("kanagawa")
kanagawa.setup({
  dimInactive = false,
  transparent = true,
  theme = "dragon",
  -- theme = "wave",
  background = {
    dark = "dragon",
    -- dark = "wave",
    light = "lotus",
  },
})

vim.cmd([[colorscheme kanagawa]])
