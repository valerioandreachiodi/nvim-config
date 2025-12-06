# Neovim Config

Questa è la mia configurazione personale di **Neovim**.  
Il repository contiene i file Lua e le impostazioni che utilizzo ogni giorno per sviluppare, scrivere e sperimentare con Neovim.

## Struttura
- `init.lua` → entrypoint principale
- `lua/plugins/` → configurazioni dei plugin (es. LSP, mini.nvim, ecc.)
- `lua/core/` → opzioni di base, keymaps, autocmd
- `lazy-lock.json` → lockfile dei plugin gestiti da Lazy.nvim

## Plugin principali
- [lazy.nvim](https://github.com/folke/lazy.nvim) per la gestione dei plugin
- [mini.nvim](https://github.com/nvim-mini/mini.nvim) per starter screen, ai, surround, ecc.
- [mason.nvim](https://github.com/williamboman/mason.nvim) + [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) per LSP
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) per la ricerca
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) per l’explorer dei file

## Obiettivi
- Configurazione semplice ma potente
- Uso di Lua al posto di Vimscript
- Setup portabile e facilmente estendibile

## Installazione
Clona il repository nella tua cartella di configurazione Neovim:

```bash
git clone https://github.com/<tuo-username>/nvim ~/.config/nvim
