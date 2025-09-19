#!/usr/bin/env bash
set -euo pipefail
PATCH_FILE="changes.patch"
MSG="${1:-Apply chat patch}"
echo "Paste the unified diff starting at 'diff --git ...', then press Ctrl-D to finish:"
# read all stdin to file
cat > "$PATCH_FILE"
# normalize CRLF to LF
if grep -q $'\r' "$PATCH_FILE"; then sed -i 's/\r$//' "$PATCH_FILE"; fi
# ensure final newline
if [[ -n "$(tail -c1 "$PATCH_FILE" || true)" ]]; then printf '\n' >> "$PATCH_FILE"; fi
# show quick stats
echo "== Diffstat =="
git apply --stat "$PATCH_FILE" || true
echo "== Dry run =="
git apply --check --whitespace=nowarn "$PATCH_FILE"
# apply+commit using v2 helper if present; else inline
if [[ -x "./scripts/apply-patch.v2.sh" ]]; then
  ./scripts/apply-patch.v2.sh "$PATCH_FILE" "$MSG"
else
  if ! git apply --index --whitespace=nowarn "$PATCH_FILE"; then
    echo "Straight apply failed; trying 3-way..."
    git apply --3way --index --whitespace=nowarn "$PATCH_FILE"
  fi
  git commit -m "$MSG"
fi
BRANCH="$(git branch --show-current)"
echo "Committed on $BRANCH"
echo "Push with: git push -u origin \"$BRANCH\""
