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
})

vim.keymap.set("n", "<leader>e", function()
require("neo-tree.command").execute({ position = "left", toggle = true })
end, { desc = "Neo-tree sinistra" })

vim.keymap.set("n", "<leader>E", function()
require("neo-tree.command").execute({ position = "right", toggle = true })
end, { desc = "Neo-tree destra" })
