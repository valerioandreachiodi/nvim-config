-- lua/plugins/ministarter.lua
require("mini.starter").setup({
    items = {
        { action = "enew", name = "New File", section = "Files" }, -- nuovo file
        { action = "edit ~/.config/nvim/init.lua", name = "Config", section = "Config" },
        { action = "Lazy sync", name = "Update Plugins", section = "Plugins" },
    },
    header = "Ciao Valerio, bentornato!",
})
