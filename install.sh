#!/usr/bin/env bash
# install.sh — symlink dotfiles into place
#
# Run this once on a new machine after cloning the repo.
# Existing files are backed up before being replaced.

set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
BACKUP="$HOME/.dotfiles-backup-$(date +%Y%m%d%H%M%S)"

link() {
  local src="$DOTFILES/$1"
  local dst="$HOME/$2"
  local dst_dir
  dst_dir="$(dirname "$dst")"

  if [ ! -d "$dst_dir" ]; then
    mkdir -p "$dst_dir"
  fi

  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    mkdir -p "$BACKUP"
    echo "  Backed up: $dst → $BACKUP/$(basename "$dst")"
    mv "$dst" "$BACKUP/$(basename "$dst")"
  fi

  ln -sf "$src" "$dst"
  echo "  Linked:    $dst"
}

echo ""
echo "Dotfiles → $DOTFILES"
echo "Symlinking config files..."
echo ""

link ".zshrc"            ".zshrc"
link ".vimrc"            ".vimrc"
link "VSCode - settings.json"  "Library/Application Support/Code/User/settings.json"
link "vscode-markdown.css"    "Library/Application Support/Code/User/vscode-markdown.css"

echo ""
echo "Done. Run 'source ~/.zshrc' or open a new terminal to apply changes."
echo ""
