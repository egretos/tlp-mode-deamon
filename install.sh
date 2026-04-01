#!/usr/bin/env bash
set -euo pipefail

PREFIX="${PREFIX:-/usr/local}"
BINDIR="$PREFIX/bin"
SBINDIR="$PREFIX/sbin"
SYSTEMD_USER_DIR="$PREFIX/lib/systemd/user"
DESKTOP_DIR="$PREFIX/share/applications"
XDG_AUTOSTART_DIR="/etc/xdg/autostart"

if [[ "$EUID" -ne 0 ]]; then
  echo "Please run as root: sudo ./install.sh" >&2
  exit 1
fi

install -D -m 0755 "bin/tlp-mode" "$BINDIR/tlp-mode"
install -D -m 0755 "bin/tlp-tray" "$BINDIR/tlp-tray"
install -D -m 0755 "bin/create-tlp-icons" "$BINDIR/create-tlp-icons"
install -D -m 0755 "root/tlp-mode-root" "$SBINDIR/tlp-mode-root"
install -D -m 0644 "systemd/tlp-tray.service" "$SYSTEMD_USER_DIR/tlp-tray.service"
install -D -m 0644 "desktop/tlp-tray.desktop" "$DESKTOP_DIR/tlp-tray.desktop"
install -D -m 0644 "desktop/tlp-cold.desktop" "$DESKTOP_DIR/tlp-cold.desktop"
install -D -m 0644 "desktop/tlp-desk.desktop" "$DESKTOP_DIR/tlp-desk.desktop"
install -D -m 0644 "desktop/tlp-toggle.desktop" "$DESKTOP_DIR/tlp-toggle.desktop"
install -D -m 0644 "xdg-autostart/tlp-tray.desktop" "$XDG_AUTOSTART_DIR/tlp-tray.desktop"

TARGET_USER="${SUDO_USER:-}"
if [[ -n "$TARGET_USER" ]]; then
  if command -v sudo >/dev/null 2>&1; then
    sudo -u "$TARGET_USER" "$BINDIR/create-tlp-icons" >/dev/null 2>&1 || true
    if command -v systemctl >/dev/null 2>&1; then
      sudo -u "$TARGET_USER" systemctl --user daemon-reload || true
      sudo -u "$TARGET_USER" systemctl --user enable --now tlp-tray.service || true
    fi
  fi
fi

echo "Installed to $PREFIX."
