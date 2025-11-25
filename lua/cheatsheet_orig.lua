-- cheatsheet.lua
local M = {}
local buf, win

-- Contenuto della cheatsheet (puoi modificarlo liberamente)
local cheatsheet_lines = {
  "󰊠  Cheatsheet Neovim (mini.nvim + Lazy)",
  "",
  "  Modalità",
  "  i        → Inserisci",
  "  v        → Visuale",
  "  :        → Comando",
  "  Esc      → Normale",
  "",
  "  Movimenti",
  "  h / j / k / l   → Sinistra / Giù / Su / Destra",
  "  w / e / b       → Avanza / Fine / Indietro parola",
  "  0 / ^ / $       → Inizio / Primo / Fine riga",
  "  gg / G          → Inizio / Fine file",
  "  %               → Vai a parentesi corrispondente",
  "",
  "  File & Buffer",
  "  <leader>w       → Salva file",
  "  <leader>q       → Chiudi buffer",
  "  <leader>bn/bp   → Buffer successivo / precedente",
  "  <leader>e       → File explorer",
  "",
  "  Editing",
  "  yy / dd         → Copia / Taglia riga",
  "  p / P           → Incolla dopo / prima",
  "  x               → Cancella carattere",
  "  u / Ctrl-r      → Undo / Redo",
  "",
  "  Ricerca",
  "  /testo          → Cerca avanti",
  "  n / N           → Ripeti ricerca",
  "  :%s/a/b/g       → Sostituisci tutto",
  "",
  "  Macro",
  "  q[a-z]          → Inizia registrazione",
  "  q               → Ferma registrazione",
  "  @[a-z]          → Esegui macro",
  "",
  "  Finestre & Tab",
  "  <leader>sv/sh   → Split verticale / orizzontale",
  "  Ctrl-w h/j/k/l  → Muovi tra finestre",
  "  <leader>tn/tp   → Nuova tab / tab precedente",
}

-- Funzione toggle
function M.toggle()
  if win and vim.api.nvim_win_is_valid(win) then
    vim.api.nvim_win_close(win, true)
    buf, win = nil, nil
  else
    buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, cheatsheet_lines)

    -- Evidenziazione stile NvChad
    vim.api.nvim_set_option_value("buftype", "nofile", { buf = buf })
    vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf })
    vim.api.nvim_set_option_value("modifiable", false, { buf = buf })

    local width = math.floor(vim.o.columns * 0.6)
    local height = math.floor(vim.o.lines * 0.7)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    win = vim.api.nvim_open_win(buf, true, {
      relative = "editor",
      width = width,
      height = height,
      row = row,
      col = col,
      style = "minimal",
      border = "rounded",
    })

    -- Colori stile NvChad
    vim.api.nvim_win_set_option(win, "winhl", "Normal:NormalFloat,FloatBorder:FloatBorder")
  end
end

return M
