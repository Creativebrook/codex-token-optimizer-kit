# Troubleshooting

## Codex crashes or shows memory allocation errors

Try this order:

1. Reload Codex.
2. Close heavy apps and browser tabs.
3. Check RAM usage in Task Manager.
4. Disable newly added skills temporarily by renaming their folder.
5. Restore a backup of `config.toml`.
6. Restart Codex.
7. Update Codex only after isolating config/skill issues.

## PowerShell blocks scripts

Try:

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

Then run the helper again.

## ripgrep is missing

`search_symbol.ps1` and `find_usages.ps1` require `rg`.

Install ripgrep or adapt the scripts to use `Select-String`.

## Git helper says not inside a repository

`list_changed_files.ps1` only works inside a Git repository.

Run it from a project that has `.git/`.

## Codex ignores helpers

Make sure the helpers are mentioned in:
- global `AGENTS.md`;
- project `AGENTS.md`;
- `token-efficient-workflow`;
- the task prompt when needed.

Example:

```text
Use token-efficient-workflow and use local helpers before opening large files.
```
