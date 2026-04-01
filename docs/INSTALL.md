# Install

## From Repo (Recommended)

```bash
sudo ./install.sh
```

This will:

- Install `tlp-mode` and `tlp-tray` into `/usr/local/bin`
- Install `tlp-mode-root` into `/usr/local/sbin`
- Install the systemd user service for the tray
- Enable and start the tray service
- Generate optional user icons via `create-tlp-icons`
- Install an XDG autostart entry for the tray

## Dependencies

- `tlp`
- `systemd`
- `pkexec` or `sudo`
- Tray UI: `python3` + `PySide6`

On Debian/Ubuntu:

```bash
sudo apt install tlp python3-pyside6
```
