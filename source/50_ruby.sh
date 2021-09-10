[[ "$1" != init && ! -e ~/.rbenv ]] && return 1

export PATH

# pyenv init.
export RBENV_ROOT=~/.rbenv
grep --silent "$RBENV_ROOT/bin" <<< $PATH || export PATH="$RBENV_ROOT/bin:$PATH"

if [[ -e /etc/profile.d/rvm.sh ]]; then
  # rvm init
  source /etc/profile.d/rvm.sh
else
  # rbenv init.
  PATH="$(path_remove ~/.rbenv/bin):~/.rbenv/bin"

  if [[ "$(type -P rbenv)" && ! "$(type -t _rbenv)" ]]; then
    eval "$(rbenv init -)"
  fi
fi
