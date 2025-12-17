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

-- Twilight keybindings
vim.keymap.set("n", "<leader>z", "<cmd>Twilight<CR>", { desc = "Toggle Twilight" })
-- vim.keymap.set("n", "<leader>tw", "<cmd>Twilight<CR>", { desc = "Toggle Twilight" })
-- vim.keymap.set("n", "<leader>te", "<cmd>TwilightEnable<CR>", { desc = "Enable Twilight" })
-- vim.keymap.set("n", "<leader>td", "<cmd>TwilightDisable<CR>", { desc = "Disable Twilight" })
-- In sintesi
-- Toggle = interruttore (accende/spegne con lo stesso tasto).
-- Enable = accende sempre.
-- Disable = spegne sempre.


