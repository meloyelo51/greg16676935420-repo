#!/usr/bin/env pwsh
param([string]$Message = "Apply chat patch")
$ErrorActionPreference = 'Stop'
$PatchFile = "changes.patch"
Write-Host "Paste the unified diff starting at 'diff --git ...', then press Ctrl-Z and Enter to finish:"
# Read all stdin (multi-line)
$patch = [Console]::In.ReadToEnd()
# Write as UTF-8 LF
[IO.File]::WriteAllText((Resolve-Path .).Path + [IO.Path]::DirectorySeparatorChar + $PatchFile, $patch, [Text.Encoding]::UTF8)
# Normalize CRLF -> LF
$content = Get-Content -Raw -LiteralPath $PatchFile
if ($content.Contains("`r")) { $content = $content -replace "`r",""; [IO.File]::WriteAllText($PatchFile, $content, [Text.Encoding]::UTF8) }
# Ensure final newline
$bytes = [IO.File]::ReadAllBytes($PatchFile)
if ($bytes.Length -eq 0 -or $bytes[-1] -ne 10) { Add-Content -LiteralPath $PatchFile -Value "`n" -NoNewline:$true }
# Diffstat + dry run
git apply --stat $PatchFile | Out-Null
git apply --check --whitespace=nowarn $PatchFile | Out-Null
# Apply+commit
if (Test-Path ./scripts/apply-patch.v2.ps1) {
  pwsh ./scripts/apply-patch.v2.ps1 -PatchFile $PatchFile -Message $Message
} else {
  try {
    git apply --index --whitespace=nowarn $PatchFile | Out-Null
  } catch {
    Write-Host "Straight apply failed; trying 3-way..."
    git apply --3way --index --whitespace=nowarn $PatchFile | Out-Null
  }
  git commit -m $Message | Out-Null
}
$branch = (git branch --show-current)
Write-Host "Committed on $branch"
Write-Host "Push with: git push -u origin $branch"
