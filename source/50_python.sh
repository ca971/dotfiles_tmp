export PATH

# pyenv init.
  PATH="$(path_remove $HOME/.pyenv/bin):$HOME/.pyenv/bin"

  if [[ "$(type -P pyenv)" ]]; then
    eval "$(pyenv init -)"
  fi
