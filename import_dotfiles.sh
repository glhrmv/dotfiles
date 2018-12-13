#!/bin/bash

# (bash) .bashrc
BASHRC_SRC=~/.bashrc
BASHRC_DST=./bash/.bashrc

# (bash) .bash_profile
BASHPROFILE_SRC=~/.bash_profile
BASHPROFILE_DST=./bash/.bash_profile

# (vim) .vimrc
VIMRC_SRC=~/.vimrc
VIMRC_DST=./vim/.vimrc

# (neovim) init.vim
INITVIM_SRC=~/.config/nvim/init.vim
INITVIM_DST=./neovim/init.vim

# (tmux) .tmux.conf
TMUXCONF_SRC=~/.tmux.conf
TMUXCONF_DST=./tmux/.tmux.conf

# (git) .gitconfig
GITCONFIG_SRC=~/.gitconfig
GITCONFIG_DST=./git/.gitconfig

echo "[Ø] Updating dotfiles..."

cp $BASHRC_SRC $BASHRC_DST
cp $BASHPROFILE_SRC $BASHPROFILE_DST
cp $VIMRC_SRC $VIMRC_DST
cp $INITVIM_SRC $INITVIM_DST
cp $TMUXCONF_SRC $TMUXCONF_DST
cp $GITCONFIG_SRC $GITCONFIG_DST

echo "[Ø] Done."

exit 0

