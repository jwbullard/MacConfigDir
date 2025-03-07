local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- This is the `get_visual` function I've been talking about.
-- ----------------------------------------------------------------------------
-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.

local is_file_begin = function()
  local line_number = vim.fn["line"](".")
  if line_number == 1 then
    return true
  else
    return false
  end
end

local get_visual = function(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {
  s(
    { trig = "vs", dscr = "vspace", snippetType = "autosnippet" },
    fmta(
      [[
        \vspace{<>}

      ]],
      { i(1) }
    ),
    { condition = line_begin } -- set condition in the `opts` table
  ),

  s(
    { trig = "_pre", dscr = "preamble", snippetType = "autosnippet" },
    fmta(
      [[
        \documentclass{article}

        \input{~/Documents/Resources/LaTeX/Headers/Packages.tex}
        \input{~/Documents/Resources/LaTeX/Headers/Commands.tex}

        %\renewcommand{\theequation}{\arabic{equation}}

        \begin{document}
        \begin{center}
            \Large{\textsf{<>}}
        \end{center}
        \begin{center}
            \large{J.W. Bullard, Texas A\&M University}
        \end{center}
        \begin{center}
        \DTMnow
        \end{center}

        \dparspace
        <>
        \end{document}
      ]],
      { i(1), i(2) }
    ),
    { condition = is_file_begin }
  ),
}
