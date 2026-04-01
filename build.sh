#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"

rm -f dist/tlp-mode-daemon_*.* || true

# Build .deb (output goes one level up by dpkg-buildpackage design)
dpkg-buildpackage -us -uc

# Move artifacts into dist/
for f in ../tlp-mode-daemon_*.*; do
  [ -e "$f" ] || continue
  mv "$f" dist/
done

echo "Artifacts moved to dist/"
