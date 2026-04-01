# Troubleshooting

## Tray doesn't start

- Run `tlp-tray` in a terminal to see errors.
- Ensure `PySide6` is installed.

## Mode switch prompts for password

This is expected when using `sudo` or `pkexec`. If you want passwordless switching, add a polkit rule for `tlp-mode-root`.

## Tray shows wrong mode

Make sure `/etc/tlp.d/30-mode-active.conf` contains one of the expected values:

- Cold: `CPU_MAX_PERF_ON_AC=55`
- Desk: `CPU_MAX_PERF_ON_AC=100`

If you changed these values, update the detection logic in `bin/tlp-mode` and `bin/tlp-tray`.
