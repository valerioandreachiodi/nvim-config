-- /home/thefog/.config/nvim/init.lua
-- ~/.config/nvim/init.lua

-- Messaggio di benvenuto
vim.cmd([[echo "Ciao Valerio, bentornato. Inchiodali tutti !"]])

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
    end
    vim.opt.rtp:prepend(lazypath)

    -- Carica moduli
    -- Carico prima opzioni e keymaps
    require("core.options")
    require("core.keymaps")
    require("core.autocmds")

    -- Poi carico i plugin
    require("plugins")

    -- Solo dopo imposto il colorscheme
    require("core.colorscheme")
   
