vim.g.mapleader = ","

local keymap = vim.keymap -- for conciseness

-- general keymaps

keymap.set("n", "<leader>nh", ":nohl<CR>") -- remove any highlights
keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horzontally
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
keymap.set("n", "<leader>bn", ":bnext<CR>") -- copy into computer's clipboard
keymap.set("n", "<leader>bp", ":bprev<CR>") -- copy into computer's clipboard
keymap.set("n", "<leader>b", ":buffers<CR>:buffer<Space>") -- show buffers and get ready to specify one
