#!/usr/bin/env bash
set -euo pipefail
#
# check-docs.sh — fail commit if docs are too short (to catch truncated one-liners)
# Config via env:
#   MIN_LINES   = minimum non-empty lines required (default: 6)
#   DOCS_GLOB   = glob to scan (default: docs/*.md)
#   IGNORE_GLOB = glob to ignore (default: docs/CHANGELOG*.md CHANGELOG.d/*.md)
#
MIN_LINES="${MIN_LINES:-6}"
DOCS_GLOB="${DOCS_GLOB:-docs/*.md}"
# Ignore changelogs by default; space-separated patterns
IGNORE_GLOB="${IGNORE_GLOB:-docs/CHANGELOG*.md CHANGELOG.d/*.md}"

shopt -s nullglob
fail_list=()

# Build ignore list as an associative set
declare -A ignore_set
for pat in $IGNORE_GLOB; do
  for f in $pat; do
    ignore_set["$f"]=1 || true
  done
done

for f in $DOCS_GLOB; do
  # skip ignored
  [[ -n "${ignore_set[$f]+x}" ]] && continue
  # skip non-regular files
  [[ -f "$f" ]] || continue
  # count non-empty lines
  nonempty=$(grep -cve '^[[:space:]]*$' "$f" || true)
  if [[ "${nonempty:-0}" -lt "$MIN_LINES" ]]; then
    fail_list+=("$f ($nonempty lines) < MIN_LINES=$MIN_LINES")
  fi
done

if [[ ${#fail_list[@]} -gt 0 ]]; then
  echo "✖ Docs length check failed. The following files look truncated or too short:" >&2
  for item in "${fail_list[@]}"; do echo "  - $item" >&2; done
  echo "Hint: increase MIN_LINES, or fix the file(s) before committing." >&2
  exit 1
fi

echo "✔ Docs length check passed (MIN_LINES=$MIN_LINES)"
