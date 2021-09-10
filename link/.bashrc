# If ZSH : Quit now !
# =============================================================================
if [[ -n "$ZSH_VERSION" ]]; then
  return 1 2> /dev/null || exit 1;
fi;

# Export DOTFILES
# =============================================================================
export DOTFILES=~/.dotfiles


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

# Fzf
# =============================================================================
[ -f ~/.fzf.bash ] && . ~/.fzf.bash


# Fasd
# ----------------------------------------------------------------------------
eval "$(fasd --init auto)"

#fasd_cache="$HOME/.cache/.fasd-init-bash"
#if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
#  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
#fi
#source "$fasd_cache"
#unset fasd_cache
