# Path to oh-my-zsh installation
ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="arrow"

zstyle ':omz:update' mode reminder

plugins=(git z asdf)

source $ZSH/oh-my-zsh.sh

# User configuration

# set language
export lang=en_gb

# set editor
export editor=/usr/local/bin/nvim

# behavior
setopt no_beep

# usability
setopt auto_cd

# history
histfile="$home/.zsh_history"
histsize=500
savehist=500
setopt appendhistory

# treat the '!' character specially during expansion.
setopt bang_hist                 

# write the history file in the ':start:elapsed;command' format.
setopt extended_history          

# write to the history file immediately, not when the shell exits.
setopt inc_append_history        

# share history between all sessions.
setopt share_history             

# expire a duplicate event first when trimming history.
setopt hist_expire_dups_first

# do not record an event that was just recorded again.
setopt hist_ignore_dups

# delete an old recorded event if a new event is a duplicate.
setopt hist_ignore_all_dups      

# do not display a previously found event.
setopt hist_find_no_dups         

# do not record an event starting with a space.
setopt hist_ignore_space         

# do not write a duplicate event to the history file.
setopt hist_save_no_dups         

autoload -U compinit && compinit
zmodload -i zsh/complist

