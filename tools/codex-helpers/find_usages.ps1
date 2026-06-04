param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$Term,

    [Parameter(Mandatory=$false)]
    [int]$Context = 2
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command rg -ErrorAction SilentlyContinue)) {
    Write-Error "ripgrep (rg) is not installed or not available in PATH."
    exit 1
}

$exclusions = @(
    "!node_modules/**","!vendor/**","!dist/**","!build/**","!.next/**","!.nuxt/**",
    "!out/**","!coverage/**","!.vite/**","!.parcel-cache/**","!.cache/**","!cache/**",
    "!tmp/**","!temp/**","!downloads/**","!exports/**","!export/**","!generated/**",
    "!output/**","!outputs/**","!logs/**","!log/**","!backups/**","!backup/**","!_backup/**",
    "!.codex/**","!*.log","!*.zip","!*.rar","!*.7z","!*.tar","!*.gz","!*.bak","!*.backup",
    "!*.old","!*.tmp","!*.temp","!*.sql","!*.sqlite","!*.sqlite3","!*.db","!*.db3",
    "!*.sqlite-shm","!*.sqlite-wal","!*.csv","!*.xlsx","!*.xls","!*.ods","!.env","!.env.*",
    "!*.env","!credentials.json","!service-account*.json","!*service_account*.json",
    "!*credentials*.json","!*token*.json","!auth.json","!secrets.json"
)

$argsList = @("--line-number","--column","--hidden","--smart-case","--word-regexp","--context","$Context")

foreach ($g in $exclusions) {
    $argsList += "--glob"
    $argsList += $g
}

$argsList += $Term
$argsList += "."

Write-Host "Searching whole word for: $Term"
Write-Host "Folder: $(Get-Location)"
Write-Host ""

& rg @argsList
