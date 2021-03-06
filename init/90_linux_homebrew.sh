# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew into PATH
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> ~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> ~/.profile

brew tap buo/cask-upgrade
brew tap neovim/neovim
brew tap universal-ctags/universal-ctags
brew tap homebrew/aliases
brew tap tgotwig/linux-dust

brew doctor
brew install dust
