# Packaging Notes

This repo ships with `install.sh` and a standard FHS layout, which makes it easy to package.

## Debian (.deb)

A simple approach is to use `fpm`:

```bash
fpm -s dir -t deb \
  -n tlp-mode-daemon \
  -v 0.1.0 \
  /usr/local/bin/tlp-mode=/usr/bin/tlp-mode \
  /usr/local/bin/tlp-tray=/usr/bin/tlp-tray \
  /usr/local/bin/create-tlp-icons=/usr/bin/create-tlp-icons \
  /usr/local/sbin/tlp-mode-root=/usr/sbin/tlp-mode-root \
  /usr/local/lib/systemd/user/tlp-tray.service=/usr/lib/systemd/user/tlp-tray.service \
  /usr/local/share/applications/tlp-tray.desktop=/usr/share/applications/tlp-tray.desktop
```

## Snap

For a snap, wrap `tlp-tray` and `tlp-mode` and grant the needed interfaces for system access.
