#!/usr/bin/env bash

# bootstrap.sh
# Created by glhrmv (https://github.com/glhrmv/dotfiles)

cd "$(dirname "${BASH_SOURCE}")";

echo "Shell installation script for glhrmv's dotfiles";
echo "-------------------------------------------------";
echo "";

installSoftware() {
  # Install zsh and required software
  echo "[INFO] Installing dependencies...";
  brew install coreutils gpg gnupg automake autoconf openssl libyaml readline libxslt

  # Install Oh My Zsh!
  echo "[INFO] Installing Oh My Zsh...";
  curl -L http://install.ohmyz.sh | sh
  echo "[INFO] Installing ZSH syntax highlighting...";
  rm -rf ~/.zsh-custom/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-custom/plugins/zsh-syntax-highlighting

}

installBrew() {
  if hash brew 2>/dev/null; then
    echo "[INFO] Brew already installed."
  else
    echo "[INFO] Installing Homebrew...";
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";

    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
}

updateBrew() {
  if hash brew 2>/dev/null; then
    echo "[INFO] Updating Homebrew package manager...";
    brew update;
  fi
}

installAsdf() {
  # Clone repository
  echo "[INFO] Installing asdf...";
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf;

  echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
  echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
  source ~/.zshrc

  # Install useful plugins (at least for me :D)
  echo "[INFO] Installing asdf plugins...";
  source $HOME/.asdf/asdf.sh;

  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git;
  asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git;
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git;
  asdf plugin-add crystal https://github.com/asdf-vm/asdf-ruby.git;
}

syncConfig() {
  echo "[INFO] Syncing configuration...";
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude ".gitignore" \
  --exclude "bootstrap.sh" --exclude "README.md" --exclude "LICENSE" -avh --no-perms . ~;
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
  read -p "I'm about to change the configuration files placed in your home directory. Do you want to continue? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;

echo "";
echo "[INFO] If you don't see any error messages, everything went well!";

