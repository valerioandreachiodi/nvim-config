-- Definiamo una funzione che applica i colori
print("DEBUG: Il file dei colori è stato caricato!")

local function apply_my_custom_colors()
----------------------------------------------------------------------------
-- PALETTE EVERFOREST (Dark Hard)
----------------------------------------------------------------------------
-- Sfondi e Testo Base
local bg0     = "#272e33" -- Sfondo principale
local fg      = "#d3c6aa" -- Testo normale (Foreground)

-- Colori Accento (Quelli che userai di più)
local red     = "#e67e80" -- Errori, Costanti, Macro
local orange  = "#e69875" -- Keyword, Annotazioni
local yellow  = "#dbbc7f" -- Tipi, Classi
local green   = "#a7c080" -- Stringhe, Variabili
local aqua    = "#83c092" -- Funzioni, Metodi, Modificatori
local blue    = "#7fbbb3" -- Operatori, Parametri
local purple  = "#d699b6" -- Numeri, Booleani

-- Varianti Soft/Muted (Utili per commenti o elementi meno importanti)
local grey0   = "#7a8478" -- Commenti
local grey1   = "#859289"
local grey2   = "#9da9a0"
----------------------------------------------------------------------------
-- Yoru no Mori 夜の森
--bg-dark:   #1c1f1d;
--bg:        #232825;
--bg-hl:     #2c322f;
--fg:        #d2cbb8;
--fg-dim:    #b8b2a0;
--green:     #a7c080;
--yellow:    #d9b97a;
--orange:    #e39a6a;
--red:       #e67e80;
--blue:      #7fbbb3;
--purple:    #d699b6;
--crimson:   #b85c5c;
--steel:     #8a9aa0;
--.comment   { color: var(--fg-dim); font-style: italic; }
--.keyword   { color: var(--crimson); font-style: italic; }
--.fn        { color: var(--blue); font-weight: 600; }
--.type      { color: var(--yellow); }
--.string    { color: var(--green); }
--.number    { color: var(--orange); }
--.builtin   { color: var(--purple); }
--.param     { color: var(--fg); }
--.operator  { color: var(--fg); }
--.punct     { color: var(--fg); }
--.const     { color: var(--yellow); }
--.field     { color: var(--fg); }
--.namespace { color: var(--steel); }

----------------------------------------------------------------------------

local highlights = {
    -- Keyword e Funzioni
    ["@keyword.function"] = { fg = orange, bold = true },
    ["@keyword.rust"]          = { fg = orange },
    ["@keyword.type.rust"]     = { fg = orange, bold = true },
    ["@keyword.modifier.rust"] = { fg = aqua, italic = true },

    -- Tipi e Variabili
    ["@type.rust"]             = { fg = yellow },
    ["@variable.rust"]         = { fg = green },

    -- LSP (Semantic Tokens)
    ["@lsp.type.variable.rust"]            = { fg = green },
    ["@lsp.type.parameter.rust"]           = { fg = blue, italic = true }, -- Proviamo il blu per i parametri!
    ["@lsp.mod.mutable.rust"]              = { fg = green, underline = true },
    ["@lsp.typemod.variable.mutable.rust"] = { fg = green, underline = true },

    -- Costanti e Macro
    ["@constant.rust"]         = { fg = purple, bold = true },
    ["@lsp.type.enumMember.rust"] = { fg = purple },
    ["@function.macro.rust"]   = { fg = red },

    -- Esempio per Stringhe e Commenti (se vuoi sovrascriverli)
    -- ["String"] = { fg = green },
    -- ["Comment"] = { fg = grey0, italic = true },
}

for group, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, settings)
    end
    end

    -- 1. Eseguilo subito (nel caso il tema sia già carico)
    apply_my_custom_colors()

    -- 2. Mantieni l'autocomando (nel caso tu cambi tema a runtime o venga ricaricato)
    local my_colors_group = vim.api.nvim_create_augroup("CustomEverforest", { clear = true })
    vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "everforest",
        group = my_colors_group,
        callback = apply_my_custom_colors,
    })
