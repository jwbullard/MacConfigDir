require("jwbullard.plugins-setup")
require("jwbullard.core.options")
require("jwbullard.core.keymaps")
require("jwbullard.core.colorscheme")
require("jwbullard.plugins.comment")
require("jwbullard.plugins.nvim-tree")
require("jwbullard.plugins.lualine")
require("jwbullard.plugins.telescope")
require("jwbullard.plugins.nvim-cmp")
require("jwbullard.plugins.vimtex")
require("jwbullard.plugins.lsp.mason")
require("jwbullard.plugins.lsp.lspsaga")
require("jwbullard.plugins.lsp.lspconfig")

if vim.g.neovide then
  vim.o.guifont = "MesloGS NF:h16"
  vim.opt.linespace = 0
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_left = 0
  vim.g.neovide_padding_right = 0
  local alpha = function()
    return string.format("%x", math.floor(255 * vim.g.transparency or 0.9))
  end
  -- neovide_transparency should be 0 if you want to unify transparency of content and title bar
  vim.g.neovide_transparency = 0.0
  vim.g.transparency = 0.9
  vim.g.neovide_background_color = "#000000" .. alpha()
  vim.g.neovide_floating_blur_amount_x = 50.0
  vim.g.neovide_floating_blur_amount_y = 50.0
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5
  vim.g.neovide_scroll_animation_length = 0.3
end
