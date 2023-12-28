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

vim.g.mapleader = ","
-- General keymaps
local keymap = vim.keymap
keymap.set("n", "<leader>nh", ":nohl<CR>") -- remove any highlights
keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horzontally
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
keymap.set("n", "<leader>bn", ":bnext<CR>") -- copy into computer's clipboard
keymap.set("n", "<leader>bp", ":bprev<CR>") -- copy into computer's clipboard
keymap.set("n", "<leader>b", ":buffers<CR>:buffer<Space>") -- show buffers and get ready to specify one

require("lazy").setup({
  { import = "jwbullard.plugins" },
  { import = "jwbullard.plugins.lsp" },
}, {
  install = {
    colorscheme = { "mellifluous" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

--local plugins = {
-- lua functions that many plugins use
--  'nvim-lua/plenary.nvim',

--  Colorschemes
--  'shatur/neovim-ayu',
--  'rebelot/kanagawa.nvim',
--  'ramojus/mellifluous.nvim',

-- cool surrounding character replacement and generation

--  'tpope/vim-surround',
--  'vim-scripts/ReplaceWithRegister',

-- commenting with , branch =
--"0.1.x" c
--  'numToStr/Comment.nvim',

-- file explorer
--  'nvim-tree/nvim-tree.lua',

-- vscode-like pictograms to neovim built-in lsp
--  'onsails/lspkind.nvim',

-- icons
--  'kyazdani42/nvim-web-devicons',

-- statusline
--  'nvim-lualine/lualine.nvim',

-- fuzzy finding
--  {
--  'nvim-telescope/telescope-fzf-native.nvim',
--    build = 'make'
--  },

--  {
--    'nvim-telescope/telescope.nvim',
--    branch = '0.1.x'
--  },

--  'BurntSushi/ripgrep',

-- VimTex
--  'lervag/vimtex',

-- autocompletion
--  'hrsh7th/nvim-cmp',
--  'hrsh7th/cmp-buffer',
--  'hrsh7th/cmp-path',
--  'micangl/cmp-vimtex',

-- snippets
--  'L3MON4D3/LuaSnip',
--  'saadparwaiz1/cmp_luasnip',
--  'rafamadriz/friendly-snippets',

-- managing & installing lsp servers
--  'williamboman/mason.nvim',
--  'williamboman/mason-lspconfig.nvim',
--  'mhartington/formatter.nvim',
--  'mfussenegger/nvim-lint',

-- configuring lsp servers
--  'neovim/nvim-lspconfig',
--  'hrsh7th/cmp-nvim-lsp',
--  {
--    'glepnir/lspsaga.nvim',
--    branch = 'main'
--  },

-- multiline cursors
--  'mg979/vim-visual-multi',

-- Treesitter for neovim
--  {
--    'nvim-treesitter/nvim-treesitter',
--    build = ':TSUpdate'
--  }
--}

--local opts = {}

-- require("lazy").setup(plugins, opts)
