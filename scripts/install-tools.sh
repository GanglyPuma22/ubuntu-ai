#!/bin/bash
set -e

if [ -z "$UBUNTU_AI_HOME" ]; then
  echo "UBUNTU_AI_HOME not set. Please run setup-ai.sh first from project root or restart your terminal."
  exit 1
fi

# Default to non-interactive mode
NONINTERACTIVE=true

# Parse flags
while [[ $# -gt 0 ]]; do
  case "$1" in
    -i|--interactive)
      NONINTERACTIVE=false
      shift
      ;;
    *)
      echo "Unknown argument: $1"
      echo "Usage: $0 [-i|--interactive]"
      exit 1
      ;;
  esac
done

if $NONINTERACTIVE; then
  export DEBIAN_FRONTEND=noninteractive
  echo "Running in the default non-interactive mode (no prompts)."
else
  unset DEBIAN_FRONTEND
  echo "Running in interactive mode (prompts enabled)."
fi

PACKAGE_LIST_FILE="$UBUNTU_AI_HOME/config/base-packages.txt"

if [ ! -f "$PACKAGE_LIST_FILE" ]; then
  echo "Package list not found at $PACKAGE_LIST_FILE"
  exit 1
fi

echo "Updating apt package list..."
sudo apt-get update

echo "Installing CLI tools listed in base-packages.txt..."

while read -r pkg; do
  # Skip empty lines and comments
  [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue

  if dpkg -s "$pkg" >/dev/null 2>&1; then
    echo "Package '$pkg' is already installed."
  else
    echo "Installing package: $pkg"
    sudo apt-get install -y "$pkg"
  fi
done < "$PACKAGE_LIST_FILE"

echo "All requested CLI tools installed."
