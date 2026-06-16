# Install personal Claude Code skills into ~/.claude/skills (Windows / PowerShell)
# Usage:  powershell -ExecutionPolicy Bypass -File .\install.ps1
$ErrorActionPreference = "Stop"

$src  = Join-Path $PSScriptRoot "skills"
$dest = Join-Path $HOME ".claude\skills"

if (-not (Test-Path $src)) { throw "skills/ folder not found next to this script." }
New-Item -ItemType Directory -Force -Path $dest | Out-Null

Write-Host "Installing skills:  $src  ->  $dest"
Get-ChildItem -Path $src -Directory | ForEach-Object {
    $target = Join-Path $dest $_.Name
    if (Test-Path $target) { Remove-Item -Recurse -Force $target }
    Copy-Item -Recurse -Force $_.FullName $target
    Write-Host "  installed: $($_.Name)"
}
Write-Host ""
Write-Host "Done. Restart Claude Code to pick up the skills."
Write-Host "Plugins (superpowers, frontend-design, ralph-skills, claude-hud) are NOT included here."
Write-Host "Install them via the /plugin menu - see README.md."
