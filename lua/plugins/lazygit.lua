-- Configurazione LazyGit per Neovim
-- Assicurati di avere lazygit installato sul sistema (brew, apt, pacman, ecc.)

-- Mappa tasto <leader>lg per aprire LazyGit
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Apri LazyGit" })

-- Puoi anche aggiungere altre scorciatoie se vuoi:
-- vim.keymap.set("n", "<leader>gc", "<cmd>LazyGitConfig<cr>", { desc = "LazyGit Config" })
-- vim.keymap.set("n", "<leader>gp", "<cmd>LazyGitPull<cr>", { desc = "LazyGit Pull" })
