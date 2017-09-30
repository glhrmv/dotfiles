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

export PS1="\[$(tput bold)\]\[\033[38;5;69m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput bold)\]\h\[$(tput sgr0)\]:[\[$(tput sgr0)\]\[\033[38;5;6m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]]\$git_branch: \[$(tput sgr0)\]"

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
