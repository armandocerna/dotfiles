alias vim="nvim"
alias vi="nvim"
alias ws="cd ~/workspace"
alias k="kubectl"
alias kctx="kubectx"
alias kns="kubens"
alias watch="watch "
alias claude="claude --dangerously-skip-permissions"
alias c="claude --dangerously-skip-permissions"

# Linux specifc aliases
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  alias pbcopy="xsel -ib"
  alias pbpaste="xsel -b"
fi
