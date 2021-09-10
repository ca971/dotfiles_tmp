[[ "$1" != init && ! -e ~/.homebrew ]] && return 1

grep --silent "~/.homebrew/bin" <<< $PATH || export PATH="~/.homebrew/bin:$PATH"

# Homebrew on home
# ----------------------------------------------------------------------------
test -d ~/.homebrew && eval $(~/.homebrew/bin/brew shellenv)
