require("jwbullard.plugins-setup")
require("jwbullard.core.options")
require("jwbullard.core.keymaps")

vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#969696", bold = false })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#E1E1E1", bold = true })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#969696", bold = false })

vim.g.neovide_cursor_vfx_mode = "railgun"

-- Load snippets from ~/.config/nvim/LuaSnip/
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip/" })
