if type -q ssh-agent
  if not pgrep -u "$USER" ssh-agent > /dev/null
    ssh-agent -c -t 1h > "$XDG_RUNTIME_DIR/ssh-agent-$USER.env"
  end
  if not set -q SSH_AUTH_SOCK
    eval $(cat "$XDG_RUNTIME_DIR/ssh-agent-$USER.env") > /dev/null
  end
end

if status is-interactive
  fish_config theme choose dracula | source
  fish_config prompt choose scales | source

  if type -q helix
    set -gx EDITOR "helix"
    alias hx="helix"
  else if type -q vim
    set -gx EDITOR "vim"
  end
  set -gx VISUAL "$EDITOR"

  if type -q zoxide
    zoxide init fish | source
    alias cd="z"
  end

  if type -q eza
    alias ls="eza -lah --color --group-directories-first"
  else
    alias ls="ls -lah --color --group-directories-first"
  end

  # For versioning my config files.
  # See: https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
  if set -q XDG_CONFIG_HOME
    alias config="/usr/bin/git --git-dir=$XDG_CONFIG_HOME/.cfg/ --work-tree=$HOME"
  else
    alias config="/usr/bin/git --git-dir=$HOME/.config/.cfg/ --work-tree=$HOME"
  end
end

if type -q freshfetch
  freshfetch
else if type -q neofetch
  neofetch
end
