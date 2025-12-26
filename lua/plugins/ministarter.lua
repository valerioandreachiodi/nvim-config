-- lua/plugins/ministarter.lua
local header_lines = {
    [[                                                                       ]],
    [[                                                                     ]],
    [[       ████ ██████           █████      ██                     ]],
    [[      ███████████             █████                             ]],
    [[      █████████ ███████████████████ ███   ███████████   ]],
    [[     █████████  ███    █████████████ █████ ██████████████   ]],
    [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
    [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
    [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
    [[                                                                       ]],
}
local starter = require("mini.starter")

starter.setup({
    header = table.concat(header_lines, "\n"),
              items = {
                  { action = "Telescope find_files", name = "  Find File                               (f)⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣤⣀⣀", section = "Commands" },
              { action = "ene | startinsert", name = "  New File                                (n)⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀", section = "Commands" },
              { action = "Telescope live_grep", name = "  Find Text                               (g)⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦", section = "Commands" },
              { action = "Telescope oldfiles", name = "  Recent Files                            (r)⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣿⣿⣿⡆", section = "Commands" },
              { action = "edit " .. vim.fn.stdpath("config"), name = "  Config                                  (c)⠀⠀⠀⠀⢿⣿⠿⠿⠿⠿⣿⣿⣿⡏⠀⠀⠀⢹⣿⡇", section = "Commands" },
              { action = "SessionRestore", name = "  Restore Session                         (s)⠀⠀⠀⠀⠘⣿⣧⣄⣀⣴⣿⣿⣿⣷⣄⣀⣠⣾⣟⠀", section = "Commands" },
              { action = "Lazy", name = "󰒲  Lazy                                    (l)⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣏⣼⣌⣿⣿⣿⣿⣿⡟", section = "Commands" },
              { action = "qa", name = "  Quit                                    (q)⠀⠀⠀⠀⠀⠀⠉⠉⢿⣿⣿⣿⣿⣿⣿⡏⠉⠁", section = "Commands" },
              { action = "Telescope keymaps", name = "  Keymaps                                 (k)⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⠁⠁⠉⠈⠀⠀⠀", section = "Commands" },
              },
})

-- Keybindings valid solo nella dashboard
vim.api.nvim_create_autocmd("User", {
    pattern = "MiniStarterOpened",
    callback = function()
    local map = function(lhs, rhs)
    vim.keymap.set("n", lhs, rhs, { buffer = 0 })
    end
    map("f", "<cmd>Telescope find_files<cr>")
    map("n", "<cmd>ene | startinsert<cr>")
    map("g", "<cmd>Telescope live_grep<cr>")
    map("r", "<cmd>Telescope oldfiles<cr>")
    map("c", "<cmd>edit " .. vim.fn.stdpath("config") .. "<cr>")
    map("s", "<cmd>SessionRestore<cr>")
    map("l", "<cmd>Lazy<cr>")
    map("q", "<cmd>qa<cr>")
    map("k", "<cmd>Telescope keymaps<cr>")
    end,
})

