# Makefile per setup Neovim config modulare

NVIM_CONFIG_DIR = $(HOME)/.config/nvim
LUA_DIR = $(NVIM_CONFIG_DIR)/screenshots
LUA_DIR = $(NVIM_CONFIG_DIR)/lua
PLUGINS_DIR = $(LUA_DIR)/plugins
CORE_DIR = $(LUA_DIR)/core

FILES = \
	$(NVIM_CONFIG_DIR)/init.lua \
	$(NVIM_CONFIG_DIR)/README.md \
	$(LUA_DIR)/lsp.lua
	$(CORE_DIR)/cheatsheet.lua \
	$(CORE_DIR)/everforest.lua \
	$(CORE_DIR)/tokyonight.lua \
	$(CORE_DIR)/keymaps.lua \
	$(CORE_DIR)/options.lua \
	$(PLUGINS_DIR)/init.lua \
	$(PLUGINS_DIR)/cmp.lua \
	$(PLUGINS_DIR)/lazygit.lua \
	$(PLUGINS_DIR)/lsp.lua \
	$(PLUGINS_DIR)/luasnip.lua \
	$(PLUGINS_DIR)/minianimate.lua \
	$(PLUGINS_DIR)/minicompletion.lua \
	$(PLUGINS_DIR)/minicursorword.lua \
	$(PLUGINS_DIR)/minidiff.lua \
	$(PLUGINS_DIR)/minifiles.lua \
	$(PLUGINS_DIR)/minihipatterns.lua \
	$(PLUGINS_DIR)/miniicons.lua \
	$(PLUGINS_DIR)/miniindentscope.lua \
	$(PLUGINS_DIR)/mininotify.lua \
	$(PLUGINS_DIR)/minipairs.lua \
	$(PLUGINS_DIR)/ministarter.lua \
	$(PLUGINS_DIR)/ministatusline.lua \
	$(PLUGINS_DIR)/minitabline.lua \
	$(PLUGINS_DIR)/minivisits.lua \
	$(PLUGINS_DIR)/neotree.lua \
	$(PLUGINS_DIR)/telescope.lua \
	$(PLUGINS_DIR)/treesitter.lua \

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
