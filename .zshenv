export CONFIG_DIR=$HOME/.config
export ZDOTDIR=$CONFIG_DIR/zsh
export VIMINIT="source $CONFIG_DIR/vim/vimrc"

export EDITOR=`which vim`
export VISUAL="$EDITOR"

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
