require("jwbullard.plugins-setup")
require("jwbullard.core.options")
require("jwbullard.core.keymaps")

vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#969696", bold = false })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#E1E1E1", bold = true })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#969696", bold = false })

vim.g.neovide_cursor_vfx_mode = "railgun"

-- Code folding options

-- vim.opt.foldmethod = "indent"
-- vim.opt.foldcolumn = 1
-- vim.opt.foldenable = true
-- vim.opt.foldminlines = 1
-- vim.opt.foldlevel = 99

-- Set global indenting and tab stops
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.cindent = true

-- Prevent Node.js from issuing warnings
vim.g.loaded_node_provider = 0

-- Prevent Perl from issuing warnings
vim.gloaded_perl_provider = 0

require("luasnip").config.set_config({ -- Setting LuaSnip config

  -- Enable autotriggered snippets
  enable_autosnippets = true,

  update_events = "Textchanged,TextChangedI",

  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",
  -- Expand snippets in insert mode with Tab
  vim.cmd([[imap <silent><expr> <Tab> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<Tab>']]),

  -- Jump forward in through tabstops in insert and visual mode with Control-f
  vim.cmd([[imap <silent><expr> <C-f> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-f>']]),
  vim.cmd([[smap <silent><expr> <C-f> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-f>']]),

  -- Jump backward through snippet tabstops with Shift-Tab (for example)
  vim.cmd([[imap <silent><expr> <C-b> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-b>']]),
  vim.cmd([[smap <silent><expr> <C-b> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-b>']]),
})

-- Load snippets from ~/.config/nvim/LuaSnip/
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip/" })
