local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local extras = require("luasnip.extras")
local l = extras.lambda
local fmt = require("luasnip.extras.fmt").fmt

return {
  s(
    "us",
    fmt("const [{},set{setter}] = useState<{}>({})", {
      i(1, "value"),
      i(2, "type"),
      i(3, "initialValue"),
      setter = l(l._1:sub(1, 1):upper() .. l._1:sub(2, -1), 1),
    })
  ),
  s(
    "ue",
    fmt(
      [[
  useEffect(() => {{
    {}
  }}, [])
  ]],
      {
        i(1),
      }
    )
  ),
  s(
    "comp",
    fmt(
      [[
  'use client'

  export type {typeName}Props = {typeDef}

  export const {compName} = (props: {typeName}Props) => {{
    {}

    return (
      <> </>
    )
  }}
  ]],
      {
        compName = i(1, "ComponentName"),
        typeDef = i(2, "TypeDefinition"),
        typeName = extras.rep(1),
        i(3),
      }
    )
  ),
  s(
    "ternary",
    fmt("{cond} ? {node1} : {node2}", {
      cond = i(1, "cond"),
      node1 = i(2, "then"),
      node2 = i(3, "else"),
    })
  ),
  s(
    "cl",
    fmt("console.log({})", {
      i(1),
    })
  ),
  s(
    "clv",
    fmt("console.log('{var1}: ', {var2})", {
      var1 = i(1, "variable"),
      var2 = extras.rep(1),
    })
  ),
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
