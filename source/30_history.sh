# History settings

# Allow use to re-edit a faild history substitution.
shopt -s histreedit
# History expansions will be verified before execution.
shopt -s histverify

# Entries beginning with space aren't added into history, and duplicate
# entries will be erased (leaving the most recent entry).
export HISTCONTROL="ignorespace:erasedups"
# Give history timestamps.
export HISTTIMEFORMAT="[ %d/%m/%y %T ] "
# Lots o' history.
export HISTSIZE=10000000
export HISTFILESIZE=10000000

[ -e "~/.local/share/bash/.bash_history" ] && export HISTFILE="~/.local/share/bash/.bash_history"

# Easily re-execute the last history command.
alias r="fc -s"
