-- lua/plugins/trouble.lua
require("trouble").setup({
    position = "bottom", -- può essere "bottom", "top", "left", "right"
    height = 10,
    icons = true,
    mode = "document_diagnostics", -- default: mostra diagnostiche del buffer
    fold_open = "",
    fold_closed = "",
    group = true,
    padding = true,
    action_keys = { -- keymaps dentro la finestra Trouble
        close = "q",
        refresh = "r",
        jump = { "<cr>", "<tab>" },
    },
})
