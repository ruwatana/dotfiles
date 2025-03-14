#!/bin/bash

set -e

# zinit (zsh plugin manager)
[ ! -d ${HOME}/.local/share/zinit ] && bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

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

# vim-plug
echo "Installing vim-plug..."
if [ ! -f ${HOME}/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "$(tput setaf 2)Installing vim-plug was completed! ✔︎$(tput sgr0)"
  echo "Installing Vim plugins..."
  vim +PlugInstall +qall
  echo "$(tput setaf 2)Installing Vim plugins was completed! ✔︎$(tput sgr0)"
else
  echo "$(tput setaf 2)vim-plug has already been installed ✔︎$(tput sgr0)"
  echo "Updating Vim plugins..."
  vim +PlugUpdate +qall
  echo "$(tput setaf 2)Updating Vim plugins was completed! ✔︎$(tput sgr0)"
fi 

echo "$(tput setaf 2)Setup was completed!. ✔︎$(tput sgr0)"

exec $SHELL -l
