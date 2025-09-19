#!/usr/bin/env pwsh
param(
  [string]$PatchFile = "changes.patch",
  [string]$Message = "Apply changes.patch"
)
$ErrorActionPreference = 'Stop'
#
# apply-patch.v2.ps1
# Features:
# - Ensures clean working tree
# - Normalizes CRLF -> LF in the patch
# - Ensures patch ends with a final newline
# - Shows diffstat
# - Applies with --whitespace=nowarn (3-way fallback)

function Ensure-CleanTree {
  $dirty = git status --porcelain
  if ($dirty) { throw "Working tree not clean. Commit or stash first." }
}

function Normalize-PatchLf {
  param([string]$Path)
  $content = Get-Content -Raw -LiteralPath $Path -ErrorAction Stop
  if ($content.Contains("`r")) {
    $content = $content -replace "`r",""
    [System.IO.File]::WriteAllText((Resolve-Path $Path), $content, [System.Text.Encoding]::UTF8)
  }
}

function Ensure-FinalNewline {
  param([string]$Path)
  $fsPath = (Resolve-Path $Path)
  $bytes = [System.IO.File]::ReadAllBytes($fsPath)
  if ($bytes.Length -eq 0) {
    Add-Content -LiteralPath $fsPath -Value "`n" -NoNewline:$false
    return
  }
  if ($bytes[-1] -ne 10) {
    Add-Content -LiteralPath $fsPath -Value "`n" -NoNewline:$true
  }
}

if (!(Test-Path -LiteralPath $PatchFile)) {
  throw "Patch not found: $PatchFile"
}

Ensure-CleanTree
Normalize-PatchLf -Path $PatchFile
Ensure-FinalNewline -Path $PatchFile

Write-Host "== Diffstat =="
git apply --stat $PatchFile | Out-Null

Write-Host "== Dry run check =="
git apply --check --whitespace=nowarn $PatchFile | Out-Null

Write-Host "== Applying =="
try {
  git apply --index --whitespace=nowarn $PatchFile | Out-Null
} catch {
  Write-Host "Straight apply failed; trying 3-way..."
  git apply --3way --index --whitespace=nowarn $PatchFile | Out-Null
}

git commit -m $Message | Out-Null
$branch = (git branch --show-current)
Write-Host "Committed on $branch"
Write-Host "Push with: git push -u origin $branch"
