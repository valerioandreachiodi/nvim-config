-- :lua MiniNotify.show_history()

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
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

-- Configurazioni per ciascun server con la nuova API
vim.lsp.config("lua_ls", {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
               checkThirdParty = false,
            },
        },
    },
})

vim.lsp.config("rust_analyzer", { on_attach = on_attach })
vim.lsp.config("html",          { on_attach = on_attach })
vim.lsp.config("bashls",        { on_attach = on_attach })

-- Avvia automaticamente i server configurati
vim.lsp.start({
    name = "lua_ls",
    cmd = { "lua-language-server" },
    root_dir = vim.fs.root(0, { ".git", ".lua" }),
})
