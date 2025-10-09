#!/usr/bin/env bash
set -euo pipefail

PATCH_FILE="changes.patch"
MSG="Apply chat patch"
ON_EXISTS="append"  # append|overwrite|abort

# Parse flags/args: --message/-m "msg", --on-exists=append|overwrite|abort, or first arg as message
while [[ $# -gt 0 ]]; do
  case "$1" in
    --message|-m) MSG="${2:-$MSG}"; shift 2;;
    --on-exists=*) ON_EXISTS="${1#*=}"; shift;;
    *) MSG="$1"; shift;;
  esac
done

echo "Paste the unified diff starting at 'diff --git ...', then press Ctrl-D to finish:"
cat > "$PATCH_FILE"

# Normalize CRLF to LF
if grep -q $'\r' "$PATCH_FILE"; then sed -i 's/\r$//' "$PATCH_FILE"; fi
# Ensure final newline
if [[ -n "$(tail -c1 "$PATCH_FILE" || true)" ]]; then printf '\n' >> "$PATCH_FILE"; fi

echo "== Diffstat =="
git apply --stat "$PATCH_FILE" || true

echo "== Dry run =="
set +e
DRYRUN_OUT="$(git apply --check --whitespace=nowarn "$PATCH_FILE" 2>&1)"
DRYRUN_RC=$?
set -e

# Extract new-file hunks and write them if they already exist (fallback path)
fallback_newfiles() {
  local mode="$1"  # append|overwrite
  # Parse the patch and print: <<<FILE path>>> then content lines (without '+')
  awk '
    BEGIN { is_new=0; collecting=0; header_printed=0; outpath="" }
    /^diff --git / { is_new=0; collecting=0; header_printed=0; outpath=""; next }
    /^new file mode / { is_new=1; next }
    (is_new==1) && /^\+\+\+ b\// { outpath=substr($0,7); next }
    (is_new==1) && /^@@/ { collecting=1; next }
    (is_new==1) && (collecting==1) {
      if ($0 ~ /^@@/) { next }
      if ($0 ~ /^diff --git /) { collecting=0; next }
      if ($0 ~ /^\+/) {
        if (header_printed==0 && outpath!="") { print "<<<FILE " outpath ">>>"; header_printed=1 }
        print substr($0,2)
      }
      next
    }
  ' "$PATCH_FILE" | \
  awk -v MODE="$mode" '
    BEGIN { path=""; }
    /^<<<FILE / {
      if (path!="") { close(f) }
      path=$0; sub(/^<<<FILE /,"",path); sub(/>>>$/,"",path);
      dir=path; sub(/\/[^\/]+$/,"",dir);
      cmd="mkdir -p \"" dir "\""; system(cmd);
      if (MODE=="overwrite") f=path; else f=path;
      # truncate if overwrite
      if (MODE=="overwrite") { close(f); system("rm -f \"" path "\""); }
      next
    }
    {
      if (path!="") {
        # append line with LF
        print $0 >> path
      }
    }
    END { if (path!="") { close(path) } }
  '
}

if [[ $DRYRUN_RC -ne 0 ]]; then
  echo "$DRYRUN_OUT"
  if grep -q "already exists in working directory" <<<"$DRYRUN_OUT"; then
    case "$ON_EXISTS" in
      append|overwrite)
        echo "== Handling 'already exists' for new-file hunks (mode: $ON_EXISTS) =="
        fallback_newfiles "$ON_EXISTS"
        git add -A
        echo "== Retrying apply after fallback =="
        if ! git apply --index --whitespace=nowarn "$PATCH_FILE"; then
          echo "Straight apply failed; trying 3-way..."
          git apply --3way --index --whitespace=nowarn "$PATCH_FILE"
        fi
        git commit -m "$MSG"
        BRANCH="$(git branch --show-current)"
        echo "Committed on $BRANCH"
        echo "Push with: git push -u origin \"$BRANCH\""
        exit 0
        ;;
      abort|*)
        echo "Existing-file conflict for new-file hunks. Re-run with --on-exists=append or --on-exists=overwrite"
        exit 2
        ;;
    esac
  fi
  echo "Patch dry-run failed and no fallback handled it."
  exit 1
fi

# Normal path
if ! git apply --index --whitespace=nowarn "$PATCH_FILE"; then
  echo "Straight apply failed; trying 3-way..."
  git apply --3way --index --whitespace=nowarn "$PATCH_FILE"
fi
git commit -m "$MSG"

BRANCH="$(git branch --show-current)"
echo "Committed on $BRANCH"
echo "Push with: git push -u origin \"$BRANCH\""
