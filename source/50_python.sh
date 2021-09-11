export PATH

# pyenv init.
  PATH="$(path_remove $DOTFILES/link/.pyenv/bin):$DOTFILES/link/.pyenv/bin"

  if [[ "$(type -P pyenv)" ]]; then
    eval "$(pyenv init -)"
  fi
