-- PDF Viewer:
-- http://manpages.ubuntu.com/manpages/trusty/man5/zathurarc.5.html
vim.g['tex_flavor'] = 'latex'
vim.g['vimtex_view_method'] = 'skim'
vim.g['vimtex_quickfix_mode'] = 1
vim.g['vimtex_view_skim_sync'] = 1
vim.g['vimtex_view_skim_activate'] = 1

-- Auto Indent
vim.g['vimtex_indent_enabled'] = 1
 

-- Error suppression:
-- https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt

vim.g['vimtex_quickfix_ignore_filters'] = ({
  'Marginpar on page',
  'Overfull',
  'Underfull',
  'Font Warning',
  'specifier changed t',
  'Token not allowed in a PDF string',
})

vim.g['vimtex_log_ignore'] = ({
  'Underfull',
  'Overfull',
  'Font Warning',
  'specifier changed t',
  'Token not allowed in a PDF string',
})

vim.g['maplocalleader'] = ','

vim.g['vimtex_complete_enabled'] = 1
vim.g['vimtex_compiler_progname'] = 'nvr'
vim.g['vimtex_complete_close_braces'] = 1
