vim.cmd("colorscheme ayu")

local status, _ = pcall(vim.cmd, "colorscheme ayu")
if not status then
  print ("Color scheme not found!")
  return
end
