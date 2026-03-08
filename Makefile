STOW_FLAGS := --target=$(HOME) --restow

PACKAGES := zsh tmux nvim starship ghostty git wezterm

.PHONY: install uninstall $(PACKAGES)

install: $(PACKAGES)

$(PACKAGES):
	stow $(STOW_FLAGS) $@

uninstall:
	@for pkg in $(PACKAGES); do stow --target=$(HOME) --delete $$pkg; done
