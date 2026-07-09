# Homebrew Tap for imux

Official Homebrew cask tap for **[imux](https://www.iccjk.com)** — a native macOS AI command center (terminal, splits, remote workspaces, automation).

Repository layout matches a standard Homebrew tap (`homebrew-imux`):

```
homebrew-imux/
  Casks/imux.rb
  README.md
```

This directory lives inside the monorepo for review and release automation.  
It can also be published as a standalone GitHub repo named **`homebrew-imux`**.

## Install

### From a published tap (recommended after the remote exists)

```bash
brew tap mycode699/imux
brew install --cask imux
```

If the tap remote is under a different owner, replace `mycode699` accordingly:

```bash
brew tap <owner>/imux
brew install --cask imux
```

### From this monorepo checkout (local development)

```bash
# Install the cask file directly
brew install --cask ./homebrew-imux/Casks/imux.rb

# Or tap the local directory
brew tap mycode699/imux "$(pwd)/homebrew-imux"
brew install --cask imux
```

## Upgrade / uninstall

```bash
brew upgrade --cask imux
brew uninstall --cask imux
brew untap mycode699/imux   # optional
```

## What gets installed

| Item | Path |
|------|------|
| App | `/Applications/imux.app` |
| CLI (compat name) | `icc` → `imux.app/Contents/Resources/bin/icc` |

In-app updates still use Sparkle / `https://www.iccjk.com/downloads/appcast.xml`. Homebrew upgrades are optional.

## Keeping the cask in sync

From the monorepo root, after publishing a stable release (`web/public/downloads/latest.json`):

```bash
./scripts/sync-homebrew-cask.sh
# optional: verify
brew style ./homebrew-imux/Casks/imux.rb
```

This rewrites `version` and `sha256` from `latest.json`.

## License

- **Tap metadata** (this cask/README): same project license as imux (**AGPL-3.0-or-later** for product; cask files are packaging metadata).
- **Installed app binary**: AGPL-3.0-or-later + third-party notices inside the app (`Acknowledgments` / `THIRD_PARTY_LICENSES.md`).

## Legacy

The old `homebrew-icc` submodule still describes **cmux** and is **not** the imux install path. See `docs/homebrew-tap.md`.
