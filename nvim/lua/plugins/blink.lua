vim.pack.add({
  "https://github.com/L3MON4D3/LuaSnip",
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/micangl/cmp-vimtex",
  "https://github.com/saghen/blink.compat",
  "https://github.com/saghen/blink.cmp",
})

require("blink.compat").setup()

local blink = require("blink.cmp")

local group = vim.api.nvim_create_augroup("BlinkCmpLazyLoad", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  group = group,
  once = true,
  callback = function()
    blink.setup({
      keymap = {
        preset = "super-tab",
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<tab>"] = { "accept", "fallback" },
      },
      snippets = { preset = "luasnip" },
      appearance = { nerd_font_variant = "mono", use_nvim_cmp_as_default = true },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 0,
          window = {
            border = "single",
          },
        },
        menu = {
          border = "single",
        },
      },
      signature = { window = { border = "single" } },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "vimtex" },
        providers = {
          vimtex = {
            name = "vimtex",
            module = "blink.compat.source",
          },
        },
      },
      fuzzy = { implementation = "prefer_rust" },
    })
  end,
})
