# -----------------------------------------------------------------------------
# Oh-My-Zsh Settings
# -----------------------------------------------------------------------------
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="theunraveler"

# Set the default text editor to vim
export EDITOR='vim'

# How often to update Oh-My-Zsh
export UPDATE_ZSH_DAYS=30

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files under VCS as dirty.
# This makes repository status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Change the command execution time in history
HIST_STAMPS="yyyy-mm-dd"

# Load plugins
plugins=(git virtualenv)

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Reuse Vim ZSH completions for vim completions
compdef _vim es

# User configuration

export PATH="/bin:/usr/bin:/usr/local/bin:${PATH}"

source $ZSH/oh-my-zsh.sh

# Compilation flags
export ARCH_FLAGS="-arch x86_64"

BASE_PATH=$(readlink -f ${(%):-%N})
DIR_PATH="$(dirname $BASE_PATH)"
#echo $DIR_PATH

for file in $DIR_PATH/.zsh/*; do
	#echo "Sourcing $file"
	source "$file"
done

# Source custom elements
CUSTOM_PATH=$HOME/.zsh-custom
if [[ -f $CUSTOM_PATH ]]; then
	#echo "Sourcing $CUSTOM_PATH"
	source "$CUSTOM_PATH"
else
	echo "# Custom zsh configuration goes here" > $CUSTOM_PATH
	echo "Creating custom configuration at $CUSTOM_PATH"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# For versioning my config files.
# See: https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias config='/usr/bin/git --git-dir=/usr/local/google/home/jamessliu/.cfg/ --work-tree=/usr/local/google/home/jamessliu'
