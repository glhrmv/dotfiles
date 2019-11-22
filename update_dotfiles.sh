#!/bin/zsh

# (neovim) init.vim
INITVIM_SRC=~/.config/nvim/init.vim
INITVIM_DST=./neovim/init.vim

# (git) .gitconfig
GITCONFIG_SRC=~/.gitconfig
GITCONFIG_DST=./git/.gitconfig

# (git) .gitignore_global
GITIGNOREGLOBAL_SRC=~/.gitignore_global
GITIGNOREGLOBAL_DST=./git/.gitignore_global

echo "[Ø] Updating dotfiles..."

echo "[Ø] (nvim)  Updating .initvim"
cp $INITVIM_SRC $INITVIM_DST
echo "[Ø] (git)   Updating .gitconfig"
cp $GITCONFIG_SRC $GITCONFIG_DST
echo "[Ø] (git)   Updating .gitignore_global"
cp $GITIGNOREGLOBAL_SRC $GITIGNOREGLOBAL_DST

echo "[Ø] Done."

exit 0

