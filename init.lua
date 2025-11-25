-- ~/.config/nvim/init.lua

-- per clippord weiland
-- sudo apt install wl-clipboard

-- frase di Benvenuto
vim.cmd([[echo "Ciao Valerio, bentornato. Inchiodali tutti !"]])


-- https://www.youtube.com/watch?v=z4eA2eC28qg&t=230s
vim.keymap.set("i", "jj", "<Esc>", { noremap = false})


-- 1) True color
vim.opt.termguicolors = true

-- Usa la Barra Spaziatrice come <leader>
vim.g.mapleader      = " "
vim.g.maplocalleader = " "

-- Abilita numeri di linea assoluti
vim.opt.number = true

-- Abilita numeri di linea relativi
vim.opt.relativenumber = false

-- abilitiamo il mouse
vim.o.mouse = "a"

-- Toggle cheatsheet con <leader>x
vim.keymap.set("n", "<leader>x", function()
require("cheatsheet").toggle()
end, { desc = "Toggle Cheatsheet" })


-- 2) Bootstrap lazy.nvim
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


-- 3) Plugin management
require("lazy").setup({




  -- 3.1 Tema Everforest
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = "soft"
      vim.cmd("colorscheme everforest")
    end,
  },

  -- 3.2 mini.nvim: autopairs, surround, comment, indent, move, map
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.pairs").setup()
      require("mini.surround").setup()
      require("mini.comment").setup()
      require("mini.indentscope").setup()
      require("mini.move").setup()
      end,
  },

  -- 3.3 Treesitter per Lua, Rust, HTML e Bash
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "rust", "html", "bash" },
        highlight        = { enable = true },
        indent           = { enable = true },
      })
    end,
  },

  -- 3.4 LSP + Mason
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer", "html", "bashls" },
      })

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K",  vim.lsp.buf.hover,      opts)
      end

      local lspconfig = require("lspconfig")
      for _, server in ipairs({ "lua_ls", "rust_analyzer", "html", "bashls" }) do
        lspconfig[server].setup({ on_attach = on_attach })
      end
    end,
  },

  -- 3.5 Autocompletamento con nvim-cmp + LuaSnip
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp     = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"]      = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer"   },
          { name = "luasnip"  },
        }),
      })
    end,
  },

  -- 3.6 Neo-tree file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        popup_border_style   = "rounded",
        default_component_configs = {
          indent = {
            padding = 1,
            with_markers = true,
            indent_size = 2,
          },
          icon = {
            folder_closed = "",
            folder_open   = "",
            folder_empty  = "ﰊ",
          },
        },
        filesystem = {
          filtered_items = {
            hide_dotfiles    = false,
            hide_gitignored  = true,
          },
        },
      })

      vim.keymap.set("n", "<leader>e", function()
        require("neo-tree.command").execute({ position = "left", toggle = true })
      end, { desc = "Neo-tree sinistra" })

      vim.keymap.set("n", "<leader>E", function()
        require("neo-tree.command").execute({ position = "right", toggle = true })
      end, { desc = "Neo-tree destra" })
    end,
  },

  -- 3.7 GitSigns
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

})


