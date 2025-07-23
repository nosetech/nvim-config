local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local extras = require("luasnip.extras")
local l = extras.lambda
local fmt = require("luasnip.extras.fmt").fmt

return {
  s(
    "todo",
    fmt("// TODO: {}", {
      i(1, "comment"),
    })
  ),
  s(
    "note",
    fmt("// NOTE: {}", {
      i(1, "comment"),
    })
  ),
}
