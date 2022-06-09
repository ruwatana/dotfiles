#!/bin/bash

set -e

echo "Linking dotfiles..."

for f in .??*; do
  # Force remove the vim directory if it's already there
  [ -n "${OVERWRITE}" -a -e ${HOME}/${f} ] && rm -f ${HOME}/${f}
  if [ ! -e ${HOME}/${f} ]; then
    # If you have ignore files, add file/directory name here
    [[ ${f} = ".git" ]] && continue
    [[ ${f} = ".github" ]] && continue
    [[ ${f} = ".gitignore" ]] && continue
    [[ ${f} = ".DS_Store" ]] && continue
    ln -snfv ${HOME}/dotfiles/${f} ${HOME}/${f}
  fi
done

echo "$(tput setaf 2)Linking dotfiles was completed! ✔︎$(tput sgr0)"
