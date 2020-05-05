# Aliases
source ~/.shell_aliases

# Set language
export LANG=en_GB

# Set editor
export EDITOR=/usr/local/bin/nvim

# Behavior
setopt no_beep

# Usability
setopt auto_cd

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=500
SAVEHIST=500
setopt appendhistory

# Treat the '!' character specially during expansion.
setopt bang_hist                 

# Write the history file in the ':start:elapsed;command' format.
setopt extended_history          

# Write to the history file immediately, not when the shell exits.
setopt inc_append_histoRY        

# Share history between all sessions.
setopt share_history             

# Expire a duplicate event first when trimming history.
setopt hist_expire_dups_first

# Do not record an event that was just recorded again.
setopt hist_ignore_dups

# Delete an old recorded event if a new event is a duplicate.
setopt hist_ignore_all_dups      

# Do not display a previously found event.
setopt hist_find_no_dups         

# Do not record an event starting with a space.
setopt hist_ignore_space         

# Do not write a duplicate event to the history file.
setopt hist_save_no_dups         

autoload -U compinit && compinit
zmodload -i zsh/complist

# Prompt (overwritten by theme)
PROMPT='λ [%(4~|.../%3~|%~)/] '

# Plugins
source ~/antigen.zsh

# Load the oh-my-zsh library
antigen use oh-my-zsh

# Bundles from the default repo
antigen bundle git
antigen bundle common-aliases
antigen bundle z

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load theme
antigen theme geometry-zsh/geometry

# Tell Antigen that you're done.
antigen apply

# PATH
export PATH="/usr/local/sbin:$PATH"

# Add Cargo to PATH
export PATH="$HOME/.cargo/bin:$PATH"

