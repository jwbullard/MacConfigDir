vim.pack.add({
  "https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    lua = { "stylua" },
    tex = { "latexindent" },
    cpp = { "clang-format" },
    c = { "clang-format" },
    xml = { "xmlformat" },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  },
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
  require("conform").format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  })
end, { desc = "Format file or range (in visual mode)" })
