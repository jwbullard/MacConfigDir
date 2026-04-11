vim.pack.add({
  "https://github.com/L3MON4D3/LuaSnip"
})

require("luasnip").config.set_config({
  -- Enable autotriggered snippets
  enable_autosnippets = true,

  update_events = "TextChanged,TextChangedI",

  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",
})

-- Expand snippets in insert mode with Tab
vim.cmd([[imap <silent><expr> <Tab> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<Tab>']])

-- Jump forward through tabstops in insert and visual mode with Control-f
vim.cmd([[imap <silent><expr> <C-f> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-f>']])
vim.cmd([[smap <silent><expr> <C-f> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-f>']])

-- Jump backward through snippet tabstops with Control-b
vim.cmd([[imap <silent><expr> <C-b> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-b>']])
vim.cmd([[smap <silent><expr> <C-b> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-b>']])

-- Load snippets from ~/.config/nvim/LuaSnip/
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip/" })
