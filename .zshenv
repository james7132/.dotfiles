export CONFIG_DIR=$HOME/.config
export ZDOTDIR=$CONFIG_DIR/zsh

if command -v helix > /dev/null; then
  export EDITOR=`which helix`
else
  export EDITOR=`which vim`
fi
export VISUAL="$EDITOR"

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
