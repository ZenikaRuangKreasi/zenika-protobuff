## Automated Versioning

Every push to the `main` branch automatically bumps the patch version (`vMAJOR.MINOR.PATCH`) and pushes a Git tag via a GitHub Actions workflow (see [.github/workflows/auto-version.yml](.github/workflows/auto-version.yml)).

• The workflow fetches the latest semantic tag.
• If no tags exist it starts at `v0.0.1`.
• Otherwise it increments the numeric `PATCH` component and publishes the new tag.

This keeps the module usable via Go modules (`go get`) without having to create tags manually.
