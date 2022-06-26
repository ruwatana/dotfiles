#!/bin/bash

set -e

# zplug (zsh plugin)
[ ! -d ${HOME}/.zplug ] && curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

# Change shell to zsh if needed
[ ${SHELL} != "/bin/zsh"  ] && chsh -s /bin/zsh

# Homebrew
if (type "brew" > /dev/null 2>&1); then
  echo "$(tput setaf 2)Homebrew has already been installed ✔︎$(tput sgr0)"
else
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "$(tput setaf 2)Installing Homebrew was completed! ✔︎$(tput sgr0)"
fi
brew bundle --global

# dein.vim
echo "Installing dein.vim..."
if [ ! -d ${HOME}/.cache/dein/repos/github.com/Shougo/dein.vim ]; then
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
  # For example, we just use `~/.cache/dein` as installation directory
  sh ./installer.sh ~/.cache/dein
  rm -rf ./installer.sh
  echo "$(tput setaf 2)Installing dein.vim was completed! ✔︎$(tput sgr0)"
else
  echo "$(tput setaf 2)dein.vim has already been installed ✔︎$(tput sgr0)"
fi

echo "$(tput setaf 2)Setup was completed!. ✔︎$(tput sgr0)"

exec $SHELL -l
