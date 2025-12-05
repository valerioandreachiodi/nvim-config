-- Tema Everforest
-- ~/.config/nvim/lua/core/colorscheme.lua

vim.g.everforest_background = "soft"

local ok, _ = pcall(vim.cmd, "colorscheme everforest")
if not ok then
    vim.notify("Everforest non trovato, uso default", vim.log.levels.WARN)
    end

    -- Colore base dei numeri (righe non modificate)
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#a7c080" })

    -- Numeri per righe tracciate da gitsigns
    vim.api.nvim_set_hl(0, "GitSignsAddNr",       { fg = "#a7c080", bg = "NONE", bold = true }) -- verde (aggiunte)
    vim.api.nvim_set_hl(0, "GitSignsChangeNr",    { fg = "#e67e80", bg = "NONE", bold = true }) -- rosso (modifiche)
    vim.api.nvim_set_hl(0, "GitSignsDeleteNr",    { fg = "#e67e80", bg = "NONE", bold = true }) -- rosso (cancellazioni)
    vim.api.nvim_set_hl(0, "GitSignsUntrackedNr", { fg = "#dbbc7f", bg = "NONE", bold = true }) -- giallo (non tracciato)
