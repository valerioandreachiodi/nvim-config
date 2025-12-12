-- Tema Everforest
-- ~/.config/nvim/lua/core/colorscheme.lua

vim.g.everforest_background = "soft"
vim.g.everforest_enable_italic = 1  -- abilita italic nel tema

local ok, _ = pcall(vim.cmd, "colorscheme everforest")
if not ok then
    vim.notify("Everforest non trovato, uso default", vim.log.levels.WARN)
    end

    local function apply_italic_overrides()
    -- Gruppi classici
    vim.api.nvim_set_hl(0, "Comment", { italic = true })
    vim.api.nvim_set_hl(0, "Keyword", { italic = true })

    -- Tree-sitter groups (modern syntax highlighting)
    vim.api.nvim_set_hl(0, "@comment",             { italic = true })
    vim.api.nvim_set_hl(0, "@keyword",             { italic = true })
    vim.api.nvim_set_hl(0, "@keyword.function",    { italic = true })
    vim.api.nvim_set_hl(0, "@keyword.operator",    { italic = true })
    vim.api.nvim_set_hl(0, "@conditional",         { italic = true })
    vim.api.nvim_set_hl(0, "@repeat",              { italic = true })
    vim.api.nvim_set_hl(0, "@operator",            { italic = true })

    -- Linguaggi specifici
    -- Generici
    vim.api.nvim_set_hl(0, "@keyword.return",      { italic = true })
    vim.api.nvim_set_hl(0, "@keyword.import",      { italic = true })
    vim.api.nvim_set_hl(0, "@keyword.exception",   { italic = true })

    -- Rust
    vim.api.nvim_set_hl(0, "@keyword.rust",        { italic = true })
    vim.api.nvim_set_hl(0, "@keyword.modifier.rust",{ italic = true }) -- pub, mut, etc.

    -- HTML
    vim.api.nvim_set_hl(0, "@tag",                 { italic = true })
    vim.api.nvim_set_hl(0, "@tag.attribute",       { italic = true })
    vim.api.nvim_set_hl(0, "@tag.delimiter",       { italic = true })

    -- Python
    vim.api.nvim_set_hl(0, "@keyword.python",      { italic = true })
    vim.api.nvim_set_hl(0, "@keyword.import.python",{ italic = true })
    vim.api.nvim_set_hl(0, "@keyword.exception.python",{ italic = true })

    -- CSS
    vim.api.nvim_set_hl(0, "@property.css",        { italic = true })
    vim.api.nvim_set_hl(0, "@type.css",            { italic = true })
    vim.api.nvim_set_hl(0, "@keyword.css",         { italic = true })

    -- Bash
    vim.api.nvim_set_hl(0, "@keyword.bash",        { italic = true })
    vim.api.nvim_set_hl(0, "@function.bash",       { italic = true })

    -- Lua
    vim.api.nvim_set_hl(0, "@keyword.lua",         { italic = true })
    vim.api.nvim_set_hl(0, "@keyword.function.lua",{ italic = true })

    -- JavaScript / TypeScript
    vim.api.nvim_set_hl(0, "@keyword.javascript",  { italic = true })
    vim.api.nvim_set_hl(0, "@keyword.operator.javascript",{ italic = true })
    vim.api.nvim_set_hl(0, "@keyword.import.javascript",{ italic = true })
    vim.api.nvim_set_hl(0, "@keyword.return.javascript",{ italic = true })
    vim.api.nvim_set_hl(0, "@keyword.tsx",         { italic = true })
    end

    apply_italic_overrides()

    vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "everforest",
        callback = apply_italic_overrides,
    })
