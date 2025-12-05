-- /home/thefog/.config/nvim/lua/keymaps.lua
-- Keymaps
vim.keymap.set("i", "jj", "<Esc>", { noremap = false })

-- Toggle cheatsheet
vim.keymap.set("n", "<leader>x", function()
require("core.cheatsheet").toggle()
end, { desc = "Toggle Cheatsheet" })
