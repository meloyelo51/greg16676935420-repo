# Chat Patch Workflow

Use the paste → apply → commit flow for multi-file diffs. This avoids CRLF/clipboard surprises.

## TL;DR
1. Run helper (paste mode).
2. Paste unified diff (starts with `diff --git ...`).
3. Finish paste (Git Bash: Ctrl-D, PowerShell: Ctrl-Z then Enter).
4. Helper normalizes CRLF, dry-runs, applies, commits. Push manually.

## Git Bash (recommended)
    ./scripts/save-chat-patch.sh "docs: apply Greg chat patch"
    # paste the diff, then press Ctrl-D

## PowerShell
    pwsh ./scripts/save-chat-patch.ps1 -Message "docs: apply Greg chat patch"
    # paste the diff, then press Ctrl-Z, Enter

## Verification
    git show --stat -1

## Tips
- Use the code-block Copy button when grabbing diffs.
- If dry-run fails, re-copy the diff and try again, or ask Greg for direct-writes.
- For binaries, Greg will send Base64 + a reassembler with SHA-256 verification.
