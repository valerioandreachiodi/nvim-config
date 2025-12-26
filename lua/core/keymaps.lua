-- /home/thefog/.config/nvim/lua/keymaps.lua
-- Keymaps
vim.keymap.set("i", "jj", "<Esc>", { noremap = false })

-- Toggle cheatsheet
vim.keymap.set("n", "<leader>xc", function()
require("core.cheatsheet").toggle()
end, { desc = "Toggle Cheatsheet" })

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

-- Toggle paste mode con <leader>q
vim.keymap.set("n", "<leader>q", function()
    vim.opt.paste = not vim.opt.paste:get()
    if vim.opt.paste:get() then
        print("PASTE MODE ON")
    else
        print("PASTE MODE OFF")
    end
end, { noremap = true, silent = true, desc = "Toggle Paste Mode" })

-- markdown
vim.keymap.set("n", "<leader>a", "<cmd>MarkdownPreview<CR>", { desc = "Markdown Preview" })

