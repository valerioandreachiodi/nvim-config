-- ~/.config/nvim/lua/core/autocmds.lua

-- ~/.config/nvim/lua/core/autocmds.lua

-- Colora i numeri in base allo stato del buffer
vim.api.nvim_create_autocmd("BufModifiedSet", {
    callback = function()
    if vim.bo.modified then
        -- Buffer modificato → rosso
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#e67e80" })
        else
            -- Buffer salvato → verde
            vim.api.nvim_set_hl(0, "LineNr", { fg = "#a7c080" })
            end
            end,
})

