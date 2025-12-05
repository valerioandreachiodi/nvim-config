-- lua/plugins/minihipatterns.lua
require("mini.hipatterns").setup({
    highlighters = {
        hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
        todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
    },
})
