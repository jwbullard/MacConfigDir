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
    { trig = "([^%l])xi", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>\\textit{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),

  s(
    { trig = "([^%l])xb", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>\\textbf{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),

  s(
    { trig = "([^%l])xs", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>\\textsc{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),

  s(
    { trig = "([^%l])xt", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>\\texttt{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),

  s(
    { trig = "([^%l])xl", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>\\large{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),

  s(
    { trig = "([^%l])xL", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>\\Large{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),

  s(
    { trig = "([^%l])xG", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>\\LARGE{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),
}
