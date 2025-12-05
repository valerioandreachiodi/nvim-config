local M = {}
local buf, win

local cheatsheet_lines = {
  "  Cheatsheet Neovim (mini.nvim + Lazy)",
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
  "  Ctrl-d / Ctrl-u → Salta giù / su mezza pagina",
  "  Ctrl-f / Ctrl-b → Salta giù / su una pagina intera",
  "",
  "  File & Buffer",
  "  <leader>w       → Salva file",
  "  <leader>q       → Chiudi buffer",
  "  <leader>bn/bp   → Buffer successivo / precedente",
  "",
  "  Neo-tree",
  "  <leader>e       → Apri/chiudi file explorer a sinistra",
  "  <leader>E       → Apri/chiudi file explorer a destra",
  "  o               → Apri/chiudi directory o file",
  "  s               → Apri in split verticale",
  "  i               → Apri in split orizzontale",
  "  t               → Apri in nuova tab",
  "  a               → Aggiungi file/directory",
  "  r               → Rinomina",
  "  d               → Elimina",
  "  c               → Copia",
  "  x               → Taglia",
  "  p               → Incolla",
  "  q               → Chiudi Neo-tree",
  "",
  "  Telescope",
  "  <leader>ff      → Trova file",
  "  <leader>fg      → Live grep (ricerca testo)",
  "  <leader>fb      → Lista buffer aperti",
  "  <leader>fh      → Help tags",
  "  <leader>fo      → File recenti (oldfiles)",
  "  <leader>fs      → Cerca parola sotto il cursore",
  "  <leader>fd      → Diagnostica LSP",
  "  <leader>fr      → Riferimenti LSP",
  "  <leader>fD      → Definizioni LSP",
  "",
  "  Editing",
  "  yy / dd         → Copia / Taglia riga",
  "  p / P           → Incolla dopo / prima",
  "  x               → Cancella carattere",
  "  u / Ctrl-r      → Undo / Redo",
  "",
  "  Terminale",
  "  :terminal       → Apri terminale in una finestra",
  "  Ctrl-w N        → Torna in modalità normale nel terminale",
  "  i               → Torna in modalità inserimento nel terminale",
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

    vim.api.nvim_win_set_option(win, "winhl", "Normal:NormalFloat,FloatBorder:FloatBorder")

    -- Highlight automatico
    for i, line in ipairs(cheatsheet_lines) do
      if line:match("") or line:match("") or line:match("")
        or line:match("") or line:match("") or line:match("")
        or line:match("") or line:match("") or line:match("") then
        vim.api.nvim_buf_add_highlight(buf, -1, "Error", i-1, 0, -1)
        elseif line:match("→") then
          vim.api.nvim_buf_add_highlight(buf, -1, "String", i-1, 0, -1)
          end
          end
          end
          end

          return M
