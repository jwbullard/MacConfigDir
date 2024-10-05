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

-- Include this `in_mathzone` function at the start of a snippets file...
local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
-- Then pass the table `{condition = in_mathzone}` to any snippet you want to
-- expand only in math contexts.
--
return {
  s({ trig = ";a", snippetType = "autosnippet" }, { t("\\alpha") }, { condition = in_mathzone }),

  s({ trig = ";b", snippetType = "autosnippet" }, { t("\\beta") }, { condition = in_mathzone }),

  s({ trig = ";g", snippetType = "autosnippet" }, { t("\\gamma") }, { condition = in_mathzone }),

  s({ trig = ";m", snippetType = "autosnippet" }, { t("\\mu") }, { condition = in_mathzone }),

  s({ trig = ";d", snippetType = "autosnippet" }, { t("\\delta") }, { condition = in_mathzone }),

  s({ trig = ";e", snippetType = "autosnippet" }, { t("\\epsilon") }, { condition = in_mathzone }),

  s({ trig = ";o", snippetType = "autosnippet" }, { t("\\omega") }, { condition = in_mathzone }),

  s({ trig = ";t", snippetType = "autosnippet" }, { t("\\tau") }, { condition = in_mathzone }),

  s({ trig = ";x", snippetType = "autosnippet" }, { t("\\xi") }, { condition = in_mathzone }),

  s({ trig = ";z", snippetType = "autosnippet" }, { t("\\zeta") }, { condition = in_mathzone }),

  s({ trig = ";G", snippetType = "autosnippet" }, { t("\\Gamma") }, { condition = in_mathzone }),

  s({ trig = ";D", snippetType = "autosnippet" }, { t("\\Delta") }, { condition = in_mathzone }),

  s({ trig = ";O", snippetType = "autosnippet" }, { t("\\Omega") }, { condition = in_mathzone }),

  s(
    { trig = "ff", snippetType = "autosnippet" },
    fmta("\\frac{<>}{<>}", {
      i(1),
      i(2),
    }),
    { condition = in_mathzone }
  ),

  s(
    { trig = "l(", dscr = "Left-right parentheses", snippetType = "autosnippet" },
    fmta(
      [[
          \left( <> \right)
      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1) }
    ),
    { condition = in_mathzone }
  ),

  s(
    { trig = "l[", dscr = "Left-right brackets", snippetType = "autosnippet" },
    fmta(
      [[
          \left[ <> \right]
      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1) }
    ),
    { condition = in_mathzone }
  ),

  s(
    { trig = "l<", dscr = "Left-right angle brackets", snippetType = "autosnippet" },
    fmta(
      [[
          \langle <> \rangle
      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1) }
    ),
    { condition = in_mathzone }
  ),

  s(
    { trig = "int", dscr = "A LaTeX definite integral", snippetType = "autosnippet" },
    fmta(
      [[
          \int_{<>}^{<>} \text{d}<>
      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1, "a"), i(2, "b"), i(3, "x") }
    ),
    { condition = in_mathzone }
  ),

  s(
    { trig = "sum", dscr = "A LaTeX summation", snippetType = "autosnippet" },
    fmta(
      [[
          \sum_{<>}^{<>} <>
      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1, "a"), i(2, "b"), i(3) }
    ),
    { condition = in_mathzone }
  ),

  s(
    { trig = "prod", dscr = "A LaTeX product", snippetType = "autosnippet" },
    fmta(
      [[
          \prod_{<>}^{<>} <>
      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1, "a"), i(2, "b"), i(3) }
    ),
    { condition = in_mathzone }
  ),
}
