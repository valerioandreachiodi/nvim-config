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

-- Trouble keybindings
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Toggle Trouble" })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { desc = "Document Diagnostics" })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "Workspace Diagnostics" })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { desc = "Quickfix List" })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { desc = "Location List" })
vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<cr>", { desc = "LSP References" })
-- In sintesi
-- <leader>xx = apri/chiudi Trouble
-- <leader>xd = diagnostiche del buffer corrente
-- <leader>xw = diagnostiche globali (workspace)
-- <leader>xq = quickfix list
-- <leader>xl = location list
-- gr = riferimenti LSP

-- Todo-comments keybindings
vim.keymap.set("n", "<leader>xt", "<cmd>TodoTelescope<cr>", { desc = "Search TODOs with Telescope" })
vim.keymap.set("n", "<leader>xT", "<cmd>TodoTrouble<cr>", { desc = "Open TODOs in Trouble" })
-- In sintesi
-- <leader>xt = cerca TODO con Telescope
-- <leader>xT = apri TODO in Trouble

-- MiniMap keybindings
-- Toggle ON/OFF
vim.keymap.set("n", "<leader>m", function()
require("mini.map").toggle()
end, { desc = "Toggle MiniMap" })



