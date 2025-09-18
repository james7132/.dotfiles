##################################################################
# General Aliases
##################################################################

# Always start tmux in 256 color mode
alias tmux='tmux -2'

# Get more verbose and accurate ls output
# Use eza if available
if which eza > /dev/null; then
  alias ls='eza -lah --color --group-directories-first'
else
  alias ls='ls -lah --color --group-directories-first'
fi

alias sz='source ${ZDOTDIR:-HOME}/.zshrc'

# Shorten Helix
alias hx='helix'

# Quick access to config files and vim.
alias v='vim .'
alias vv='vim $HOME/.vim/vimrc'
alias vz='vim ${ZDOTDIR:-HOME}'
alias vzc='vim ${ZDOTDIR:-HOME}/.zsh-custom'
alias vza='vim ${ZDOTDIR:-HOME}/components/aliases.sh'
alias vt='vim ~/.config/tmux/tmux.conf'
alias vs='sudo -E vim'

# Git Aliases
alias gs='git status'
alias gaa='git add --all'
alias gca='git commit -a'

# For versioning my config files.
# See: https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias config='/usr/bin/git --git-dir=$CONFIG_DIR/.cfg/ --work-tree=$HOME'
