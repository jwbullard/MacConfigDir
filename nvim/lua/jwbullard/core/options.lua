local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
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

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- slip windows
opt.splitright = true
opt.splitbelow = true
