#!/bin/bash
set -euo pipefail

OBS_DIR="$HOME/Library/Application Support/obs-studio"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
BACKUP_DIR="$REPO_DIR/backups"
STAMP="$(date +%Y%m%d-%H%M%S)"
ARCHIVE="$BACKUP_DIR/obs-macos-$STAMP.tar.gz"

if pgrep -x "OBS" >/dev/null 2>&1; then
  echo "OBS appears to be running. Quit OBS before creating a backup."
  exit 1
fi

if [[ ! -d "$OBS_DIR" ]]; then
  echo "OBS configuration directory not found:"
  echo "$OBS_DIR"
  echo "Launch OBS at least once, then rerun this script."
  exit 1
fi

mkdir -p "$BACKUP_DIR"

tar -czf "$ARCHIVE" -C "$HOME/Library/Application Support" obs-studio

echo "Backup created:"
echo "$ARCHIVE"
