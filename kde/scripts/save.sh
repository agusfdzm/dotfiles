#!/usr/bin/env bash
set -euo pipefail

SOURCE="$HOME/.config"
DEST="$HOME/dotfiles/kde/config"

mkdir -p "$DEST"

FILES=(
    "plasma-org.kde.plasma.desktop-appletsrc"
    "kglobalshortcutsrc"
    "kwinrc"
    "kdeglobals"
    "plasmarc"
    "plasmashellrc"
    "kscreenlockerrc"
)

for file in "${FILES[@]}"; do
    if [[ -f "$SOURCE/$file" ]]; then
        cp "$SOURCE/$file" "$DEST/$file"
        echo "Guardado: $file"
    fi
done

echo "Configuración KDE guardada."
