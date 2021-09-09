# Initialize rbenv.
source $DOTFILES/source/50_linuxbrew.sh

# Install linuxbrew
[ -d "~/.linuxbrew" ] || bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
