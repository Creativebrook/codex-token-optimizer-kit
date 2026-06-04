---
name: token-efficient-workflow
description: Token-efficient workflow guardrails for Codex. Use for tasks that involve searching, reading, editing, debugging, summarising, running commands, inspecting repositories, handling logs, using project references, updating files, or producing final responses where Codex should avoid unnecessary context, large file reads, huge terminal outputs, broad workspace scans, verbose plans, or excessive final explanations.
---

# Token-Efficient Workflow

Use this skill to reduce token waste without reducing correctness.

Core rule:

> Read less first. Search narrowly. Open only what is needed. Summarise results. Keep outputs short.

## 1. Classify the task before acting

Classify every task mentally as one of:

- `simple`: small edit, short answer, single file, no risk.
- `standard`: normal project work, 1–3 relevant files, moderate validation.
- `deep`: debugging, automations, MCPs, WordPress, credentials, publishing, production data, multiple tools, or sensitive client/health data.

For `simple` tasks, do not make long plans, do not open references by default, and execute directly.

For `standard` tasks, use the minimum project context, inspect at most 1–3 relevant files, and validate only what matters.

For `deep` tasks, propose a short plan before risky actions, split work into phases, validate before and after changes, and avoid destructive actions without explicit approval.

## 2. Follow the context order

When working inside a project, use this order:

1. `AGENTS.md`
2. `context/CURRENT_STATE.md`, if task depends on current state
3. `context/KNOWN_ISSUES.md`, if task involves risks, errors, automations, clients, health, ads, or data
4. `references/INDEX.md`, only when project references are needed
5. Specific files selected by search or by the user

Do not open all of `references/`, `agents/`, `context/`, or `skills/` by default.

If `PROJECT_EXCLUSIONS.md` exists, respect it before searching, opening, or summarising files.

## 3. Search before opening

Before opening large or unknown files, search by precise keyword, prefer targeted commands, inspect filenames and small previews first, and avoid reading full files unless necessary.

Prefer project helpers when available:

```powershell
..\tools\codex-helpers\search_symbol.ps1 "term"
..\tools\codex-helpers\find_usages.ps1 "term"
..\tools\codex-helpers\list_changed_files.ps1
..\tools\codex-helpers\summarize_file.ps1 ".\path\file.md"
```

Avoid broad commands such as recursive directory dumps, opening entire large files, reading logs completely, or loading exports/backups/data files without reason.

## 4. Avoid noisy paths and files

Do not read, search, summarise or use as normal context unless explicitly needed:

```text
node_modules/
vendor/
dist/
build/
.next/
.nuxt/
coverage/
.cache/
tmp/
temp/
exports/
backups/
logs/
.codex/
```

Avoid by default:

```text
.env
.env.*
*.log
*.zip
*.bak
*.sql
*.sqlite
*.db
*.csv
*.xlsx
*.xls
credentials.json
*token*.json
secrets.json
```

## 5. Handle logs safely

Never paste or process huge logs as-is.

For errors, identify the command, extract the first relevant error block, include at most 20–40 useful lines, ignore repeated stack traces, summarise the likely cause, and suggest the next smallest validation step.

## 6. Edit with minimal diff

Change only what is necessary. Avoid global reformatting, unrelated cleanup, and whole-file rewrites unless asked.

## 7. Use references selectively

Use `references/INDEX.md` as the map. Use at most 1–3 reference files unless the user explicitly requests deeper research.

## 8. Protect automations

For automations, treat WordPress, MCPs, Ads, Gmail, Telegram, Netlify, GitHub, data exports, credentials, and publishing as `deep`.

Verify account/project identity before querying or writing. Avoid using one client’s data as another client’s source. Validate outputs before sending notifications. Keep logs short.

For health checks, use totals/insights first and request detail only if there is an alert.

For reports, use cached/local JSON for historical comparison when valid, call APIs only for new or missing data, and never invent missing metrics.

## 9. Final response format

For normal execution tasks, keep final response short.

Use this structure when useful:

```markdown
Done:
...

Changed:
...

Validated:
...

Missing / risk:
...

Next step:
...
```

## 10. Context update rule

Update `/context` only when there is a persistent project change: strategic decision, structural change, new known issue, new next action, or important completed milestone.

Do not update `/context` for isolated posts, small edits, brainstorming, one-off responses, or routine automation runs.
