#!/usr/bin/env bash
set -euo pipefail

PREFIX="${PREFIX:-/usr/local}"
BINDIR="$PREFIX/bin"
SBINDIR="$PREFIX/sbin"
SYSTEMD_USER_DIR="$PREFIX/lib/systemd/user"
DESKTOP_DIR="$PREFIX/share/applications"
XDG_AUTOSTART_DIR="/etc/xdg/autostart"

if [[ "$EUID" -ne 0 ]]; then
  echo "Please run as root: sudo ./uninstall.sh" >&2
  exit 1
fi

TARGET_USER="${SUDO_USER:-}"
if [[ -n "$TARGET_USER" ]]; then
  if command -v systemctl >/dev/null 2>&1; then
    sudo -u "$TARGET_USER" systemctl --user disable --now tlp-tray.service || true
    sudo -u "$TARGET_USER" systemctl --user daemon-reload || true
  fi
fi

rm -f "$BINDIR/tlp-mode" "$BINDIR/tlp-tray" "$BINDIR/create-tlp-icons"
rm -f "$SBINDIR/tlp-mode-root"
rm -f "$SYSTEMD_USER_DIR/tlp-tray.service"
rm -f "$DESKTOP_DIR/tlp-tray.desktop"
rm -f "$DESKTOP_DIR/tlp-cold.desktop" "$DESKTOP_DIR/tlp-desk.desktop" "$DESKTOP_DIR/tlp-toggle.desktop"
rm -f "$XDG_AUTOSTART_DIR/tlp-tray.desktop"

echo "Uninstalled from $PREFIX."
