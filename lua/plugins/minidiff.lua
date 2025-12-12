-- ~/.config/nvim/lua/plugins/minidiff.lua

-- Configurazione di mini.diff
require("mini.diff").setup({
    -- Mostra i cambiamenti come segni nel gutter
    view = {
        style = "sign", -- puoi usare anche "number" o "line" o "sign"
    },
    -- Navigazione tra hunks
    mappings = {
        apply = "gh",   -- applica hunk
        reset = "gr",   -- resetta hunk
        goto_next = "]d",
        goto_prev = "[d",
    },
})
