return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true, -- This automatically runs `require("luarocks-nvim").setup()`
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    -- put any other flags you wanted to pass to lazy here!
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Loads Default behavior
          ["core.concealer"] = {}, -- Loads Default behavior
          ["core.integrations.treesitter"] = {},
          ["core.export"] = {},
          ["core.export.markdown"] = {
            config = {
              extensions = "all",
            },
          },
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
                default = "notes",
              },
            },
          },
        },
      })
      -- set keymaps
      vim.g.mapleader = ","
      local keymap = vim.keymap

      keymap.set("n", "<leader>no", "<cmd>Neorg workspace notes<CR>", { desc = "Open notes index" })
    end,
    run = ":Neorg sync-parsers",
  },
}
