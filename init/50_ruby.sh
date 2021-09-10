# Initialize rbenv.
source $DOTFILES/source/50_ruby.sh

# Install rbenv
if [[ ! "~/.rbenv" ]]; then
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
fi

grep --silent "~/.rbenv/bin" <<< $PATH || export PATH="~/.rbenv/bin:$PATH"

# Install Ruby.
if [[ "$(type -P rbenv)" ]]; then
  versions=(3.0.2)

  rubies=($(setdiff "${versions[*]}" "$(rbenv whence ruby)"))
  if (( ${#rubies[@]} > 0 )); then
    e_header "Installing Ruby versions: ${rubies[*]}"
    for r in "${rubies[@]}"; do
      rbenv install "$r"
      [[ "$r" == "${versions[0]}" ]] && rbenv global "$r"
    done
  fi
fi
