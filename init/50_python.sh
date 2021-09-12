# Initialize pyenv.
source $DOTFILES/source/50_python.sh

# Install pyenv.
if [[ "$(type -P pyenv)" ]]; then
  versions=(3.9.7)

  pythons=($(setdiff "${versions[*]}" "$(pyenv whence python)"))
  if (( ${#pythons[@]} > 0 )); then
    e_header "Installing pyenv versions: ${pythons[*]}"
    for n in "${pythons[@]}"; do
      pyenv install "$n"
      [[ "$n" == "${versions[0]}" ]] && pyenv global "$n"
    done
  fi
fi
