param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$Path,

    [Parameter(Mandatory=$false)]
    [int]$Head = 40,

    [Parameter(Mandatory=$false)]
    [int]$Tail = 20
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $Path)) {
    Write-Error "File not found: $Path"
    exit 1
}

$item = Get-Item $Path

if ($item.PSIsContainer) {
    Write-Error "The provided path is a folder, not a file: $Path"
    exit 1
}

$sensitivePatterns = @(".env",".env.","credentials","service-account","service_account","token","auth.json","secrets")
$lower = $item.Name.ToLowerInvariant()

foreach ($pattern in $sensitivePatterns) {
    if ($lower.Contains($pattern)) {
        Write-Error "Blocked for safety. File appears sensitive: $($item.Name)"
        exit 1
    }
}

$blockedExtensions = @(".zip",".rar",".7z",".tar",".gz",".sqlite",".sqlite3",".db",".db3",".xlsx",".xls",".ods",".png",".jpg",".jpeg",".webp",".gif",".pdf")

if ($blockedExtensions -contains $item.Extension.ToLowerInvariant()) {
    Write-Error "Extension blocked for safe text summary: $($item.Extension)"
    exit 1
}

$lines = Get-Content -LiteralPath $item.FullName -Encoding UTF8
$total = $lines.Count

Write-Host "File: $($item.FullName)"
Write-Host "Total lines: $total"
Write-Host "Size: $([math]::Round($item.Length / 1KB, 2)) KB"
Write-Host ""

if ($total -le ($Head + $Tail)) {
    Write-Host "---- Full content ----"
    $lines
    exit 0
}

Write-Host "---- First $Head lines ----"
$lines | Select-Object -First $Head

Write-Host ""
Write-Host "---- Last $Tail lines ----"
$lines | Select-Object -Last $Tail
