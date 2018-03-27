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
alias vza='vim ~/.zsh/aliases.sh'
alias vzc='vim ~/.zsh-custom'
alias vt='vim ~/.tmux.conf'
alias vs='sudo -E vim'

# Tmux Aliases
tmx() {
  tmux attach -t $1 || tmux new -s $1
}

# Git Aliases
alias gs='git status'
alias gaa='git add --all'
alias gca='git commit -a'

