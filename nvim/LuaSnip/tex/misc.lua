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
    { trig = "pre", dscr = "vspace", snippetType = "autosnippet" },
    fmta(
      [[
        \documentclass[11pt]{article}

        \usepackage{amsmath,amstext,amssymb}
        \usepackage[ttscale=0.825]{libertine}
        \usepackage[libertine]{newtxmath}
        \usepackage{chemformula}
        \usepackage[separate-uncertainty]{siunitx}
        \usepackage{xcolor}
        \usepackage{xspace}
        \usepackage{parskip}
        \usepackage[margin=1.5in]{geometry}
        \usepackage{sectsty}
        \allsectionsfont{\sffamily}
        \usepackage{booktabs}
        \usepackage{threeparttable}
        \usepackage{parskip}
        \usepackage[colorlinks=true, linkcolor=blue, urlcolor=blue]{hyperref}
        \usepackage[backend=biber,
            sorting=none,
            style=numeric,
            hyperref]{biblatex}
        \newcommand{\portlandite}{\ch{Ca(OH)2}\xspace}
        \newcommand{\sulfate}{\ensuremath{\overline{\text{S}}}\xspace}
        \newcommand{\todo}[1]{\textcolor{red}{(\textit{#1})}\xspace}
        \newcommand{\hfy}[1]{\textcolor{red}{(\textit{#1})}\xspace}
        \newcommand{\std}{\ensuremath{^{\circ}}}
        \newcommand{\eqconst}{\ensuremath{K}\xspace}
        \newcommand{\actprod}{\ensuremath{Q}\xspace}
        \newcommand{\satindex}{\ensuremath{\Omega}\xspace}
        \newcommand{\conc}{\ensuremath{c}}
        \newcommand{\mass}{\ensuremath{m}}
        \DeclareSIQualifier{\sol}{sol}
        \DeclareSIQualifier{\water}{\ch{H2O}}

        %% The lineno packages adds line numbers. Start line numbering with
        %% \begin{linenumbers}, end it with \end{linenumbers}. Or switch it on
        %% for the whole article with \linenumbers.
        %\usepackage{lineno}
        
        \begin{document}
        <>
        \end{document}
      ]],
      { i(1) }
    ),
    { condition = line_begin } -- set condition in the `opts` table
  ),
}
