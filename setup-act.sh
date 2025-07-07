#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 ACT_VERSION" >&2
  echo "Installs Docker and the act CLI using the specified version." >&2
}

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ]; then
  usage
  exit 0
fi

if [ -z "${1:-}" ]; then
  usage
  exit 1
fi

ACT_VERSION=$1

OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)
case "$ARCH" in
  x86_64) ARCH=amd64 ;;
  aarch64|arm64) ARCH=arm64 ;;
  *) echo "Unsupported arch: $ARCH" >&2; exit 1 ;;
esac

if ! command -v docker &>/dev/null; then
  echo "Installing Docker..."
  curl -fsSL https://get.docker.com | sh
  sudo usermod -aG docker "$USER"
else
  echo "Docker OK."
fi

if ! command -v act &>/dev/null; then
  echo "Installing act v$ACT_VERSION..."
  tmpdir=$(mktemp -d)
  curl -fsSL "https://github.com/nektos/act/releases/download/v${ACT_VERSION}/act_${ACT_VERSION}_${OS}_${ARCH}.tar.gz" \
    | tar -xzf - -C "$tmpdir" act
  sudo mv "$tmpdir/act" /usr/local/bin/
  rm -rf "$tmpdir"
else
  echo "act already installed at $(command -v act)"
fi

echo "→ $(docker --version)"
echo "→ $(act --version)"
export ACT_SETUP=1
