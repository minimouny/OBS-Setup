#!/bin/bash
set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This installer is for macOS only."
  exit 1
fi

PKG_URL="https://github.com/Aitum/obs-aitum-stream-suite/releases/latest/download/aitum-stream-suite-macos-universal.pkg"
TMP_PKG="$(mktemp -t aitum-stream-suite).pkg"

cleanup() {
  rm -f "$TMP_PKG"
}
trap cleanup EXIT

echo "Downloading the latest official Aitum Stream Suite macOS package..."
curl -fL --retry 3 --connect-timeout 15 "$PKG_URL" -o "$TMP_PKG"

echo
echo "Installing Aitum Stream Suite. macOS will request your administrator password."
sudo /usr/sbin/installer -pkg "$TMP_PKG" -target /

echo
echo "Aitum Stream Suite installation is complete."
echo "Restart OBS Studio if it was open during installation."
echo "Use the Stream Suite canvases/outputs to configure Twitch landscape and TikTok vertical streaming."
