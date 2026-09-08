#!/bin/bash
set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This installer is for macOS only."
  exit 1
fi

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is not installed. Install it from https://brew.sh and rerun this script."
  exit 1
fi

if brew list --cask obs >/dev/null 2>&1; then
  echo "OBS Studio is already installed. Upgrading to the latest Homebrew stable cask..."
  brew upgrade --cask obs || true
else
  echo "Installing OBS Studio..."
  brew install --cask obs
fi

echo
echo "OBS Studio installation is complete."
echo "Launch OBS from Applications and grant the macOS permissions needed for camera, microphone, and screen/system audio capture."
