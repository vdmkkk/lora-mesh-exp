param([string]$Compiler = 'tectonic')

$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
Push-Location -LiteralPath $projectRoot
try {
    New-Item -ItemType Directory -Path 'build' -Force | Out-Null
    & $Compiler --keep-logs -o build article.tex
    if ($LASTEXITCODE -ne 0) { throw "Tectonic failed with exit code $LASTEXITCODE" }
    Write-Host 'PDF: build/article.pdf'
}
finally {
    Pop-Location
}
