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
  s({ trig = ";a", snippetType = "autosnippet" }, { t("\\alpha") }),

  s({ trig = ";b", snippetType = "autosnippet" }, { t("\\beta") }),

  s({ trig = ";g", snippetType = "autosnippet" }, { t("\\gamma") }),

  s({ trig = ";m", snippetType = "autosnippet" }, { t("\\mu") }),

  s({ trig = ";d", snippetType = "autosnippet" }, { t("\\delta") }),

  s({ trig = ";e", snippetType = "autosnippet" }, { t("\\epsilon") }),

  s({ trig = ";o", snippetType = "autosnippet" }, { t("\\omega") }),

  s({ trig = ";t", snippetType = "autosnippet" }, { t("\\tau") }),

  s({ trig = ";x", snippetType = "autosnippet" }, { t("\\xi") }),

  s({ trig = ";z", snippetType = "autosnippet" }, { t("\\zeta") }),

  s({ trig = ";G", snippetType = "autosnippet" }, { t("\\Gamma") }),

  s({ trig = ";D", snippetType = "autosnippet" }, { t("\\Delta") }),

  s({ trig = ";O", snippetType = "autosnippet" }, { t("\\Omega") }),
}
