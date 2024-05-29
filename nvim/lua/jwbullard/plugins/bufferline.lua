return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        mode = "buffers",
        style_preset = bufferline.style_preset.default,
      },
    })
  end,
}
-- {
-- "NeogitOrg/neogit",
-- dependencies = {
-- "nvim-lua/plenary.nvim",
-- "sindrets/diffview.nvim",
-- "nvim-telescope/telescope.nvim",
-- },
-- config = function()
-- local neogit = require("neogit")
-- neogit.setup({})
-- vim.keymap.set("n", "<leader>gs", neogit.open, { silent = true, noremap = true })
-- end,
-- },
