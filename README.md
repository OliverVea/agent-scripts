# Agent Scripts

This repository provides small helper scripts to set up tools in CI or local environments.

## Available scripts

### `setup-act.sh`
Installs Docker (if needed) and the [`act`](https://github.com/nektos/act) binary for running GitHub Actions locally.

Usage:
```bash
# specify the act version to install
ACT_VERSION=0.2.57 ./setup-act.sh
```

### `setup-bun.sh`
Installs the [Bun](https://bun.sh/) JavaScript runtime if it is not already available.

Usage:
```bash
./setup-bun.sh
```

### `setup-dotnet.sh`
Installs the .NET SDK via the Microsoft package repositories.

Usage:
```bash
DOTNET_SDK_VERSION=8.0 ./setup-dotnet.sh
```

## Contributing

- Use conventional commit messages (e.g. `feat:`, `fix:`, `docs:`).
- Update `AGENTS.md` with relevant repository information when files change.

