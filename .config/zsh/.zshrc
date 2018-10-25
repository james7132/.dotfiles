# Source custom elements
CONFIG_DIR=${ZDOTDIR:-HOME}
CUSTOM_PATH=$CONFIG_DIR/.zsh-custom
PREZTO_INIT="$CONFIG_DIR/prezto/init.zsh"

# Source prezto
if [[ -s $PREZTO_INIT ]]; then
  source $PREZTO_INIT
fi

# Source the individual components of the configuration
for CONFIG_COMPONENT in $CONFIG_DIR/components/*; do
  source $CONFIG_COMPONENT
done

# Source per-machine custom configuration configuration
if [[ -f $CUSTOM_PATH ]]; then
  source "$CUSTOM_PATH"
else
  echo "# Custom zsh configuration goes here" > $CUSTOM_PATH
fi
