-- PDF Viewer:
-- http://manpages.ubuntu.com/manpages/trusty/man5/zathurarc.5.html
vim.g['vimtex_view_method'] = 'skim'
vim.g['vimtex_quickfix_mode'] = 0

-- Auto Indent
vim.g['vimtex_indent_enabled'] = 1
 

-- Error suppression:
-- https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt

vim.g['vimtex_log_ignore'] = ({
  'Underfull',
  'Overfull',
  'specifier changed t',
  'Token not allowed in a PDF string',
})

vim.g['maplocalleader'] = ','

-- vim.g['vimtex_complete_enabled'] = 1
-- vim.g['vimtex_compiler_progname'] = 'nvr'
vim.g['vimtex_complete_close_braces'] = 1
