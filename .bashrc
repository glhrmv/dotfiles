find_git_branch() {
  # Based on: http://stackoverflow.com/a/13003854/170413
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch='detached*'
    fi
    git_branch="($branch)"
  else
    git_branch=""
  fi
}

# prompt
PROMPT_COMMAND="find_git_branch; $PROMPT_COMMAND"

export PS1="\[\e[0;37m\]\u \[\e[0;37m\]@ \[\e[0;37m\]\h \[\e[0;37m\][\[\e[0;37m\]\w\[\e[0;37m\]]\[\e[0;37m\]\$git_branch: \[\e[0m\]"

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
