vim.g.mapleader = ","
vim.g.maplocalleader = ","
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "jwbullard.plugins" },
  { import = "jwbullard.plugins.lsp" },
}, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
-- vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

vim.diagnostic.config({
  virtual_text = false, -- floating text next to code is too noisy.
  underline = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
    },
    numhl = {
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})
