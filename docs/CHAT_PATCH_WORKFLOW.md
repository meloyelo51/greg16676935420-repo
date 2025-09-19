# Chat Patch Workflow

This doc explains the paste→apply→commit flow using repo helpers.

## TL;DR
- Run a helper
- Paste the unified diff (starts with 'diff --git ...')
- Finish paste (Ctrl-D in Git Bash; Ctrl-Z then Enter in PowerShell)
- Helper normalizes line endings, dry-runs, applies, commits

## Git Bash
1. Save & apply:
    ./scripts/save-chat-patch.sh "docs: apply chat patch"
2. Paste the diff, press Ctrl-D.

## PowerShell
1. Save & apply:
    pwsh ./scripts/save-chat-patch.ps1 -Message "docs: apply chat patch"
2. Paste the diff, press Ctrl-Z, then Enter.

## After commit
Review and push:
    git show --stat -1
    git push -u origin $(git branch --show-current)

## Tips
- Use the code block Copy button when grabbing diffs.
- If dry-run fails, re-copy and try again.
- For binaries, Greg will send Base64 parts + a reassembler.
- You can also use scripts/apply-patch.sh or .ps1 directly.
