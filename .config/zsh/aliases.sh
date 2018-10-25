##################################################################
# General Aliases
##################################################################

# Always start tmux in 256 color mode
alias tmux="tmux -2"

# Get more verbose and accurate ls output
alias ls='ls -lah --color --group-directories-first'

alias sz='source ~/.zshrc'

# Quick access to config files and vim.
alias v='vim .'
alias vd='vim ~/.dotfiles'
alias vv='vim ~/.vimrc'
alias vz='vim ~/.zshrc'
alias vza='vim ~/.config/zsh/aliases.sh'
alias vzc='vim ~/.zsh-custom'
alias vt='vim ~/.tmux.conf'
alias vs='sudo -E vim'

# Git Aliases
alias gs='git status'
alias gaa='git add --all'
alias gca='git commit -a'
