#!/usr/bin/env bash
set -euo pipefail

PATCH_FILE="changes.patch"

if [[ ! -f "$PATCH_FILE" ]]; then
  echo "changes.patch not found in repo root."
  exit 1
fi

# Optional: branch management (commented out by default)
# BASE_BRANCH="${BASE_BRANCH:-origin/main}"
# WORK_BRANCH="${WORK_BRANCH:-feature/greg-work}"
# git fetch origin
# git checkout -B "${WORK_BRANCH}" "${BASE_BRANCH}"

# Preflight
if [[ -n "$(git status --porcelain)" ]]; then
  echo "Working tree not clean. Commit/stash first."
  exit 1
fi

echo "Dry run..."
git apply --check "$PATCH_FILE"

echo "Applying patch..."
if ! git apply --index "$PATCH_FILE"; then
  echo "Straight apply failed; trying 3-way..."
  git apply --3way --index "$PATCH_FILE"
fi

MSG="${1:-Apply changes.patch}"
git commit -m "$MSG"

echo "Patch applied and committed."
echo "Tip: push your current branch with: git push -u origin $(git branch --show-current)"
