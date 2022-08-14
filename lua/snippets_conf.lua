local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load({ paths = {"./snippets"} })

luasnip.filetype_extend("all", { "_" })
