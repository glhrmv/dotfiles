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

# (git) .gitignore_global
GITIGNOREGLOBAL_SRC=~/.gitignore_global
GITIGNOREGLOBAL_DST=./git/.gitignore_global

echo "[Ø] Updating dotfiles..."

echo "[Ø] (bash)  Updating .bashrc"
cp $BASHRC_SRC $BASHRC_DST
echo "[Ø] (bash)  Updating .bash_profile"
cp $BASHPROFILE_SRC $BASHPROFILE_DST
echo "[Ø] (vim)   Updating .vimrc"
cp $VIMRC_SRC $VIMRC_DST
echo "[Ø] (nvim)  Updating .initvim"
cp $INITVIM_SRC $INITVIM_DST
echo "[Ø] (tmux)  Updating .tmux.conf"
cp $TMUXCONF_SRC $TMUXCONF_DST
echo "[Ø] (git)   Updating .gitconfig"
cp $GITCONFIG_SRC $GITCONFIG_DST
echo "[Ø] (git)   Updating .gitignore_global"
cp $GITIGNOREGLOBAL_SRC $GITIGNOREGLOBAL_DST

echo "[Ø] Done."

exit 0

