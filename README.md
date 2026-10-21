# Codex Token Optimizer Kit

A practical toolkit to reduce unnecessary token usage in OpenAI Codex Desktop / CLI workflows.

This kit helps Codex:
- search before opening files;
- avoid noisy folders, logs, backups, exports and credentials;
- use short project memory instead of rediscovering context;
- keep final responses concise;
- handle automations, MCPs, Ads, WordPress, Telegram, Gmail and reports with safer guardrails.

## What is included

```text
codex-token-optimizer-kit/
  README.md
  .gitignore

  codex-home/
    skills/
      token-efficient-workflow/
        SKILL.md
        agents/
          openai.yaml

  tools/
    codex-helpers/
      README.md
      search_symbol.ps1
      find_usages.ps1
      list_changed_files.ps1
      summarize_file.ps1

  templates/
    AGENTS.global.snippet.md
    AGENTS.project.snippet.md
    PROJECT_EXCLUSIONS.md
    references/
      INDEX.template.md
    context/
      CURRENT_STATE.template.md
      DECISIONS.template.md
      NEXT_ACTIONS.template.md
      KNOWN_ISSUES.template.md
    profiles/
      config.append.toml
      fast.config.toml
      standard.config.toml
      deep.config.toml

  docs/
    INSTALLATION.md
    USAGE.md
    DESIGN-PRINCIPLES.md
    TROUBLESHOOTING.md
```

## Quick install

### 1. Install helper scripts

Copy:

```text
tools/codex-helpers/
```

to your Codex workspace:

```text
C:\Users\<YOUR_NAME>\Documents\Codex\tools\codex-helpers\
```

Use from any project root:

```powershell
..\tools\codex-helpers\search_symbol.ps1 "term"
..\tools\codex-helpers\find_usages.ps1 "term"
..\tools\codex-helpers\list_changed_files.ps1
..\tools\codex-helpers\summarize_file.ps1 ".\AGENTS.md"
```

### 2. Install the skill

Copy:

```text
codex-home/skills/token-efficient-workflow/
```

to:

```text
C:\Users\<YOUR_NAME>\.codex\skills\token-efficient-workflow\
```

Restart Codex.

### 3. Add project-level guidance files

For each project, copy/adapt the relevant templates:

```text
templates/PROJECT_EXCLUSIONS.md
templates/context/
templates/references/INDEX.template.md
templates/AGENTS.project.snippet.md
```

Recommended project structure:

```text
your-project/
  AGENTS.md
  PROJECT_EXCLUSIONS.md
  context/
    CURRENT_STATE.md
    DECISIONS.md
    NEXT_ACTIONS.md
    KNOWN_ISSUES.md
  references/
    INDEX.md
    project/
    library/
```

### 4. Optional Codex profiles

Copy the files in:

```text
templates/profiles/
```

to:

```text
C:\Users\<YOUR_NAME>\.codex\
```

Back up your existing `config.toml` before editing it.

Example CLI usage:

```powershell
codex --profile fast
codex --profile standard
codex --profile deep
```

For Codex Desktop automations, configure model and reasoning effort directly in the automation settings when available.

## Recommended prompt prefixes

For token-efficient work:

```text
Use token-efficient-workflow. Search before opening files. Respect PROJECT_EXCLUSIONS.md. Use helpers when useful. Keep the final response short.
```

For sensitive automation/debugging:

```text
Use token-efficient-workflow. Treat this as a deep task. Validate accounts/tools before actions. Avoid destructive changes. Keep logs short.
```

## Core ideas

### 1. Search before reading

Use targeted search and small previews before opening large files.

### 2. Keep project memory short

Use `context/` for operational memory:
- current state;
- decisions;
- next actions;
- known issues.

Do not turn `context/` into a long knowledge base.

### 3. Use references selectively

Use `references/INDEX.md` as a map. Open only the specific reference files needed for the task.

### 4. Avoid noisy files

Use `PROJECT_EXCLUSIONS.md` to keep Codex away from:
- credentials;
- logs;
- backups;
- exports;
- databases;
- spreadsheets;
- generated files;
- dependency folders.

### 5. Treat risky automations as deep work

Automations involving MCPs, Ads, WordPress, Gmail, Telegram, Netlify, GitHub, credentials, publishing or production data should use stricter validation and short logs.

## What this kit does not do

This kit does not force Codex to always use helper scripts automatically.

Codex is more likely to use the helpers when:
- the project `AGENTS.md` mentions them;
- the global `AGENTS.md` mentions them;
- the `token-efficient-workflow` skill is triggered;
- the prompt explicitly asks to use local helpers;
- the task involves searching, inspecting, debugging or summarising files.

## Recommended repository name

```text
codex-token-optimizer-kit
```

## Recommended repository description

```text
A practical OpenAI Codex Desktop/CLI toolkit with helper scripts, skills, templates, and workflow rules to reduce token usage, avoid noisy context, and keep local AI coding/marketing projects efficient.
```


## Instalação rápida

Consulte docs/INSTALLATION.md para os caminhos e comandos detalhados. Reveja e adapte as instruções e templates antes de os copiar para a configuração global do Codex ou para os seus projetos.
