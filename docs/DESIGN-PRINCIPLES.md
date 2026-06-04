# Design Principles

## 1. Router, not encyclopedia

`AGENTS.md` should route Codex to the right context. It should not contain every detail.

Recommended order:
1. project identity;
2. critical rules;
3. where to find operational context;
4. where to find references;
5. exclusions and token economy rules.

## 2. Operational memory is short

The `context/` folder is not a knowledge base. It is short operational memory.

Use it for:
- current state;
- decisions;
- next actions;
- known issues.

Do not use it for:
- full project history;
- long strategy documents;
- pasted reports;
- research libraries.

## 3. References are mapped, not loaded

Use `references/INDEX.md` to decide which reference to open.

Do not open the whole references folder by default.

## 4. Logs are compressed

Logs should be filtered to the smallest useful block.

Never paste huge terminal outputs into Codex.

## 5. Automations need guardrails

Automations touching WordPress, Ads, MCPs, Gmail, Telegram, Netlify, GitHub, databases, or publishing should be treated as `deep` tasks.

They should:
- validate accounts/tools before actions;
- avoid destructive operations;
- keep logs short;
- notify only when critical actions succeeded;
- record missing metrics instead of inventing them.
