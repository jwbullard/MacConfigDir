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

return {
  s(
    { trig = "l(", dscr = "Left-right parentheses" },
    fmta(
      [[
                \left( <> \right)
      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1) }
    )
  ),

  s(
    { trig = "l[", dscr = "Left-right brackets" },
    fmta(
      [[
                \left[ <> \right]
      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1) }
    )
  ),

  s(
    { trig = "l<", dscr = "Left-right angle brackets" },
    fmta(
      [[
                \langle <> \rangle
      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1) }
    )
  ),

  s(
    { trig = "int", dscr = "A LaTeX definite integral" },
    fmta(
      [[
                \int_{<>}^{<>} \text{d}<>
      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1, "a"), i(2, "b"), i(3, "x") }
    )
  ),

  s(
    { trig = "sum", dscr = "A LaTeX summation" },
    fmta(
      [[
                \sum_{<>}^{<>} <>
      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1, "a"), i(2, "b"), i(3) }
    )
  ),

  s(
    { trig = "prod", dscr = "A LaTeX summation" },
    fmta(
      [[
                \sum_{<>}^{<>} <>
      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1, "a"), i(2, "b"), i(3) }
    )
  ),
}
