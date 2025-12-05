-- /home/thefog/.config/nvim/lua/plugins/gitsigns.lua
-- ~/.config/nvim/lua/plugins/gitsigns.lua
require("gitsigns").setup({
    signcolumn = true,   -- mostra i segni nella sign column
    numhl      = true,   -- colora SOLO i numeri delle righe modificate
    signs = {
        add          = { text = "│" },
        change       = { text = "│" },
        delete       = { text = "▁" },
        topdelete    = { text = "▔" },
        changedelete = { text = "│" },
        untracked    = { text = "┆" },
    },
    watch_gitdir = { interval = 1000, follow_files = true },
})
