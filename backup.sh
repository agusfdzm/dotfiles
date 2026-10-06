#!/usr/bin/env bash

set -e

BACKUP_DIR="$HOME/dotfiles/backups/$(date +%Y-%m-%d_%H-%M-%S)"

echo "Creando backup en:"
echo "$BACKUP_DIR"

mkdir -p "$BACKUP_DIR/config"
mkdir -p "$BACKUP_DIR/home"

echo "→ Guardando configuración de KDE..."

cp -a ~/.config/kdeglobals "$BACKUP_DIR/config/" 2>/dev/null || true
cp -a ~/.config/kwinrc "$BACKUP_DIR/config/" 2>/dev/null || true
cp -a ~/.config/plasmarc "$BACKUP_DIR/config/" 2>/dev/null || true
cp -a ~/.config/plasma-org.kde.plasma.desktop-appletsrc "$BACKUP_DIR/config/" 2>/dev/null || true
cp -a ~/.config/kglobalshortcutsrc "$BACKUP_DIR/config/" 2>/dev/null || true

echo "→ Guardando configuración general..."

cp -a ~/.config/ghostty "$BACKUP_DIR/config/" 2>/dev/null || true
cp -a ~/.config/nvim "$BACKUP_DIR/config/" 2>/dev/null || true

cp -a ~/.zshrc "$BACKUP_DIR/home/" 2>/dev/null || true

echo "→ Guardando lista de paquetes..."

dnf repoquery --userinstalled --qf '%{name}' \
    > "$BACKUP_DIR/packages.txt"

echo "→ Guardando información del sistema..."

{
    echo "Fecha:"
    date
    echo

    echo "Fedora:"
    cat /etc/fedora-release
    echo

    echo "Kernel:"
    uname -r
} > "$BACKUP_DIR/system-info.txt"

echo
echo "Backup terminado."
echo "$BACKUP_DIR"
