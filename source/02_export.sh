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
command -v most &>/dev/null && \
  export PAGER='most'

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
