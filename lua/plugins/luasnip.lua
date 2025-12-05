-- ~/.config/nvim/lua/plugins/luasnip.lua
local ok, ls = pcall(require, "luasnip")
if ok then
  -- Carica snippet dalla tua cartella
  require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })
end

