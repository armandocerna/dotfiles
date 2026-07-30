STOW_FLAGS := --target=$(HOME) --restow

# Packages are platform-scoped: niri (and its Wayland companions) are Linux-only,
# so stowing them on macOS would just litter ~/.config with dead directories.
COMMON_PACKAGES := zsh tmux nvim starship git ghostty wezterm
LINUX_PACKAGES  := niri

ifeq ($(shell uname),Darwin)
PACKAGES := $(COMMON_PACKAGES)
else
PACKAGES := $(COMMON_PACKAGES) $(LINUX_PACKAGES)
endif

BREW_PACKAGES := neovim tmux starship fzf fd ripgrep bat stow node go lua-language-server

PACMAN_PACKAGES := neovim tmux starship fzf fd ripgrep bat stow ghostty npm go lua-language-server base-devel niri waybar fuzzel swww mako grim slurp swaylock wl-clipboard brightnessctl playerctl

APT_PACKAGES := neovim tmux fzf fd-find ripgrep bat stow nodejs npm golang build-essential

.PHONY: install uninstall $(PACKAGES) deps deps-mac deps-arch deps-apt tpm zshrc

install: deps $(PACKAGES) zshrc tpm

# ~/.zshrc is deliberately NOT stowed. It is a real, unversioned file that
# sources the tracked config, so anything an installer appends with
# `>> ~/.zshrc` stays on this machine instead of dirtying this repo.
# Never overwrites an existing file.
#
# Migration note: on machines set up under the old layout ~/.zshrc is a SYMLINK
# into this repo, and the rename to .config/zsh/rc.zsh leaves it dangling. Test
# with -L as well as -e, because -e is FALSE for a dangling symlink and a plain
# `[ ! -e ]` guard would skip the repair and leave a broken shell.
zshrc:
	@if [ -L $(HOME)/.zshrc ]; then \
		rm $(HOME)/.zshrc; \
		echo "replaced stow-managed ~/.zshrc symlink (old layout)"; \
	elif [ -e $(HOME)/.zshrc ]; then \
		echo "$(HOME)/.zshrc exists, leaving it alone"; \
	fi
	@if [ ! -e $(HOME)/.zshrc ]; then \
		printf '%s\n' \
		  '# Tracked config lives in ~/.config/zsh/rc.zsh (stow-managed).' \
		  'source ~/.config/zsh/rc.zsh' \
		  '' \
		  '# Kept for machines migrated from the old layout.' \
		  '[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local' \
		  '' \
		  '# Everything below is machine-local -- installers append here.' \
		  > $(HOME)/.zshrc; \
		echo "created $(HOME)/.zshrc"; \
	fi

$(PACKAGES):
	stow $(STOW_FLAGS) $@

# tmux only: --no-folding keeps ~/.tmux a real directory. Without it stow folds
# ~/.tmux into a single symlink and `make tpm` clones tpm inside this repo.
tmux: STOW_FLAGS += --no-folding

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
