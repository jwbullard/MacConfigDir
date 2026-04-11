return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "vimls", "clangd", "jsonls", "ltex" },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      {
        "neovim/nvim-lspconfig",
        dependencies = {
          "saghen/blink.cmp",
          {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
              library = {
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
              },
            },
          },
        },
        config = function()
          vim.lsp.config("*", {
            capabilities = require("blink.cmp").get_lsp_capabilities(),
          })
        end,
      },
    },
  },
}
