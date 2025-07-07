#!/usr/bin/env bash
set -euo pipefail

if ! command -v bun &>/dev/null; then
  echo "Installing Bun…"
  curl -fsSL https://bun.sh/install | bash
  export PATH="$HOME/.bun/bin:$PATH"
fi

echo "✅ Bun setup complete."
