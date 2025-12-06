-- ~/.config/nvim/lua/core/linenr_kate.lua
-- Kate-style: barra "│" verde per linee aggiunte, rossa per linee modificate.
-- Minimal, con gruppo di segni dedicato, priorità bassa, senza toccare GitSigns.

local M = {}

-- Gruppi HL dedicati (non toccano GitSigns)
local HL_ADDED   = "KateHLAdded"
local HL_CHANGED = "KateHLChanged"

-- Segni e gruppo
local SIGN_GROUP   = "KateSignGroup"
local SIGN_ADDED   = "KateSignAdded"
local SIGN_CHANGED = "KateSignChanged"

-- Priorità bassa: GitSigns tipicamente usa 6–10; noi restiamo a 3
local SIGN_PRIORITY = 3

-- Colori Everforest
local COLOR_GREEN = "#a7c080"
local COLOR_RED   = "#e67e80"

-- Snapshot per buffer: mappa bufnr -> array di righe salvate
local snapshots = {}

local function setup_hl_and_signs()
-- HL dedicati
vim.api.nvim_set_hl(0, HL_ADDED,   { fg = COLOR_GREEN })
vim.api.nvim_set_hl(0, HL_CHANGED, { fg = COLOR_RED })

-- Definisci segni (una volta sola è ok; ripetere è idempotente)
vim.fn.sign_define(SIGN_ADDED, {
    text = "│",
    texthl = HL_ADDED,
    numhl = "", -- non alterare i numeri di riga
})
vim.fn.sign_define(SIGN_CHANGED, {
    text = "│",
    texthl = HL_CHANGED,
    numhl = "",
})
end

local function build_snapshot(bufnr)
if not vim.api.nvim_buf_is_loaded(bufnr) then return end
    snapshots[bufnr] = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    end

    local function clear_signs(bufnr)
    -- Pulisce SOLO i nostri segni
    vim.fn.sign_unplace(SIGN_GROUP, { buffer = bufnr })
    end

    local function place_sign(bufnr, lnum, name)
    vim.fn.sign_place(0, SIGN_GROUP, name, bufnr, { lnum = lnum, priority = SIGN_PRIORITY })
    end

    local function update(bufnr)
    if not vim.api.nvim_buf_is_loaded(bufnr) then return end
        local saved = snapshots[bufnr]
        if not saved then return end

            local current = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
            local maxln = math.max(#current, #saved)

            clear_signs(bufnr)

            for i = 1, maxln do
                local cur = current[i]
                local old = saved[i]
                if old == nil and cur ~= nil then
                    -- linea nuova oltre lo snapshot
                    place_sign(bufnr, i, SIGN_ADDED)
                    elseif old ~= nil and cur ~= nil and cur ~= old then
                        -- linea modificata
                        place_sign(bufnr, i, SIGN_CHANGED)
                        end
                        -- linee cancellate non possono mostrare un segno (non esistono più)
                        end
                        end

                        local function setup_autocmds()
                        local aug = vim.api.nvim_create_augroup("KateStyleMinimal", { clear = true })

                        -- Snapshot iniziale quando il buffer è pronto
                        vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
                            group = aug,
                            callback = function(args)
                            build_snapshot(args.buf)
                            clear_signs(args.buf)
                            end,
                        })

                        -- Aggiorna indicatori quando il testo cambia (normale/insert)
                        vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
                            group = aug,
                            callback = function(args)
                            update(args.buf)
                            end,
                        })

                        -- Dopo il salvataggio: aggiorna snapshot e pulisci indicatori
                        vim.api.nvim_create_autocmd("BufWritePost", {
                            group = aug,
                            callback = function(args)
                            build_snapshot(args.buf)
                            clear_signs(args.buf)
                            end,
                        })

                        -- Pulizia quando il buffer viene distrutto
                        vim.api.nvim_create_autocmd("BufWipeout", {
                            group = aug,
                            callback = function(args)
                            snapshots[args.buf] = nil
                            clear_signs(args.buf)
                            end,
                        })
                        end

                        function M.setup()
                        setup_hl_and_signs()
                        setup_autocmds()
                        -- facoltativo: assicurati che la signcolumn sia visibile
                        vim.opt.signcolumn = "yes"
                        end

                        return M
