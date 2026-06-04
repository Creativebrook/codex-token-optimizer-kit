param(
    [Parameter(Mandatory=$false)]
    [switch]$IncludeUntracked
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Error "git is not installed or not available in PATH."
    exit 1
}

try {
    git rev-parse --is-inside-work-tree | Out-Null
} catch {
    Write-Error "This folder does not appear to be inside a Git repository."
    exit 1
}

$excludedPatterns = @(
    "node_modules/","vendor/","dist/","build/",".next/",".nuxt/","out/","coverage/",
    ".vite/",".parcel-cache/",".cache/","cache/","tmp/","temp/","downloads/","exports/",
    "export/","generated/","output/","outputs/","logs/","log/","backups/","backup/",
    "_backup/",".codex/"
)

$all = @(git diff --name-only) + @(git diff --cached --name-only)

if ($IncludeUntracked) {
    $all += git ls-files --others --exclude-standard
}

$all = $all | Where-Object { $_ -and $_.Trim() -ne "" } | Sort-Object -Unique

$filtered = foreach ($file in $all) {
    $skip = $false
    foreach ($pattern in $excludedPatterns) {
        if ($file -like "$pattern*") {
            $skip = $true
            break
        }
    }

    if (-not $skip) {
        $file
    }
}

Write-Host "Relevant changed files: $($filtered.Count)"
Write-Host ""

$filtered
