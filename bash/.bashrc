# Show the name of the current git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Only show the last 2 directories
export PROMPT_DIRTRIM=2

# Prompt
export PS1="\[\e[0;37m\]\u \[\e[0;37m\]@ \[\e[0;37m\]\h \[\e[0;37m\][\[\e[0;32m\]\w\[\e[0;37m\]]\[\e[0;33m\]\$(parse_git_branch)\[\e[0;37m\] \[\e[0m\]"

# Start tmux on every shell login
if which tmux >/dev/null 2>&1; then
  # if not inside a tmux session, and if no session 
  # is started, start a new session
  test -z "$TMUX" && (tmux attach || tmux new -s default)
fi

