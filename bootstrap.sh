#!/usr/bin/env bash

# bootstrap.sh
# Created by glhrmv (https://github.com/glhrmv/dotfiles)

cd "$(dirname "${BASH_SOURCE}")";

echo "[Ø] Shell installation script for glhrmv's dotfiles";
echo "-------------------------------------------------";
echo "";

installSoftware() {
  # Install zsh and required software
  echo "[Ø] [INFO] Installing dependencies...";
  brew install coreutils gpg gnupg automake autoconf openssl libyaml readline libxslt

  # Install Oh My Zsh!
  echo "[Ø] [INFO] Installing Oh My Zsh...";
  curl -L http://install.ohmyz.sh
}

installBrew() {
  if hash brew 2>/dev/null; then
    echo "[Ø] [INFO] Brew already installed."
  else
    echo "[Ø] [INFO] Installing Homebrew...";
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
  fi
}

updateBrew() {
  if hash brew 2>/dev/null; then
    echo "[Ø] [INFO] Updating Homebrew package manager...";
    brew update;
  fi
}

installAsdf() {
  echo "[Ø] [INFO] Installing asdf...";
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf;

  source ~/.zshrc

  echo "[Ø] [INFO] Installing asdf plugins...";
  source $HOME/.asdf/asdf.sh;

  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git;
  asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git;
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git;
  asdf plugin-add crystal https://github.com/asdf-vm/asdf-crystal.git;
}

syncConfig() {
  echo "[Ø] [INFO] Syncing configuration...";
  rsync --exclude ".git/" \
    --exclude ".DS_Store" \
    --exclude ".gitignore" \
    --exclude "bootstrap.sh" \
    --exclude "README.md" \
    --exclude "LICENSE" \
    --exclude "Brewfile" \
    -avh --no-perms . ~;
}

doIt() {
  installBrew;
  updateBrew;
  installSoftware;
  syncConfig;
  installAsdf;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "[Ø] I'm about to change the configuration files placed in your home directory. Do you want to continue? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;

echo "";
echo "[Ø] If you don't see any error messages, everything went well!";

