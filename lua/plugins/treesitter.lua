-- /home/thefog/.config/nvim/lua/plugins/treesitter.lua
require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "rust", "html", "bash" },
    highlight        = { enable = true },
    indent           = { enable = true },
})
