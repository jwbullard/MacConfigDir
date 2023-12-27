-- vim.cmd("colorscheme ayu")

-- setup must be called before loading
-- vim.cmd("colorscheme kanagawa-dragon")

-- vim.cmd("colorscheme tokyonight-dark")
-- local status, _ = pcall(vim.cmd, "colorscheme ayu")
-- local status, _ = pcall(vim.cmd, "colorscheme kanagawa-dragon")
-- local status, _ = pcall(vim.cmd, "colorscheme tokyonight-dark")
-- if not status then
--  print ("Color scheme not found!")
--  return
--end

-- Default options:
require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = true,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "dragon",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa-dragon")

-- Sets colors to line numbers Above, Current and Below  in this order
function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#969696', bold=false })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='#E1E1E1', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#969696', bold=false })
end

LineNumberColors()
