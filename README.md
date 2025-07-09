# Agent Scripts

This repository provides small helper scripts to set up tools in CI or local environments.

## Available scripts

### `setup-act.sh`
Installs Docker (if needed) and the [`act`](https://github.com/nektos/act) binary for running GitHub Actions locally.

Usage:
```bash
./setup-act.sh 0.2.57
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
./setup-dotnet.sh 8.0
```

## Example
The scripts can be combined to prepare a Codex agent environment.

```bash
#!/usr/bin/env bash
# Clone the helper scripts
git clone https://github.com/OliverVea/agent-scripts.git scripts

# Install Bun and .NET
scripts/setup-bun.sh
scripts/setup-dotnet.sh 8.0

# Install project dependencies and run tests
bun install
bun x playwright install --with-deps

dotnet restore --verbosity quiet
dotnet build --verbosity quiet
dotnet test --verbosity quiet
```

## Contributing

- Use conventional commit messages (e.g. `feat:`, `fix:`, `docs:`).
- Update `AGENTS.md` with relevant repository information when files change.
