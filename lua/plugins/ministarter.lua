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
    items = {
        { action = "enew", name = "New File", section = "Files" },
        -- { action = "edit ~/.config/nvim/init.lua", name = "Config", section = "Config" },
        { action = "Lazy sync", name = "Update Plugins", section = "Plugins" },
        { action = "Telescope oldfiles", name = "Open files", section = "Old ones" },
        { action = "qa", name = "Quit", section = "Session" },
    },
    header = table.concat(header_lines, "\n"),
})

