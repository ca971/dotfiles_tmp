# Initialize pyenv.
source $DOTFILES/source/50_python.sh

# Install volta if necessary
if [[ ! "~/.pyenv" ]]; then
  curl https://pyenv.run | bash
  export PYENV_ROOT="~/.pyenv"
  grep --silent "$PYENV_ROOT/bin" <<< $PATH || export PATH="$PYENV_ROOT/bin:$PATH"
fi

# Install Python
if [[ "$(type -P pyenv)" ]]; then
  versions=(3.9.7)

  pythons=($(setdiff "${versions[*]}" "$(pyenv whence python)"))
  if (( ${#pythons[@]} > 0 )); then
    e_header "Installing Python versions: ${pythons[*]}"
    for p in "${pythons[@]}"; do
      pyenv install "$p"
      [[ "$p" == "${versions[0]}" ]] && pyenv global "$p"
    done
  fi
fi
