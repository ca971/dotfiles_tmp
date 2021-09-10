# Source Homebrew
source $DOTFILES/source/60_homebrew.sh

#eval $(~/.homebrew/bin/brew shellenv)

# Install Homebrew
if [[ ! -d "~/.homebrew" ]]; then
  git clone https://github.com/Homebrew/brew.git ~/.homebrew 
  grep --silent "~/.homebrew/bin" <<< $PATH || export PATH="~/.homebrew/bin:$PATH"

  brew tap buo/cask-upgrade
  brew tap jakewmeyer/geo
  brew tap neovim/neovim
  brew tap universal-ctags/universal-ctags
  brew tap homebrew/aliases
fi
