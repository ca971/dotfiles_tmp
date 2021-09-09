export PATH

# pyenv init.
PATH="$(path_remove $DOTFILES/vendor/pyenv/bin):$DOTFILES/vendor/pyenv/bin"

if [[ "$(type -P pyenv)" ]] ; then
  eval "$(pyenv init -)"

  # pyenv-virtualenv: https://github.com/pyenv/pyenv-virtualenv
  command -v pyenv-virtualenv-init > /dev/null && eval "$(pyenv virtualenv-init -)"
fi
