" Execute this command in nvim (:help nvim-from-vim)
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
