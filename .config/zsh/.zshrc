# Source prezto
if [[ -s "$CONFIG_DIR/zsh/prezto/init.zsh" ]]; then
  source "$CONFIG_DIR/zsh/prezto/init.zsh"
fi

# Source the individual components of the configuration
for CONFIG_COMPONENT in $CONFIG_DIR/zsh/components/*; do
  source $CONFIG_COMPONENT
done

# Source per-machine custom configuration configuration
if [[ -f $CONFIG_DIR/zsh/.zsh-custom ]]; then
  source $CONFIG_DIR/zsh/.zsh-custom
else
  echo "# Custom zsh configuration goes here" > $CONFIG_DIR/zsh/.zsh-custom
fi

export GPG_TTY=$(tty)
