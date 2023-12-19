vim.cmd("colorscheme ayu")
-- vim.cmd("colorscheme tokyonight-dark")

local status, _ = pcall(vim.cmd, "colorscheme ayu")
-- local status, _ = pcall(vim.cmd, "colorscheme tokyonight-dark")
if not status then
  print ("Color scheme not found!")
  return
end

-- Sets colors to line numbers Above, Current and Below  in this order
function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#969696', bold=false })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='#E1E1E1', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#969696', bold=false })
end

LineNumberColors()
