export PATH

# rbenv init.
PATH="$(path_remove $DOTFILES/link/.rbenv/bin):$DOTFILES/link/.rbenv/bin"

if [[ "$(type -P rbenv)" && ! "$(type -t _rbenv)" ]]; then
  eval "$(rbenv init -)"
fi
