-- ~/.config/nvim/lua/plugins/minivisits.lua

-- Configurazione di mini.visits
require("mini.visits").setup({
    -- Numero massimo di visite salvate
    max_visits = 100,
    -- Ordine di preferenza (recenti, frequenti, ecc.)
sort = "recent",
})
