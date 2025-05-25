return {
  {
    "neovim/nvim-lspconfig",
    event = "VimEnter",
  },
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim",
    },
    opts = {
      ensure_installed = {
        "basedpyright",
        "ruff",
      },
    },
  },
}
