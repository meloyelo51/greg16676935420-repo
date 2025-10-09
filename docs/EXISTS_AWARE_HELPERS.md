# Exists-Aware Helpers

When a patch says “new file” but the file already exists (common after manual scaffolding), helpers can handle it.

## Bash: save-chat-patch
Default behavior: `--on-exists=append`
    ./scripts/save-chat-patch.sh --on-exists=append "Apply chat patch"
    ./scripts/save-chat-patch.sh --on-exists=overwrite "Apply chat patch"
    ./scripts/save-chat-patch.sh --on-exists=abort "Apply chat patch"

- **append**: append the hunk’s added lines to the existing file, then retry apply.
- **overwrite**: replace the file with the hunk’s added lines, then retry apply.
- **abort**: exit with a message.

## PowerShell: save-chat-patch
    pwsh ./scripts/save-chat-patch.ps1 -Message "Apply chat patch" -OnExists overwrite

- Detects “already exists”; with `-OnExists overwrite`, proceeds via 3-way apply. (Full auto-append can be added later.)

## Notes
- This fallback targets **new-file hunks only** (the `/dev/null → b/<path>` pattern).
- For complex conflicts or multiple hunks per file, prefer a direct-write overwrite and re-apply the remaining patch.
