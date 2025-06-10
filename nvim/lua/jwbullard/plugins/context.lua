return {
  "nvim-treesitter/nvim-treesitter-context",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter",
  },
  config = function()
    require("treesitter-context").setup({
      max_lines = 5,
    })
  end,
}
