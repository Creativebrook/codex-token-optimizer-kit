# Usage

## Helper examples

Search efficiently:

```powershell
..\tools\codex-helpers\search_symbol.ps1 "PROJECT_EXCLUSIONS"
```

Search whole-word matches:

```powershell
..\tools\codex-helpers\find_usages.ps1 "customerId"
```

List changed files:

```powershell
..\tools\codex-helpers\list_changed_files.ps1
```

Summarise a file:

```powershell
..\tools\codex-helpers\summarize_file.ps1 ".\references\INDEX.md"
```

Summarise with more lines:

```powershell
..\tools\codex-helpers\summarize_file.ps1 ".\references\INDEX.md" -Head 60 -Tail 30
```

## Prompt pattern

```text
Use token-efficient-workflow. Before opening large files, use the helpers in ..\tools\codex-helpers\. Respect PROJECT_EXCLUSIONS.md. Keep the final response short.
```

## Good final response format

```markdown
Done:
- ...

Changed:
- ...

Validated:
- ...

Missing / risk:
- ...

Next step:
- ...
```
