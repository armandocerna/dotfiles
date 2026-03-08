# Environment variables
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export LESS='-F -g -i -M -R -w -z-4'
export LANG='en_US.UTF-8'

# Paths (deduplicated)
typeset -gU path
path=(
  $HOME/.local/bin
  $HOME/bin
  /usr/local/{bin,sbin}
  $path
)

# Go
export GOPATH=$HOME/workspace/go
path=($GOPATH/bin /usr/local/go/bin $path)

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
path=($PNPM_HOME $path)

# Capslock as ctrl
export XKB_DEFAULT_OPTIONS=ctrl:nocaps

# Temp files
if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi
