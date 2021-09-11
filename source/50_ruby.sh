export PATH

# rbenv init.
PATH="$(path_remove $HOME/.rbenv/bin):$HOME/.rbenv/bin"

if [[ "$(type -P rbenv)" && ! "$(type -t _rbenv)" ]]; then
  eval "$(rbenv init -)"
fi
