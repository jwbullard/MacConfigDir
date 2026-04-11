vim.g.mapleader = ","

local keymap = vim.keymap -- for conciseness

-- general keymaps

keymap.set("n", "<leader>nh", ":nohl<CR>") -- remove any highlights
keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horzontally
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
keymap.set("n", "<leader>bn", ":bnext<CR>") -- go to next buffer
keymap.set("n", "<leader>bp", ":bprev<CR>") -- go to previous buffer
keymap.set("n", "<leader>bd", ":bd!<CR>") -- close the buffer with extreme prejudice
keymap.set("n", "<leader>b", ":buffers<CR>:buffer<Space>") -- show buffers and get ready to specify one
keymap.set("n", "<leader>jq", ":%!jq .<CR>") -- show buffers and get ready to specify one
keymap.set("n", "<leader>cc", ":cclose<CR>") -- close the quickfix window
keymap.set("n", "<leader>li", ":LspInfo<CR>") -- LSP information
keymap.set("n", "<leader>lr", ":lua vim.lsp.buf.rename()<CR>") -- LSP symbol rename
keymap.set("n", "<leader>ls", ":lua vim.lsp.buf.signature_help()<CR>") -- LSP signature help
keymap.set("n", "<leader>lk", ":lua vim.lsp.buf.signature_help()<CR>") -- LSP signature help
keymap.set("n", "<leader>lf", ":lua vim.lsp.buf.format({ async = true })<CR>") -- LSP format"
keymap.set("n", "<leader>ld", ":lua vim.diagnostic.open_float()<CR>") -- Open diagnostics"
keymap.set("n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>") -- Quickfix diagnostics"
keymap.set("n", "K", ":lua vim.lsp.buf.hover()<CR>") -- LSP Hover"
keymap.set("n", "gD", ":lua vim.lsp.buf.declaration()<CR>") -- LSP goto declaration"
keymap.set("n", "g[", ":lua vim.diagnostic.goto_prev()<CR>") -- goto prev diagnostic
keymap.set("n", "g]", ":lua vim.diagnostic.goto_next()<CR>") -- goto next diagnostic"

-- Oil
keymap.set("n", "<leader>oo", "<cmd>lua require('oil').toggle_float('.')<CR>", { noremap = true, silent = true })
keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })

-- Gitsigns
keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})

-- Conform formatting
keymap.set({ "n", "v" }, "<leader>mp", function()
  require("conform").format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  })
end, { desc = "Format file or range (in visual mode)" })

-- Linting
keymap.set("n", "<leader>li", function()
  require("lint").try_lint()
end, { desc = "Trigger linting for current file" })

-- Vimtex
keymap.set("n", "<localleader>ls", ":VimtexView<CR>") -- forward search requires vimtex plugin
keymap.set("n", "<localleader>wc", ":VimtexCountWords<CR>") -- count words in document

-- Ufo cold folding
keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
keymap.set("n", "zK", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end, { desc = "Peek Fold" })

-- Git diffview
keymap.set("n", "<leader>dv", ":DiffviewOpen<CR>", {})
keymap.set("n", "<leader>dh", ":DiffviewFileHistory<CR>", {})
