##################################################################
# General Aliases
##################################################################

# Always start tmux in 256 color mode
alias tmux='tmux -2 -f $CONFIG_DIR/tmux/tmux.conf'

# Get more verbose and accurate ls output
alias ls='ls -lah --color --group-directories-first'

alias sz='source ${ZDOTDIR:-HOME}/.zshrc'

# Quick access to config files and vim.
alias v='vim .'
alias vv='vim $CONFIG_DIR/vim/vimrc'
alias vz='vim ${ZDOTDIR:-HOME}/.zshrc'
alias vzc='vim ${ZDOTDIR:-HOME}/.zsh-custom'
alias vza='vim ${ZDOTDIR:-HOME}/components/aliases.sh'
alias vt='vim ~/.tmux.conf'
alias vs='sudo -E vim'

# Git Aliases
alias gs='git status'
alias gaa='git add --all'
alias gca='git commit -a'

# For versioning my config files.
# See: https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
