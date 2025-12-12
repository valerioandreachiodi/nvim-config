-- /home/thefog/.config/nvim/lua/plugins/neotree.lua
require("neo-tree").setup({
    close_if_last_window = true,
    popup_border_style   = "rounded",
    filesystem = {
        filtered_items = {
            hide_dotfiles   = false,
            hide_gitignored = true,
        },
    },
       default_component_configs = {
        indent = {
            with_markers = true,            -- mostra i marker di indentazione (│ └)
            indent_marker = "│",            -- carattere per l'indentazione
            last_indent_marker = "└",       -- carattere finale
            expander_collapsed = "▶",      -- freccia chiusa (puoi usare ▶)
            expander_expanded = "▼",       -- freccia aperta (puoi usare ▼)
            expander_highlight = "NeoTreeExpander",
        },
    },
})

vim.keymap.set("n", "<leader>e", function()
require("neo-tree.command").execute({ position = "left", toggle = true })
end, { desc = "Neo-tree sinistra" })

vim.keymap.set("n", "<leader>E", function()
require("neo-tree.command").execute({ position = "right", toggle = true })
end, { desc = "Neo-tree destra" })
