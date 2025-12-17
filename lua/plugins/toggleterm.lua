-- lua/plugins/toggleterm.lua
local M = {}

function M.setup()
require("toggleterm").setup{
    direction = "horizontal", -- terminale in basso
    size = 08,                -- altezza dello split
    open_mapping = [[<leader>t]], -- scorciatoia per aprire/chiudere
    shade_terminals = true,
    start_in_insert = true,
}

-- Keymap extra: verticale
-- vim.keymap.set("n", "<leader>v", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Terminale verticale" })
-- Keymap extra: flottante
-- vim.keymap.set("n", "<leader>f", "<cmd>ToggleTerm direction=float<CR>", { desc = "Terminale flottante" })
end

return M
