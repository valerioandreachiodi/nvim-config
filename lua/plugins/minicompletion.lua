-- ~/.config/nvim/lua/plugins/minicompletion.lua

-- Configurazione di mini.completion
require("mini.completion").setup({
    -- attiva completamento automatico
    auto_setup = true,

    -- puoi personalizzare i trigger
    lsp_completion = {
        source_func = "omnifunc",
        auto_setup = true,
    },

    -- opzionale: mostra suggerimenti inline
    window = {
        info = { border = "rounded" },
        signature = { border = "rounded" },
    },
})
