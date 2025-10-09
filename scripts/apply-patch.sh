#!/usr/bin/env bash
set -euo pipefail
#
# apply-patch.sh (v2)
# Usage:
#   ./scripts/apply-patch.sh [PATCH_FILE] [COMMIT_MESSAGE]
# Defaults:
#   PATCH_FILE      = changes.patch
#   COMMIT_MESSAGE  = Apply changes.patch
#
# Features:
# - Ensures clean working tree
# - Normalizes CRLF -> LF in the patch
# - Ensures patch ends with a final newline
# - Shows diffstat
# - Applies with --whitespace=nowarn (3-way fallback)

PATCH_FILE="${1:-changes.patch}"
MSG="${2:-Apply changes.patch}"

if [[ ! -f "$PATCH_FILE" ]]; then
  echo "Patch not found: $PATCH_FILE" >&2
  exit 1
fi

# Clean tree check
if [[ -n "$(git status --porcelain)" ]]; then
  echo "Working tree not clean. Commit or stash first." >&2
  exit 1
fi

# Normalize CRLF to LF (Windows-safe)
if grep -q $'\r' "$PATCH_FILE"; then
  sed -i 's/\r$//' "$PATCH_FILE"
fi

# Ensure final newline at EOF
if [[ -n "$(tail -c1 "$PATCH_FILE" || true)" ]]; then
  printf '\n' >> "$PATCH_FILE"
fi

echo "== Diffstat =="
git apply --stat "$PATCH_FILE" || true

echo "== Dry run check =="
git apply --check --whitespace=nowarn "$PATCH_FILE"

echo "== Applying =="
if ! git apply --index --whitespace=nowarn "$PATCH_FILE"; then
  echo "Straight apply failed; trying 3-way..."
  git apply --3way --index --whitespace=nowarn "$PATCH_FILE"
fi

git commit -m "$MSG"

BRANCH="$(git branch --show-current)"
echo "Committed on $BRANCH"
echo "Push with: git push -u origin \"$BRANCH\""
