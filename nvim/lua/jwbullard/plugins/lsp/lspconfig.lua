return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "vimls", "clangd", "jsonls" },
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
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
              },
            },
          },
        },
        config = function()
          local capabilities = require("blink.cmp").get_lsp_capabilities()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup({ capabilities = capabilities })
          lspconfig.clangd.setup({ capabilities = capabilities })
          lspconfig.jsonls.setup({ capabilities = capabilities })
        end,
      },
    },
  },
}
