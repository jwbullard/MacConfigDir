--return {
--  "ramojus/mellifluous.nvim",
--  priority = 1000,
--  config = function()
-- local mellifluous = require("mellifluous")
-- mellifluous.setup({
-- dim_inactive = false,
-- color_set = "mountain",
-- })
-- vim.cmd([[colorscheme mellifluous]])
-- end,
-- }

return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  config = function()
    local kanagawa = require("kanagawa")
    kanagawa.setup({
      dimInactive = false,
      transparent = true,
      theme = "wave",
      background = {
        dark = "wave",
        light = "lotus",
      },
    })
    vim.cmd([[colorscheme kanagawa]])
  end,
}
