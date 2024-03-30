#!/bin/bash

set -e

echo "Linking dotfiles..."

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"

IGNORED_ITEMS=(
  "bin"
  "Makefile"
  "README.md"
  "LICENSE"
  ".gitignore"
  ".gitmodules"
)

git -C "$DOTFILES_DIR" ls-files | while read filename; do
  should_ignore=false
  for item in "${IGNORED_ITEMS[@]}"; do
    if [[ "$filename" == $item* ]]; then
      should_ignore=true
      break
    fi
  done

  if $should_ignore; then
    continue
  fi

  if [ -L "${HOME}/${filename}" ]; then
    echo "Link already exists for ${filename}, skipping."
    continue
  fi

  target_dir="${HOME}/$(dirname "${filename}")"
  mkdir -p "$target_dir"

  ln -snfv "${DOTFILES_DIR}/${filename}" "${HOME}/${filename}"
done

echo "$(tput setaf 2)Linking dotfiles was completed! ✔︎$(tput sgr0)"
