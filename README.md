# OBS Setup for macOS

This repository is the control point for a reproducible OBS Studio setup on macOS.

## What this repo does

- Installs the current stable OBS Studio release with Homebrew.
- Installs Aitum Stream Suite for simultaneous Twitch + TikTok output.
- Backs up OBS profiles, scene collections, settings, and user-installed plugins.
- Restores an OBS configuration safely, creating a pre-restore backup first.
- Keeps setup notes and future scene/profile configuration under version control.

## Current target

- Platform: macOS
- OBS: stable release
- Multistream target: Twitch + TikTok simultaneously
- Twitch layout: 16:9 landscape
- TikTok layout: 9:16 portrait
- OBS configuration directory: `~/Library/Application Support/obs-studio`
- User plugin directory: `~/Library/Application Support/obs-studio/plugins`

## First-time setup

Open Terminal and run:

```bash
git clone https://github.com/minimouny/OBS-Setup.git
cd OBS-Setup
chmod +x scripts/*.sh
./scripts/install_obs.sh
./scripts/install_aitum_stream_suite.sh
```

Then open OBS and allow the macOS permissions it needs for your use case, such as Screen & System Audio Recording, Camera, and Microphone.

## Twitch + TikTok setup

See [`docs/multistream-twitch-tiktok.md`](docs/multistream-twitch-tiktok.md) for the output architecture, recommended starting settings, scene design, and launch checklist.

TikTok direct OBS streaming is account-dependent. If TikTok provides your account a Server URL and Stream Key, enter those only inside OBS/Aitum on your Mac. Never place stream keys in GitHub.

## Back up OBS

Quit OBS first, then run:

```bash
./scripts/backup_obs.sh
```

Backups are written to `backups/` as timestamped `.tar.gz` archives. The archives are ignored by Git so private stream keys and machine-specific settings are not accidentally committed.

## Restore OBS

Quit OBS first. Then restore from a backup archive:

```bash
./scripts/restore_obs.sh backups/obs-macos-YYYYMMDD-HHMMSS.tar.gz
```

The restore script automatically creates a safety backup of the existing OBS configuration before replacing it.

## Important security note

Do **not** commit the live OBS configuration directory or backup archives to GitHub. OBS profiles can contain service configuration and other account-specific information. This repository tracks scripts, documentation, and intentionally sanitized configuration only.

## Next configuration stage

The repository is ready for the actual production setup: scenes, sources, audio routing, recording settings, platform credentials, hotkeys, and any additional plugins required by the final workflow.
