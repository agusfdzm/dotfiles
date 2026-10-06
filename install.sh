#!/usr/bin/env bash

set -e

DOTFILES="$HOME/dotfiles"

echo "=== Dotfiles installer ==="

echo "Creando backup primero..."
"$DOTFILES/backup.sh"

echo
echo "Instalando configuraciones..."

mkdir -p ~/.config

ln -sfn "$DOTFILES/ghostty" ~/.config/ghostty
ln -sfn "$DOTFILES/nvim" ~/.config/nvim

ln -sfn "$DOTFILES/starship/starship.toml" ~/.config/starship.toml
ln -sfn "$DOTFILES/zsh/zshrc" ~/.zshrc

echo
echo "Dotfiles instalados."
