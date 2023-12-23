local setup, lualine = pcall(require, "lualine")
if not setup then
  return
end

-- local lualine_ayu = require("lualine.themes.ayu_dark")

-- local new_colors = {
--   blue = "#65D1FF",
--   green = "#3EFFDC",
--   violet = "#FF61EF",
--   yellow = "#FFDA7B",
--   black = "000000",
-- }

-- lualine_ayu.normal.a.bg = new_colors.blue
-- lualine_ayu.insert.a.bg = new_colors.green
-- lualine_ayu.visual.a.bg = new_colors.violet
-- lualine_ayu.command = {
--   a = {
--     gui = "bold",
--     bg = new_colors.yellow,
--     fg = new_colors.black,
--   },
-- }

lualine.setup({
  options = {
--    theme = lualine_ayu
      theme = 'ayu_dark'
--    theme = 'tokyonight-dark'
  }
})
