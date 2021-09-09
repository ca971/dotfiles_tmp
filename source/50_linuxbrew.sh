export PATH

# Linuxbrew
PATH="$(path_remove $DOTFILES/vendor/linuxbrew/bin):$DOTFILES/vendor/linuxbrew/bin"

# Homebrew on Linux
# ----------------------------------------------------------------------------
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
