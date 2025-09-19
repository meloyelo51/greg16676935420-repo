# Using Greg

This doc covers how to start a new chat session effectively, how Greg delivers, and how to apply changes safely.

## TL;DR
- First message should identify the repo, target branch, and delivery preference.
- Greg ships a single unified diff named `changes.patch` plus copy-paste commands.
- Use helpers: `scripts/save-chat-patch.(sh|ps1)` (paste→apply) or `scripts/apply-patch.(sh|ps1)` (apply existing patch).

## First message in a new chat (existing repo)
    Repo: <owner>/<repo>
    Branch: <branch> (e.g., docs/greg-onboarding)
    Delivery: unified diffs (multi-file changes.patch). Fallback to direct writes if needed.
    Source of truth: the repo

## “Setup Command Chat” (brand-new project)
1) Create the target repo (empty README ok).
2) Tell Greg:
    Repo: <owner>/<new-repo>
    Branch: main
    I need bootstrap: add patch helpers, .gitattributes (LF), and a smoke test doc.
    Delivery: unified diffs (changes.patch); fallback to direct writes if patching fails.
3) Greg ships helpers + docs; use the paste→apply helper to commit.

## Paste→Apply (recommended)
    ./scripts/save-chat-patch.sh "Apply Greg chat patch"
    (paste diff; Ctrl-D in Git Bash / Ctrl-Z then Enter in PowerShell)

## Apply an existing patch file
    ./scripts/apply-patch.sh "Apply changes.patch"
    pwsh ./scripts/apply-patch.ps1 -Message "Apply changes.patch"

## Large/Binary Files
- Greg ships Base64 in parts + reassembler (Bash/PowerShell) with SHA-256 verification and cleanup.

## Troubleshooting
- If a patch corrupts: re-copy, ensure final newline, or ask Greg for direct writes.
- See `docs/PATCH_PIPELINE_TROUBLESHOOTING.md` for terminal quirks and VS Code settings.
