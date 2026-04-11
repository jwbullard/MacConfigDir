vim.pack.add({
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/folke/lazydev.nvim",
})

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "vimls", "clangd", "jsonls", "ltex" },
})

require("lazydev").setup({
  library = {
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  },
})

vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
})
