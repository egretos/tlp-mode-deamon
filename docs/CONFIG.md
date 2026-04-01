# Configuration

## Environment Variables

These variables let you override paths without editing code:

- `TLP_MODE_FILE` (default: `/etc/tlp.d/30-mode-active.conf`)
- `TLP_MODE_ROOT_HELPER` (default: `/usr/local/sbin/tlp-mode-root`)
- `TLP_BIN` (default: `/usr/sbin/tlp`)
- `TLP_MODE_BIN` (tray only; default: resolves `tlp-mode` from PATH)
- `TLP_MODE_NO_NOTIFY` (set to `1` to suppress notifications)

Example:

```bash
TLP_MODE_FILE=/etc/tlp.d/30-mode-active.conf tlp-mode cold
```

## Profile Settings

Profiles are defined in two places:

- `bin/tlp-mode` (fallback when root helper is missing)
- `root/tlp-mode-root` (used when present)

If you change settings, keep them in sync in both files.

## Changing Cold/Desk Values

Edit these blocks in the repo:

- `bin/tlp-mode` (cold/desk blocks in `write_mode_file`)
- `root/tlp-mode-root` (cold/desk blocks in the shell case)

Then reinstall:

```bash
sudo ./install.sh
```
