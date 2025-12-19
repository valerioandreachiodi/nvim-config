-- lua/plugins/todo.lua
require("todo-comments").setup({
    signs = true, -- mostra icone nel gutter
    keywords = {
        TODO = { icon = " ", color = "info" },
        FIX  = { icon = " ", color = "error" },
        NOTE = { icon = " ", color = "hint" },
    },
    highlight = {
        before = "", keyword = "wide", after = "fg",
    },
    search = {
        command = "rg",
        args = { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column" },
    },
})
