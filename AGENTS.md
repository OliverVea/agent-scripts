# Repository Guidelines

- Use conventional commit messages such as `feat:`, `fix:` and `docs:`.
- Scripts:
  - `setup-act.sh` installs Docker and `act`; pass the desired version as the first argument.
  - `setup-bun.sh` installs Bun if missing.
  - `setup-dotnet.sh` installs the .NET SDK. Pass the SDK version as the first argument.
- The README contains a general setup example showing how the scripts can be combined.
- Keep this file and the README up to date when scripts or usage change.
