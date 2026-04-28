param(
    [string]$OutputZip = "JPE_replication_package.zip"
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$zipPath = Join-Path $root $OutputZip

if (Test-Path $zipPath) {
    Remove-Item $zipPath -Force
}

# Package the current folder contents for Data Editor submission.
Compress-Archive -Path (Join-Path $root "*") -DestinationPath $zipPath -Force

Write-Host "Created package: $zipPath"
