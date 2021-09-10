[[ "$1" != init && ! -e ~/.pyenv ]] && return 1

# pyenv init.
export PYENV_ROOT=~/.pyenv
grep --silent "$PYENV_ROOT/bin" <<< $PATH || export PATH="$PYENV_ROOT/bin:$PATH"

[[ "$(type -P pyenv)" ]] && eval "$(pyenv init -)"
command -v pyenv-virtualenv-init > /dev/null && eval "$(pyenv virtualenv-init -)"
