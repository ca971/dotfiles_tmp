# Initialize asdf
source $DOTFILES/source/50_asdf.sh

plugins=(
  ag
  bat
  docker-compose-v1
  doctl
  exa
  fzf
  github-cli
  java
  jq
  kubectl
  make
  mysql
  neovim
  nodejs
  peco
  perl
  php
  python
  R
  ripgrep
  ruby
  terraform
  tmux
  yarn
)

for p in ${plugins[@]}
do
  [[ "$(type -P vim)" ]] && asdf plugin add $p
done
unset p plugins

