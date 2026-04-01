PREFIX ?= /usr/local
BINDIR := $(PREFIX)/bin
SBINDIR := $(PREFIX)/sbin
SYSTEMD_USER_DIR := $(PREFIX)/lib/systemd/user
DESKTOP_DIR := $(PREFIX)/share/applications

.PHONY: install uninstall

install:
	install -D -m 0755 bin/tlp-mode $(BINDIR)/tlp-mode
	install -D -m 0755 bin/tlp-tray $(BINDIR)/tlp-tray
	install -D -m 0755 bin/create-tlp-icons $(BINDIR)/create-tlp-icons
	install -D -m 0755 root/tlp-mode-root $(SBINDIR)/tlp-mode-root
	install -D -m 0644 systemd/tlp-tray.service $(SYSTEMD_USER_DIR)/tlp-tray.service
	install -D -m 0644 desktop/tlp-tray.desktop $(DESKTOP_DIR)/tlp-tray.desktop

uninstall:
	rm -f $(BINDIR)/tlp-mode $(BINDIR)/tlp-tray $(BINDIR)/create-tlp-icons
	rm -f $(SBINDIR)/tlp-mode-root
	rm -f $(SYSTEMD_USER_DIR)/tlp-tray.service
	rm -f $(DESKTOP_DIR)/tlp-tray.desktop
