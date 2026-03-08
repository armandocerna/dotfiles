# --- Zinit ---
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# --- Plugins (lazy-loaded) ---
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-history-substring-search

# --- Options ---
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
unsetopt AUTO_NAME_DIRS

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# --- Vi mode ---
bindkey -v
export KEYTIMEOUT=1

# --- Key bindings ---
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# --- Completions ---
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select

# --- fzf ---
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_OPTS="--color=fg:#c0caf5,bg:#1a1b26,hl:#bb9af7 --color=fg+:#c0caf5,bg+:#24283b,hl+:#7dcfff --color=info:#7aa2f7,prompt:#7dcfff,pointer:#bb9af7 --color=marker:#9ece6a,spinner:#bb9af7,header:#7aa2f7"

# --- kubectl ---
if (( $+commands[kubectl] )); then
  source <(kubectl completion zsh)
fi
[ -f ~/dotfiles/archive/aliases/kubectl ] && source ~/dotfiles/archive/aliases/kubectl

# --- Aliases ---
alias vim="nvim"
alias vi="nvim"
alias ws="cd ~/workspace"
alias k="kubectl"
alias kctx="kubectx"
alias kns="kubens"
alias watch="watch "
alias claude="claude --dangerously-skip-permissions"
alias c="claude --dangerously-skip-permissions"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  alias pbcopy="xsel -ib"
  alias pbpaste="xsel -b"
fi

# --- Functions ---
cpstat() {
  tar cf - "$1" | pv | (cd "$2"; tar xf -)
}


# --- Starship prompt ---
eval "$(starship init zsh)"
