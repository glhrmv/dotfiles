# *************************
#     __               __
#    / /_  ____ ______/ /_
#   / __ \/ __ `/ ___/ __ \
#  / /_/ / /_/ (__  ) / / /
# /_.___/\__,_/____/_/ /_/
#
# *************************

# *******
# Aliases
# *******
source ~/.shell_aliases

# *******
# Environment
# *******
# {{{

# Set default editor
export EDITOR=nvim

# Only show the last 2 directories
export PROMPT_DIRTRIM=2

# Turn colours on
export CLICOLOR=1

# Listing colours
# (these will likely be overriden by your terminal)
export LSCOLORS=GxFxCxDxBxegedabagaced

# }}}

# *******
# Functions
# *******
# {{{

# Get the name of the current git branch
function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# }}}

# *******
# Prompt
# *******
# {{{

PS1="\[\e[0;37m\]\u \[\e[0;37m\]@ \[\e[0;37m\]\h \[\e[0;37m\][\[\e[0;32m\]\w\[\e[0;37m\]]\[\e[0;33m\]\$(parse_git_branch)\[\e[0;37m\] \[\e[0m\]"

# }}}

# *******
# Other
# *******
# {{{

# Start tmux on every shell login
if which tmux >/dev/null 2>&1; then
  # if not inside a tmux session, and if no session
  # is started, start a new session
  test -z "$TMUX" && (tmux attach || tmux new -s default)
fi

# }}}

# vim: set foldmethod=marker:
