command -v vim && export VISUAL=vim

# If nvim is installed, use it instead of native vim
if [[ "$(which nvim)" ]]; then
    VISUAL="nvim"
    alias vim="$VISUAL"
    alias v="$VISUAL"
fi

export EDITOR="$VISUAL"
