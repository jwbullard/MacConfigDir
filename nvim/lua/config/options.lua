vim.g.mapleader = ","
vim.g.maplocalleader = ","

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
