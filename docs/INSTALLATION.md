# Installation

## 1. Copy helper scripts

Copy:

```text
tools/codex-helpers/
```

to:

```text
C:\Users\<YOUR_NAME>\Documents\Codex\tools\codex-helpers\
```

From any local project under `Documents\Codex`, call them with:

```powershell
..\tools\codex-helpers\search_symbol.ps1 "term"
```

## 2. Copy the skill

Copy:

```text
codex-home/skills/token-efficient-workflow/
```

to:

```text
C:\Users\<YOUR_NAME>\.codex\skills\token-efficient-workflow\
```

Restart Codex after copying the skill.

## 3. Add project files

Inside each project, add or adapt:

```text
AGENTS.md
PROJECT_EXCLUSIONS.md
context/
references/
```

Use the templates in `templates/`.

## 4. Optional profiles

Copy profile files from:

```text
templates/profiles/
```

to:

```text
C:\Users\<YOUR_NAME>\.codex\
```

Use with CLI:

```powershell
codex --profile fast
codex --profile standard
codex --profile deep
```

For Codex Desktop automations, configure model and reasoning effort directly in the automation settings.
