-- ~/.config/nvim/lua/plugins/telescope.lua

local builtin = require("telescope.builtin")

require("telescope").setup({
    defaults = {
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 10,
    },
})

-- Keymaps per Telescope
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Trova file" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Grep nel progetto" })
vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Lista buffer" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags,  { desc = "Help tags" })
