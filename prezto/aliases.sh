alias vim="nvim"
alias vi="nvim"
alias ws="cd ~/workspace"
alias k="kubectl"
alias kctx="kubectx"
alias kns="kubens"
alias watch="watch "

# Linux specifc aliases
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias pbcopy="xsel -ib"
    alias pbpaste="xsel -b"
fi
