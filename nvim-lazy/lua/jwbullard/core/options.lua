local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.smarttab = true
opt.expandtab = true
opt.autoindent = true
opt.cindent = true
opt.textwidth = 80
opt.formatoptions = "jcroqlt"

--line wrapping
opt.wrap = true
opt.wrapmargin = 10
opt.smartcase = false

-- cursor line
opt.cursorline = false

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- better message when closing without writing
vim.o.confirm = true

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- slip windows
opt.splitright = true
opt.splitbelow = true

vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#969696", bold = false })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#E1E1E1", bold = true })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#969696", bold = false })

-- Prevent Node.js from issuing warnings
vim.g.loaded_node_provider = 0

-- Prevent Perl from issuing warnings
vim.g.loaded_perl_provider = 0

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
