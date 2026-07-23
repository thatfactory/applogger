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
## Codex review scope

For consumer pull requests, do not substantively review `AgentGuidelines/**` after exact tagged-tree provenance has been verified. Verify its `VERSION`, compare its tree with the matching central tag, and verify the required `.gitattributes` rule. If provenance does not match exactly, review the subtree contents and stop the merge. Report substantive guideline feedback against the central `agent-guidelines` pull request.
