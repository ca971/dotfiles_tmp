# Exa (121, 75, 33)
# =============================================================================
# https://www.mankier.com/1/exa#Examples
command -v exa &>/dev/null && \
  export EXA_COLORS="\
  uu=38;5;226:\
  da=38;5;244:\
  in=38;5;239:\
  lp=38;5;81:\
  *.md=38;5;226:\
  *.log=38;5;248\
  "

# fzf
# =============================================================================
[ -n "$NVIM_LISTEN_ADDRESS" ] && export FZF_DEFAULT_OPTS=" \
  --ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

# Pager
# =============================================================================
if command -v most &>/dev/null; then
  export PAGER='most'
else
  export PAGER='less'
  export LESSCHARSET="UTF-8"
  export LESSHISTFILE='-'
  export LESSEDIT='vim ?lm+%lm. %f'
  export LESS='-F -g -i -M -R -S -w -X -z-4'
fi

# Highlight section titles in manual pages.
export LESS_TERMCAP_mb=$'\e[01;31m'      # begin blinking
export LESS_TERMCAP_md=$'\e[01;31m'      # begin bold
export LESS_TERMCAP_me=$'\e[0m'          # end mode
export LESS_TERMCAP_se=$'\e[0m'          # end standout-mode
export LESS_TERMCAP_so=$'\e[00;47;30m'   # begin standout-mode
export LESS_TERMCAP_ue=$'\e[0m'          # end underline
export LESS_TERMCAP_us=$'\e[01;32m'      # begin underline

# Pyenv
# =============================================================================
# pyenv-virtualenv: prompt changing will be removed from future release
if command -v pyenv > /dev/null; then
  export PYENV_ROOT="~/.pyenv"
fi

# Rbenv
# =============================================================================
if command -v rbenv > /dev/null; then
  export RBENV_ROOT="~/.rbenv"
fi

# SSH
# =============================================================================
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Tmux
# =============================================================================
command -v tmux &>/dev/null && \
  export DEFAULT_TMUX_SESSION="default"

# Terminal
# =============================================================================
export TERM="xterm-256color"

# Vagrant
# =============================================================================
command -v vagrant &>/dev/null && \
  export VAGRANT_VERSION=$(vagrant --version | cut -d " " -f 2)


# Xresources linux
# ---------------------------------------------------------
if [ is_linux -a -r "$HOME/.Xresources" ]; then
  command -v xrdb &>/dev/null 2>&1 && xrdb "$HOME/.Xresources"
fi
