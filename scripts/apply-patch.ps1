#!/usr/bin/env pwsh
$ErrorActionPreference = 'Stop'

$PATCH_FILE = "changes.patch"

if (!(Test-Path $PATCH_FILE)) {
  Write-Error "changes.patch not found in repo root."
}

# Optional: branch management (commented out by default)
# $BASE_BRANCH = $env:BASE_BRANCH; if (-not $BASE_BRANCH) { $BASE_BRANCH = "origin/main" }
# $WORK_BRANCH = $env:WORK_BRANCH; if (-not $WORK_BRANCH) { $WORK_BRANCH = "feature/greg-work" }
# git fetch origin | Out-Null
# git checkout -B $WORK_BRANCH $BASE_BRANCH | Out-Null

# Preflight
$dirty = (git status --porcelain)
if ($dirty) {
  Write-Error "Working tree not clean. Commit or stash first."
}

Write-Host "Dry run..."
git apply --check $PATCH_FILE | Out-Null

Write-Host "Applying patch..."
try {
  git apply --index $PATCH_FILE | Out-Null
} catch {
  Write-Host "Straight apply failed; trying 3-way..."
  git apply --3way --index $PATCH_FILE | Out-Null
}

param([string]$Message = "Apply changes.patch")
git commit -m $Message | Out-Null

$branch = (git branch --show-current)
Write-Host "Patch applied and committed on $branch"
Write-Host "Tip: push with: git push -u origin $branch"
