-- /home/thefog/.config/nvim/lua/plugins/init.lua
-- Gestione plugin con lazy.nvim

require("lazy").setup({
    -- Temi
    { "sainnhe/everforest", lazy = false, priority = 1000 },
    { "folke/tokyonight.nvim", lazy = false, priority = 1000 },

    -- UI e Utility
    {
        "folke/twilight.nvim",
        config = function() require("plugins.twilight") end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function() require("plugins.treesitter") end
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
        config = function() require("plugins.neotree") end
    },
    { "folke/which-key.nvim", config = function() require("plugins.whichkey") end },
                      { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, config = function() require("plugins.todo") end },
                      { "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, config = function() require("plugins.trouble") end },
                      { "nvim-pack/nvim-spectre", dependencies = { "nvim-lua/plenary.nvim" }, config = function() require("plugins.spectre") end },
                      { import = "plugins.ui" },

                      -- LSP, Completamento e Linting
                      {
                          "neovim/nvim-lspconfig",
                          dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
                          config = function()
                          require("plugins.lsp")

                          -- Nuova sintassi Neovim 0.11+ per evitare warning di deprecazione
                          vim.lsp.config("gdscript", {})
                          vim.lsp.config("alive", {}) -- 'alive' è il server per Common Lisp su Mason

                          vim.lsp.enable("gdscript")
                          vim.lsp.enable("alive")
                          end
                      },
                      {
                          "hrsh7th/nvim-cmp",
                          dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
                          config = function() require("plugins.cmp") end
                      },
                      { "mfussenegger/nvim-lint", config = function() require("plugins.lint") end },

                      -- Mini.nvim modules
                      { "echasnovski/mini.pairs", version = false, config = function() require("plugins.minipairs") end },
                      { "echasnovski/mini.completion", version = false, config = function() require("plugins.minicompletion") end },
                      { "echasnovski/mini.diff", version = false, config = function() require("plugins.minidiff") end },
                      { "echasnovski/mini.files", version = false, config = function() require("plugins.minifiles") end },
                      { "echasnovski/mini.visits", version = false, config = function() require("plugins.minivisits") end },
                      { "echasnovski/mini.animate", version = false, config = function() require("plugins.minianimate") end },
                      { "echasnovski/mini.cursorword", version = false, config = function() require("plugins.minicursorword") end },
                      { "echasnovski/mini.hipatterns", version = false, config = function() require("plugins.minihipatterns") end },
                      { "echasnovski/mini.icons", version = false, config = function() require("plugins.miniicons") end },
                      { "echasnovski/mini.indentscope", version = false, config = function() require("plugins.miniindentscope") end },
                      { "echasnovski/mini.notify", version = false, config = function() require("plugins.mininotify") end },
                      { "echasnovski/mini.starter", version = false, config = function() require("plugins.ministarter") end },
                      { "echasnovski/mini.statusline", version = false, config = function() require("plugins.ministatusline") end },
                      { "echasnovski/mini.tabline", version = false, config = function() require("plugins.minitabline") end },
                      { "echasnovski/mini.comment", version = false, config = function() require("mini.comment").setup() end },
                      { "echasnovski/mini.ai", version = false, config = function() require("mini.ai").setup() end },
                      { "echasnovski/mini.surround", version = false, config = function() require("plugins.minisurround") end },
                      { import = "plugins.mini_map" },

                      -- Navigazione e Git
                      {
                          "nvim-telescope/telescope.nvim",
                          branch = "0.1.x",
                          dependencies = { "nvim-lua/plenary.nvim" },
                          config = function() require("plugins.telescope") end
                      },
                      { "lewis6991/gitsigns.nvim", config = function() require("plugins.gitsigns") end },
                      {
                          "kdheepak/lazygit.nvim",
                          dependencies = { "nvim-lua/plenary.nvim" },
                          config = function() require("plugins.lazygit") end
                      },

                      -- Terminale e Markdown
                      {
                          "akinsho/toggleterm.nvim",
                          version = "*",
                          config = function() require("plugins.toggleterm").setup() end,
                      },
                      {
                          "iamcco/markdown-preview.nvim",
                          ft = { "markdown" },
                          build = "cd app && npm install",
                          config = function() require("plugins.markdown-preview") end,
                      },

                      -- ############################################################
                      -- SEZIONE LISP
                      -- sbcl --eval '(ql:quickload :swank)' --eval '(swank:create-server :port 4005 :dont-close t)'
                      -- ############################################################
                      {
                          "Olical/conjure",
                      ft = { "common-lisp", "lisp" },
                      config = function()
                      -- Collega Conjure al server Swank di SBCL
                      vim.g["conjure#filetype#common_lisp"] = "conjure.client.common_lisp.swank"
                      -- RIMUOVI I LIMITI DI TAGLIO (Aggiungi queste righe)
                      vim.g["conjure#log#truncate#max_size"] = 0 -- 0 significa nessun limite
                      vim.g["conjure#extract#tree_sitter#max_lines"] = 0
                      end,
                      },
                      {
                          "eraserhd/parinfer-rust",
                      build = "cargo build --release", -- Sfrutta Rust per la velocità
                      ft = { "common-lisp", "lisp" },
                      },
})
