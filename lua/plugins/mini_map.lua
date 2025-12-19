return {
  "echasnovski/mini.map",
  version = false,
  config = function()
    vim.o.mouse = "a"

    local map = require("mini.map")

    -- ✅ Everforest highlights
    vim.api.nvim_set_hl(0, "MiniMapNormal", { fg = "#7fbbb3", bg = "#2d353b" })
    vim.api.nvim_set_hl(0, "MiniMapSymbolLine", { fg = "#a7c080" })
    vim.api.nvim_set_hl(0, "MiniMapCurrent", { fg = "#d699b6", bold = true })

    map.setup({
      integrations = {
        map.gen_integration.builtin_search(),
        map.gen_integration.diff(),
      },

        symbols = {
            encode = map.gen_encode_symbols.dot("4x2"),
        },

        window = {
            side = "right",
            width = 12,
            winblend = 15,

            -- ✅ fondamentale: permette alla minimap di ricevere click
            focusable = true,
        },

        mappings = {
            goto = "<LeftMouse>", -- ✅ click per saltare alla riga
        },
    })

    -- apri la minimap automaticamente
    vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
        if vim.bo.buftype == "" then
            map.open()
            end
            end,
    })
    end,
}

