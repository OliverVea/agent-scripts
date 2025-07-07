#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 DOTNET_SDK_VERSION" >&2
  echo "Installs the specified version of the .NET SDK." >&2
}

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ]; then
  usage
  exit 0
fi

if [ -z "${1:-}" ]; then
  usage
  exit 1
fi

DOTNET_SDK_VERSION=$1

wget -q https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb \
     -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb >/dev/null
rm packages-microsoft-prod.deb

sudo apt-get update -qq
sudo apt-get install -y -qq apt-transport-https
sudo apt-get update -qq
sudo apt-get install -y -qq "dotnet-sdk-${DOTNET_SDK_VERSION}"

echo "✅ .NET setup complete."
