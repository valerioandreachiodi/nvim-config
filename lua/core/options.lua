-- /home/thefog/.config/nvim/lua/options.lua
-- Opzioni di base
vim.opt.number          = true
vim.opt.relativenumber  = false
vim.opt.termguicolors   = true
vim.o.mouse             = "a"

-- Leader
vim.g.mapleader      = " "
vim.g.maplocalleader = " "

-- numero di spazi mostrati per un tab
vim.opt.tabstop = 4

-- numero di spazi usati per indentare con > e <
vim.opt.shiftwidth = 4

-- usa spazi invece di tab reali
vim.opt.expandtab = true

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
    vim.api.nvim_set_hl(0, "MiniStarterHeader", { link = "Function" })
    vim.api.nvim_set_hl(0, "MiniStarterItem", { link = "Type" })
    vim.api.nvim_set_hl(0, "MiniStarterItemBullet", { link = "Comment" })
    vim.api.nvim_set_hl(0, "MiniStarterSection", { link = "Statement" })
    vim.api.nvim_set_hl(0, "MiniStarterFooter", { link = "Boolean" })
    vim.api.nvim_set_hl(0, "MiniStarterItemPrefix", { link = "Identifier" })
    end,
})

-- Identificatori e variabili
--
-- Identifier → di solito azzurrino/blu
--
-- Function → verde chiaro
--
-- Statement → arancione
--
-- Keyword → arancione/ocra
--
-- Type → giallo
--
-- Constant → viola
--
-- Number → viola/rosa
--
-- Boolean → viola
--
-- String → verde (lo stai già usando)
--
-- Struttura e commenti
--
-- Comment → rosso corsivo
--
-- Special → giallo/ocra
--
-- Todo → evidenziato (spesso giallo su sfondo)
--
-- UI / interfaccia
--
-- Title → verde brillante
--
-- Error → rosso acceso
--
-- WarningMsg → giallo
--
-- MoreMsg → verde
--
-- Question → blu
--
-- Directory → blu
--
-- Search → evidenziato giallo
--
-- Visual → sfondo diverso

