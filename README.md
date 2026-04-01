# TLP Mode Daemon

Opinionated TLP profile switcher with a lightweight tray UI. It provides two profiles (`cold` and `desk`), a CLI to switch them, and a KDE-friendly tray app. The tray is optional; the CLI works on any desktop.

## Features

- Two profiles: `cold` (cooler/quieter) and `desk` (performance)
- Fast CLI switching: `tlp-mode cold|desk|toggle|status`
- Tray UI with optimistic switching and failure rollback
- Root helper for safe writes to `/etc/tlp.d/`

## Requirements

- Linux with `systemd`
- `tlp` installed and working
- `pkexec` or `sudo` available
- Tray UI: Python 3 + `PySide6`

## Tested Hardware

- Lenovo ThinkPad T480 (Intel Core i7-8650U)

## Quick Install

```bash
cd tlp-mode-daemon
sudo ./install.sh
```

This installs:

- `tlp-mode` to `/usr/local/bin`
- `tlp-tray` to `/usr/local/bin`
- `tlp-mode-root` to `/usr/local/sbin`
- Systemd user service for the tray
- Optional user icons via `create-tlp-icons`
- XDG autostart entry for the tray

## Usage

CLI:

```bash
tlp-mode cold
# or
tlp-mode desk
# or
tlp-mode toggle
# or
tlp-mode status
```

Tray:

```bash
tlp-tray
```

If you installed the systemd user service, the tray will start on login. Use `systemctl --user status tlp-tray.service` to inspect it.

## Configuration

See `docs/CONFIG.md` for environment variables and profile edits.

## Uninstall

```bash
sudo ./uninstall.sh
```

## License

MIT
