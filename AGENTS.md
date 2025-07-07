# Repository Guidelines

- Use conventional commit messages such as `feat:`, `fix:` and `docs:`.
- Scripts:
  - `setup-act.sh` expects `ACT_VERSION` to install Docker and the `act` CLI.
  - `setup-bun.sh` installs Bun if missing.
  - `setup-dotnet.sh` expects `DOTNET_SDK_VERSION` and installs the .NET SDK.
- Keep this file and the README up to date when scripts or usage change.
