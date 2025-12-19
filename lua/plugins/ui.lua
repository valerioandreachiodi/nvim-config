-- lua/plugins/ui.lua
local Input = require("nui.input")
local event = require("nui.utils.autocmd").event

return {
    {
        -- Migliora vim.ui.select() (sostituisce Dressing)
        "nvim-telescope/telescope-ui-select.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
        require("telescope").setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({
                        previewer = false,
                        winblend = 10, -- trasparenza Everforest
                    })
                }
            }
        })
        require("telescope").load_extension("ui-select")
        end,
    },

    {
        -- Popup leggero per vim.ui.input()
        "MunifTanjim/nui.nvim",
        config = function()
        --- override vim.ui.input
        vim.ui.input = function(opts, on_confirm)
        local popup = Input({
            position = "50%",
            size = {
                width = 40,
            },
            border = {
                style = "rounded",
                text = {
                    top = opts.prompt or "Input",
                    top_align = "center",
                },
            },
            win_options = {
                winblend = 10, -- trasparenza Everforest
            },
        }, {
            prompt = "",
            default_value = opts.default or "",
            on_close = function()
            on_confirm(nil)
            end,
            on_submit = function(value)
            on_confirm(value)
            end,
        })

        popup:mount()

        popup:on(event.BufLeave, function()
        popup:unmount()
        end)
        end
        end,
    },
}
