# Initialize rbenv.
source $DOTFILES/source/60_linuxbrew.sh

# Install linuxbrew
[ -d "~/.linuxbrew" ] || bash -c "$(sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
