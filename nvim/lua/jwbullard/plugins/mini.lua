return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    -- vim.keymap.set("n", "zR", require("ufo").openAllFolds { desc = "Open all folds" })

    require("mini.ai").setup()
    require("mini.align").setup()
    require("mini.pairs").setup()
    require("mini.surround").setup() -- alternative to nvim-surround
    -- require("mini.clue").setup()
    require("mini.extra").setup()
    -- require("mini.indentscope").setup() -- alternative to hlchunk
    -- require("mini.jump").setup() -- jump to next character etc.
    require("mini.operators").setup() -- used for auto-sorting text
  end,
}
