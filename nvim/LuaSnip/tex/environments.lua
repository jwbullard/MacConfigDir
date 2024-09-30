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

return {
  s({ trig = "ff", dscr = "Expands 'ff' into '\frac{}{}" }, fmta("\\frac{<>}{<>}", { i(1), i(2) })),

  s({ trig = "it", dscr = "Expands 'it' into '\textit{}" }, fmt("\\textit{<>}", { i(1) }, { delimiters = "<>" })),

  s({ trig = "bb", dscr = "Expands 'bb' into '\textbf{}" }, fmt("\\textbf{<>}", { i(1) }, { delimiters = "<>" })),

  s(
    { trig = "env", dscr = "A LaTeX generic environment" },
    fmta(
      [[
                \begin{<>}
                    <>
                \end{<>}
      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1, "env"), i(2), rep(1) }
    )
  ),
  s(
    { trig = "ce", dscr = "A LaTeX center environment" },
    fmta(
      [[
                \begin{center}
                    <>
                \end{center}
      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1) }
    )
  ),

  s(
    { trig = "eq", dscr = "A LaTeX equation environment" },
    fmta(
      [[
                \begin{equation}
                    <>
                    \label{eq:<>}
                \end{equation}
      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1), i(2) }
    )
  ),

  s(
    { trig = "al", dscr = "A LaTeX align environment" },
    fmta(
      [[
                \begin{align}
                    <>
                \end{align}
      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1) }
    )
  ),

  s(
    { trig = "tab", dscr = "A LaTeX table environment" },
    fmta(
      [[
                \begin{table}[h]
                \caption{\label{tab:<>}<>}
                    \begin{tabular}{<>} \toprule
                        <>
                    \end{tabular}
                \end{table}

      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1, "label"), i(2, "caption"), i(3, "lll"), i(4) }
    )
  ),

  s(
    { trig = "fig", dscr = "A LaTeX figure environment" },
    fmta(
      [[
                \begin{figure}[h]
                    \centering\includegraphics[width=<>\textwidth]{ }
                    \caption{\label{fig:<>}<>}
                \end{figure}

      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1, "width"), i(2, "label"), i(3, "caption") }
    )
  ),

  s(
    { trig = "h1", dscr = "Top-level section", snippetType = "autosnippet" },
    fmta(
      [[
                \section{<>}
            ]],
      { i(1) }
    ),
    { condition = line_begin } -- set condition in the `opts` table
  ),

  s(
    { trig = "h2", dscr = "Top-level section", snippetType = "autosnippet" },
    fmta(
      [[
                \subsection{<>}
            ]],
      { i(1) }
    ),
    { condition = line_begin } -- set condition in the `opts` table
  ),

  s(
    { trig = "h3", dscr = "Top-level section", snippetType = "autosnippet" },
    fmta(
      [[
                \subsubsection{<>}
            ]],
      { i(1) }
    ),
    { condition = line_begin } -- set condition in the `opts` table
  ),
}
