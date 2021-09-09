# If ZSH : Quit now !
# =============================================================================
if [[ -n "$ZSH_VERSION" ]]; then
  return 1 2> /dev/null || exit 1;
fi;

# Export DOTFILES
# =============================================================================
export DOTFILES=~/.dotfiles

# Fzf
# =============================================================================
[ -f ~/.fzf.bash ] && . ~/.fzf.bash

# Source all files in "source"
# =============================================================================
function src() {
  local file
  if [[ "$1" ]]; then
    source "$DOTFILES/source/$1.sh"
  else
    for file in $DOTFILES/source/*; do
      source "$file"
    done
  fi
}

# Run dotfiles script, then source.
# =============================================================================
function dotfiles() {
  $DOTFILES/bin/dotfiles "$@" && src
}

src
