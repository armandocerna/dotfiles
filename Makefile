STOW_FLAGS := --target=$(HOME) --restow

PACKAGES := zsh tmux nvim starship ghostty git wezterm niri

BREW_PACKAGES := neovim tmux starship fzf fd ripgrep bat stow node go lua-language-server

PACMAN_PACKAGES := neovim tmux starship fzf fd ripgrep bat stow ghostty npm go lua-language-server base-devel niri waybar fuzzel swww mako grim slurp swaylock wl-clipboard brightnessctl playerctl

APT_PACKAGES := neovim tmux fzf fd-find ripgrep bat stow nodejs npm golang build-essential

.PHONY: install uninstall $(PACKAGES) deps deps-mac deps-arch deps-apt tpm

install: deps $(PACKAGES) tpm

$(PACKAGES):
	stow $(STOW_FLAGS) $@

tpm:
	@if [ ! -d $(HOME)/.tmux/plugins/tpm ]; then \
		git clone https://github.com/tmux-plugins/tpm $(HOME)/.tmux/plugins/tpm; \
	fi

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
	-brew install --cask ghostty 2>/dev/null
	-brew install --cask wezterm 2>/dev/null

deps-apt:
	sudo apt update
	sudo apt install -y $(APT_PACKAGES)
	@echo "NOTE: starship and ghostty not in apt. Install manually:"
	@echo "  starship: curl -sS https://starship.rs/install.sh | sh"
	@echo "  ghostty:  https://ghostty.org/download"
