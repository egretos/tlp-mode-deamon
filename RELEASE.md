# Release Checklist

1) Update version
- `VERSION`
- `debian/changelog` version
- `snap/snapcraft.yaml` version

2) Build and smoke test locally

```bash
./build.sh
sudo apt install dist/tlp-mode-daemon_*.deb
```

3) Commit version bump

4) Tag and push

```bash
git tag vX.Y.Z
git push origin vX.Y.Z
```

5) GitHub Actions will build and attach artifacts to the release.
