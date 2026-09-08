#!/bin/bash
set -euo pipefail

OBS_DIR="$HOME/Library/Application Support/obs-studio"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
SAFETY_DIR="$REPO_DIR/backups"
STAMP="$(date +%Y%m%d-%H%M%S)"

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 path/to/obs-backup.tar.gz"
  exit 1
fi

ARCHIVE="$1"

if [[ ! -f "$ARCHIVE" ]]; then
  echo "Backup archive not found: $ARCHIVE"
  exit 1
fi

if pgrep -x "OBS" >/dev/null 2>&1; then
  echo "OBS appears to be running. Quit OBS before restoring."
  exit 1
fi

mkdir -p "$SAFETY_DIR"

if [[ -d "$OBS_DIR" ]]; then
  SAFETY_ARCHIVE="$SAFETY_DIR/pre-restore-obs-macos-$STAMP.tar.gz"
  tar -czf "$SAFETY_ARCHIVE" -C "$HOME/Library/Application Support" obs-studio
  echo "Safety backup created: $SAFETY_ARCHIVE"
  rm -rf "$OBS_DIR"
fi

tar -xzf "$ARCHIVE" -C "$HOME/Library/Application Support"

echo "OBS configuration restored from:"
echo "$ARCHIVE"
echo "Launch OBS and verify scenes, sources, audio devices, and output settings."
