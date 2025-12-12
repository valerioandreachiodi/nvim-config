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
  "  Scorrimento & Posizionamento",
  "  Ctrl-f / Ctrl-b → Scendi / sali di una pagina intera",
  "  Ctrl-d / Ctrl-u → Scendi / sali di mezza pagina",
  "  H / M / L       → Porta il cursore in alto / mezzo / basso dello schermo",
  "  10j / 20j       → Scendi di 10 / 20 righe",
  "  10k / 20k       → Sali di 10 / 20 righe",
  "  Alt-j           → Salta 10 righe giù (mapping personalizzato)",
  "  Alt-k           → Salta 10 righe su (mapping personalizzato)",
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
  "  Mini.diff",
  "  :DiffToggle     → Attiva/disattiva la visualizzazione diff",
  "  :DiffUpdate     → Aggiorna il diff corrente",
  "  :DiffAdd        → Aggiungi file al diff",
  "  :DiffRemove     → Rimuovi file dal diff",
  "",
  "  Mini.files",
  "  -               → Apri file explorer minimalista",
  "  <CR>            → Apri file/directory",
  "  q               → Chiudi explorer",
  "  h/l             → Naviga indietro/avanti directory",
  "",
  "  Mini.visits",
  "  :VisitsAdd      → Aggiungi file corrente alla lista visite",
  "  :VisitsList     → Mostra file visitati di recente",
  "  :VisitsRemove   → Rimuovi file dalla lista visite",
  "",
  "  Mini.notify",
  "  :Notify 'msg'   → Mostra notifica con messaggio",
  "  :NotifyClear    → Cancella notifiche",
  "",
  "  Mini.starter",
  "  Appare all’avvio con menu personalizzabile",
  "  f               → Trova file",
  "  q               → Chiudi Neovim",
  "  r               → File recenti",
  "",
  "  Mini.ai (Text Objects)",
  "  vi( / va(       → Interno / esterno parentesi tonde",
  "  vi[ / va[       → Interno / esterno parentesi quadre",
  "  vi{ / va{       → Interno / esterno parentesi graffe",
  "  vi\" / va\"     → Interno / esterno virgolette",
  "  vi' / va'       → Interno / esterno apici",
  "  vaf             → Seleziona funzione intera (Treesitter)",
  "  vai             → Seleziona argomento",
  "  vat             → Seleziona tag HTML/XML",
  "  va<Space>       → Seleziona blocco di spazi consecutivi",
  "  va?             → Seleziona fino al punto interrogativo",
  "  vaW / viW       → Interno / esterno parola intera",
  "",
  "  Git (Gitsigns + LazyGit)",
  "  ]c / [c         → Vai a hunk successivo / precedente",
  "  <leader>hs      → Stage hunk",
  "  <leader>hr      → Reset hunk",
  "  <leader>hp      → Preview hunk",
  "  <leader>hb      → Blame linea",
  "  <leader>hu      → Undo stage hunk",
  "  <leader>lg      → Apri LazyGit",
  "",
  "  Linting (nvim-lint)",
  "  :lua require('lint').try_lint() → Esegui linting sul file corrente",
  "",
  "  Trouble.nvim",
  "  <leader>xx      → Toggle Trouble",
  "  <leader>xw      → Workspace diagnostics",
  "  <leader>xd      → Document diagnostics",
  "  <leader>xq      → Quickfix list",
  "  <leader>xl      → Location list",
  "",
  "  Surround (mini.surround)",
  "  sa{motion}{char} → Aggiungi surround",
  "  sd{motion}{char} → Rimuovi surround",
  "  sr{motion}{char} → Sostituisci surround",
  "  sdb / srb        → Rimuovi / sostituisci surround bilanciato",
  "",
  "  Substitution (Spectre)",
  "  <leader>sr      → Apri Spectre",
  "  :Spectre        → Apri interfaccia di sostituzione",
  "",
  "  Dressing.nvim",
  "  Migliora UI per input/select (nessuna shortcut dedicata, si attiva automaticamente)",
  "",
  "  Which-key",
  "  <leader>        → Mostra menu dei keybindings disponibili",
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

    -- Colore blu stile Everforest per il titolo
    vim.api.nvim_set_hl(0, "CheatsheetTitle", { fg = "#7fbbb3", bold = true })
    vim.api.nvim_buf_add_highlight(buf, -1, "CheatsheetTitle", 0, 0, -1)

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
        or line:match("") or line:match("") or line:match("")
        or line:match("") or line:match("") then
        vim.api.nvim_buf_add_highlight(buf, -1, "Error", i-1, 0, -1)
        elseif line:match("") then
          -- questo diventa giallo
          vim.api.nvim_buf_add_highlight(buf, -1, "WarningMsg", i-1, 0, -1)
        elseif line:match("") then
          -- questo diventa un altro colore, ad esempio blu
          vim.api.nvim_buf_add_highlight(buf, -1, "Identifier", i-1, 0, -1)
        elseif line:match("→") then
          vim.api.nvim_buf_add_highlight(buf, -1, "String", i-1, 0, -1)
          end
          end
          end
          end

          return M
