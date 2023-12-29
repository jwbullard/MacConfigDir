return {
  "ramojus/mellifluous.nvim",
  priority = 1000,
  config = function()
    local mellifluous = require("mellifluous")
    mellifluous.setup({
      dim_inactive = false,
      color_set = "mountain",
    })
    vim.cmd([[colorscheme mellifluous]])
  end,
}
