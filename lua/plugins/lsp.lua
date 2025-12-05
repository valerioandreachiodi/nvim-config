-- /home/thefog/.config/nvim/lua/plugins/lsp.lua
-- ~/.config/nvim/lua/plugins/lsp.lua

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "rust_analyzer", "html", "bashls" },
})

local on_attach = function(_, bufnr)
local opts = { buffer = bufnr, remap = false }
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "K",  vim.lsp.buf.hover,      opts)
end

-- nuova API: vim.lsp.config
local servers = { "lua_ls", "rust_analyzer", "html", "bashls" }
for _, server in ipairs(servers) do
    vim.lsp.config(server, {
        on_attach = on_attach,
    })
    end

    -- avvia i server
    vim.lsp.start({
        name = "lua_ls",
        cmd = { "lua-language-server" },
        root_dir = vim.fs.root(0, { ".git", ".lua" }),
    })
