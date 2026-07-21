# AppLogger

AppLogger is a Swift package wrapping Apple's unified logging APIs and providing reusable logging-formatting helpers.

## Shared guidelines

Read the relevant shared guides before changing the package:

- [Swift](AgentGuidelines/Guidelines/Swift/Swift.md)
- [Swift style](AgentGuidelines/Guidelines/Swift/SwiftStyle.md)
- [Unit and integration testing](AgentGuidelines/Guidelines/Testing/UnitTesting.md)
- [Documentation](AgentGuidelines/Guidelines/Documentation.md)
- [Packages](AgentGuidelines/Guidelines/Packages.md)
- [CI/CD](AgentGuidelines/Guidelines/CICD.md)

## Package layout

- Production sources live under `Sources/AppLogger/`.
- Shared extensions live under `Sources/Extensions/`.
- Tests live under `Tests/AppLoggerTests/`.

Keep the package UI-agnostic and preserve its public API's minimal scope.
