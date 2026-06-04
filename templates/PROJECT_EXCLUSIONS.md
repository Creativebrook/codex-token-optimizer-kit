# PROJECT_EXCLUSIONS

This file lists folders and files Codex should not read, search, summarise, or use as context by default.

## Main rule

Do not open, search, summarise, or use these paths as context unless explicitly requested.

## Folders to ignore by default

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

## Files to ignore by default

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

## Log rules

Do not read full logs. Extract only the relevant error block, usually 20–40 lines.
