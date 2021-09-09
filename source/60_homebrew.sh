export PATH

grep --silent "~/.homebrew/bin" <<< $PATH || export PATH="/bin:$PATH"

# Homebrew on home
# ----------------------------------------------------------------------------
test -d ~/.homebrew && eval $(~/.homebrew/bin/brew shellenv)
