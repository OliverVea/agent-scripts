#!/usr/bin/env bash
set -euo pipefail

if ! command -v dotnet &>/dev/null; then
  echo "Installing Bun…"
  curl -fsSL https://bun.sh/install | bash
  export PATH="$HOME/.bun/bin:$PATH"
fi

wget -q https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb \
     -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb >/dev/null
rm packages-microsoft-prod.deb

sudo apt-get update -qq
sudo apt-get install -y -qq apt-transport-https
sudo apt-get update -qq
sudo apt-get install -y -qq "dotnet-sdk-${DOTNET_SDK_VERSION}"

echo "✅ .NET setup complete."
