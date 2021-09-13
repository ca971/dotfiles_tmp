# Shortcuts
# =============================================================================
alias q='exit' # function exit()
alias e='vi'
alias b='subl'
alias c='clear'  # To clear in iterm : <C-l>
alias g='git'
#alias j='jobs' # Jump is bind to 'j'
alias rmf='rm -rf'
alias mkdir='mkdir -pv'
alias pip="pip3"

is_zsh && alias h='fc -El 0' || alias h='history'

alias grep='grep -n --color'

is_zsh && alias hgrep='fc -El 0 | grep' || alias hgrep='history | grep'

alias egrep='egrep --color=auto'

if is_zsh; then
  alias -s html=vim
  alias -g G=' | grep -i'
  alias -g L=' | less'
  alias -g GG='google.com'
fi

# Print each PATH entry on a separate line
alias path="echo -e ${PATH//:/\\n}"

alias df='df -hPH | column -t'

# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/common-aliases
alias NUL='> /dev/null 2>&1'

# List files
# =============================================================================
# Use exa, if it is available
if command -v exa >/dev/null; then
  # general use
  EXA_OPTIONS='--icons'
  alias ll='exa -lGh'
  alias ls='exa -h $EXA_OPTIONS'
  alias lsa='exa -ah $EXA_OPTIONS'
  alias l='exa -labhGF --time-style long-iso --git $EXA_OPTIONS'
  alias li='exa -labhiGF --time-style long-iso --git $EXA_OPTIONS'
  alias ll='exa -labhF --git --time-style long-iso $EXA_OPTIONS'
  alias lh='ls -lh (*|.*)(@)'
  alias llh='ls -lah | grep "^l"'
  alias llm='exa -lbhGd --git --sort=modified $EXA_OPTIONS'
  alias la='exa -lbhHigUmuSa --time-style long-iso --git --color-scale'
  alias lx='exa -lbhHigUmuSa@ --time-style long-iso --git --color-scale'
  # specialty views
  alias lS='exa -1'
  alias lt='exa --tree --level=2'
#else
#  alias ll='ls -laFh --time-style "+%d-%h-%Y %H:%M"'
#  alias l='ls -CF'
#  alias la='ls -ah'
fi

alias tree='tree -C'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

# Directory
# =============================================================================
alias cd..='cd ..'
function chdir() {
  if [ "${1}" = "" ]; then
    cd ~
  elif [ "${1}" = "-" ]; then
    popd
  else
    cd "${1}"
  fi
  ls -lahG
}
alias cd=chdir

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias -- -='cd -'

alias 1='cd -'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'

alias md='function _md(){ mkdir -p "$1"; cd "$1"; };_md'
alias mcd='function _mcd(){ mkdir -p "$1"; cd "$1"; };_mcd'
alias mdc='mkdir "$(date +"%d-%m-%Y à %H:%M:%S")"'
alias cdc='cd "$(date +"%d-%m-%Y à %H:%M:%S")"'
alias mdd='mkdir "$(date +"%d-%m-%Y")"'
alias cdd='cd "$(date +"%d-%m-%Y")"'
alias mdj='mkdir "$(date +%A)"'
alias cdj='cd "$(date +%A)"'
alias mdjn='mkdir "$(date +%d)"'
alias cdjn='cd "$(date +%d)"'
alias mdm='mkdir "$(date +%B)"'
alias cdm='cd "$(date +%B)"'
alias mdmn='mkdir "$(date +%m)"'
alias cdmn='cd "$(date +%m)"'
alias mdy='mkdir "$(date +%Y)"'
alias cdy='cd "$(date +%Y)"'

# Directory
# =============================================================================
if command -v nvim >/dev/null 2<&1; then
  alias vi='nvim'
  alias vimdiff='nvim -d'
else
  alias vi='vim'
fi

# Git
# =============================================================================

# Grc
# =============================================================================

cmds=(
  blkid
  configure
  df
  diff
  du
  env
  free
  fdisk
  findmnt
  make
  gcc
  g++
  id
  ip
  iptables
  as
  gas
  ld
  lsof
  lsblk
  lspci
  netstat
  ping
  traceroute
  traceroute6
  head
  tail
  dig
  mount
  ps
  mtr
  semanage
  getsebool
  ifconfig
)

for cmd in "${cmds[@]}"; do
  type "${cmd}" >/dev/null 2>&1 && alias "${cmd}"="$( which grc ) --colour=auto ${cmd}"
done
unset cmd cmds


#if command -v grc > /dev/null; then
#  GRC="$(which grc)"
#  alias colourify="$GRC -es --colour=auto"
#  alias blkid='colourify blkid'
#  alias configure='colourify ./configure'
#  alias df='colourify df'
#  alias diff='colourify diff'
#  alias du='colourify du'
#  alias env='colourify env'
#  alias free='colourify free'
#  alias fdisk='colourify fdisk'
#  alias findmnt='colourify findmnt'
#  alias make='colourify make'
#  alias gcc='colourify gcc'
#  alias g++='colourify g++'
#  alias id='colourify id'
#  alias ip='colourify ip'
#  alias iptables='colourify iptables'
#  alias as='colourify as'
#  alias gas='colourify gas'
#  alias ld='colourify ld'
#  alias lsof='colourify lsof'
#  alias lsblk='colourify lsblk'
#  alias lspci='colourify lspci'
#  alias netstat='colourify netstat'
#  alias ping='colourify ping'
#  alias traceroute='colourify traceroute'
#  alias traceroute6='colourify traceroute6'
#  alias head='colourify head'
#  alias tail='colourify tail'
#  alias dig='colourify dig'
#  alias mount='colourify mount'
#  alias ps='colourify ps'
#  alias mtr='colourify mtr'
#  alias semanage='colourify semanage'
#  alias getsebool='colourify getsebool'
#  alias ifconfig='colourify ifconfig'
#fi

# Update
# =============================================================================
is_osx && alias up=" \
  brew update;
  brew upgrade;
  brew cu -ay;
  brew cleanup;
  mas upgrade;
  rbenv update;
  pyenv update;
  gem update --system;
  vi +PlugUpdate +PlugUpgrade +CocUpdate +qall;
  nvm install node --latest-npm;
  nvm ls;
  nvm clear-cache;
  yarn global upgrade --latest;
  python -m pip install --upgrade pip setuptools;
  pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U  --use-feature=2020-resolver;
  softwareupdate -i;
  "

# Include custom aliases
[[ -f ~/.aliases.local ]] && source ~/.aliases.local

# vim: set ft=bash:
