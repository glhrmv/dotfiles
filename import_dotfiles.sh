#!/bin/bash

echo "[Ø] Updating dotfiles..."
cp ~/.bashrc bash/.bashrc
cp ~/.bash_profile bash/.bash_profile
cp ~/.vimrc vim/.vimrc
cp ~/.tmux.conf tmux/.tmux.conf
cp ~/.gitconfig git/.gitconfig
echo "[Ø] Done."
exit 0
