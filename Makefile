STOW_FLAGS := --target=$(HOME) --restow

PACKAGES := zsh tmux nvim starship ghostty git wezterm

BREW_PACKAGES := neovim tmux starship fzf fd ripgrep bat stow

PACMAN_PACKAGES := neovim tmux starship fzf fd ripgrep bat stow ghostty

APT_PACKAGES := neovim tmux fzf fd-find ripgrep bat stow

.PHONY: install uninstall $(PACKAGES) deps deps-mac deps-arch deps-apt

install: deps $(PACKAGES)

$(PACKAGES):
	stow $(STOW_FLAGS) $@

uninstall:
	@for pkg in $(PACKAGES); do stow --target=$(HOME) --delete $$pkg; done

deps:
ifeq ($(shell uname),Darwin)
	$(MAKE) deps-mac
else ifneq ($(shell command -v yay 2>/dev/null),)
	yay -S --needed --noconfirm $(PACMAN_PACKAGES)
else ifneq ($(shell command -v pacman 2>/dev/null),)
	sudo pacman -S --needed --noconfirm $(PACMAN_PACKAGES)
else ifneq ($(shell command -v apt 2>/dev/null),)
	$(MAKE) deps-apt
else
	@echo "Unknown package manager. Install manually: $(PACMAN_PACKAGES)"
endif

deps-mac:
	@command -v brew >/dev/null || (echo "Install Homebrew first: https://brew.sh" && exit 1)
	brew install $(BREW_PACKAGES)
	@command -v ghostty >/dev/null || brew install --cask ghostty
	@command -v wezterm >/dev/null || brew install --cask wezterm

deps-apt:
	sudo apt update
	sudo apt install -y $(APT_PACKAGES)
	@echo "NOTE: starship and ghostty not in apt. Install manually:"
	@echo "  starship: curl -sS https://starship.rs/install.sh | sh"
	@echo "  ghostty:  https://ghostty.org/download"
