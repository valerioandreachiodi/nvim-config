-- lua/plugins/ui.lua
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
                        winblend = 10, -- trasparenza leggera stile Everforest
                        border = true,
                    })
                }
            }
        })
        require("telescope").load_extension("ui-select")
        end,
    },
}
