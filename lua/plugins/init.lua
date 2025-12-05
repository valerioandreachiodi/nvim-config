-- /home/thefog/.config/nvim/lua/plugins/init.lua
-- Gestione plugin con lazy.nvim
require("lazy").setup({
    { "sainnhe/everforest",
        lazy = false,
        priority = 1000
    },

    { "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function() require("plugins.treesitter")
        end
    },

    { "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
        config = function() require("plugins.lsp")
        end
    },

    { "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" }, config = function() require("plugins.cmp")
        end
    },

    { "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
        config = function() require("plugins.neotree")
        end
    },

    { "lewis6991/gitsigns.nvim",
        config = function() require("plugins.gitsigns")
        end
    },
    {
        "echasnovski/mini.pairs",
        version = false,
        config = function()
        require("plugins.minipairs")
        end,
    },
    {
        "echasnovski/mini.completion",
        version = false,
        config = function()
        require("plugins.minicompletion")
        end,
    },
    {
        "echasnovski/mini.diff",
        version = false,
        config = function()
        require("plugins.minidiff")
        end,
    },

    {
        "echasnovski/mini.visits",
        version = false,
        config = function()
        require("plugins.minivisits")
        end,
    },
    {
        "echasnovski/mini.animate",
        version = false,
        config = function() require("plugins.minianimate") end,
    },
    {
        "echasnovski/mini.cursorword",
        version = false,
        config = function() require("plugins.minicursorword") end,
    },
    {
        "echasnovski/mini.hipatterns",
        version = false,
        config = function() require("plugins.minihipatterns") end,
    },
    {
        "echasnovski/mini.icons",
        version = false,
        config = function() require("plugins.miniicons") end,
    },
    {
        "echasnovski/mini.indentscope",
        version = false,
        config = function() require("plugins.miniindentscope") end,
    },
    {
        "echasnovski/mini.notify",
        version = false,
        config = function() require("plugins.mininotify") end,
    },
    {
        "echasnovski/mini.starter",
        version = false,
        config = function() require("plugins.ministarter") end,
    },
    {
        "echasnovski/mini.statusline",
        version = false,
        config = function() require("plugins.ministatusline") end,
    },
    {
        "echasnovski/mini.tabline",
        version = false,
        config = function() require("plugins.minitabline") end,
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
        require("plugins.telescope")
        end,
    },
    {
        "echasnovski/mini.ai",
        version = false,
        config = function()
        require("mini.ai").setup()
        end,
    },

})

