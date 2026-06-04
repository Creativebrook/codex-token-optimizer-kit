## Token economy

- Use the minimum context needed for the task.
- Prefer targeted search before opening files.
- Do not read large files, logs, exports, backups, or generated folders by default.
- Respect `PROJECT_EXCLUSIONS.md` when it exists.
- Use `token-efficient-workflow` for search, editing, debugging, automation, or repository inspection tasks.

## Local helpers

When working inside a project under `C:\Users\<YOUR_NAME>\Documents\Codex\`, prefer helper scripts in `..\tools\codex-helpers\` when they reduce unnecessary file reads, broad searches, or token usage.

```powershell
..\tools\codex-helpers\search_symbol.ps1 "term"
..\tools\codex-helpers\find_usages.ps1 "term"
..\tools\codex-helpers\list_changed_files.ps1
..\tools\codex-helpers\summarize_file.ps1 ".\AGENTS.md"
```

## Execution profile

Codex should not claim it changed profiles automatically during a session. Treat simple tasks as short/economic. Treat complex automations, WordPress, MCPs, publishing, credentials, scripts, sensitive data, and production changes as `deep`.
