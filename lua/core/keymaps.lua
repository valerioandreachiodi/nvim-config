-- /home/thefog/.config/nvim/lua/keymaps.lua
-- Keymaps
vim.keymap.set("i", "jj", "<Esc>", { noremap = false })

-- Toggle cheatsheet
vim.keymap.set("n", "<leader>x", function()
require("core.cheatsheet").toggle()
end, { desc = "Toggle Cheatsheet" })

-- Salta 10 righe giù con Alt-j
vim.keymap.set("n", "<A-j>", "10j", { noremap = true, silent = true })

-- Salta 10 righe su con Alt-k
vim.keymap.set("n", "<A-k>", "10k", { noremap = true, silent = true })

