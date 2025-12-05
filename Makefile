# Makefile per setup Neovim config modulare

NVIM_CONFIG_DIR = $(HOME)/.config/nvim
LUA_DIR = $(NVIM_CONFIG_DIR)/lua
PLUGINS_DIR = $(LUA_DIR)/plugins

FILES = \
	$(NVIM_CONFIG_DIR)/init.lua \
	$(LUA_DIR)/options.lua \
	$(LUA_DIR)/keymaps.lua \
	$(PLUGINS_DIR)/init.lua \
	$(PLUGINS_DIR)/everforest.lua \
	$(PLUGINS_DIR)/treesitter.lua \
	$(PLUGINS_DIR)/lsp.lua \
	$(PLUGINS_DIR)/cmp.lua \
	$(PLUGINS_DIR)/neotree.lua \
	$(PLUGINS_DIR)/gitsigns.lua \
	$(LUA_DIR)/lsp.lua

setup:
	@echo "📂 Creazione struttura Neovim..."
	@mkdir -p $(PLUGINS_DIR)
	@for f in $(FILES); do \
		if [ ! -f $$f ]; then \
			echo "Creazione $$f"; \
			echo "-- $$f" > $$f; \
		fi \
	done
	@echo "✅ Struttura completata!"
