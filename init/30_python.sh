# Initialize pyenv.
source $DOTFILES/source/50_python.sh

# Install pyenv
if [[ ! "~/.pyenv" ]]; then
  curl https://pyenv.run | bash
fi

grep --silent "~/.pyenv/bin" <<< $PATH || export PATH="~/.pyenv/bin:$PATH"

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
