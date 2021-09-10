# pyenv init.
export PYENV_ROOT="~/.pyenv"
grep --silent "~/.pyenv/bin" <<< $PATH || export PATH="~/.pyenv/bin:$PATH"

[[ "$(type -P pyenv)" ]] && eval "$(pyenv init -)"
command -v pyenv-virtualenv-init > /dev/null && eval "$(pyenv virtualenv-init -)"
