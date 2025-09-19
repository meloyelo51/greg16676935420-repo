# Project Bootstrap (New Repo)

Use this when starting a **new project repo** that Greg will work on.

## 1) Create context
Create `.ai/assistant-context.md` in the target repo:
    # Assistant Context
    Repo: <owner>/<repo>
    Preferred branch: main
    Delivery: unified diffs first; fallback to direct writes if patching fails.
    Notes: coding standards, versions, paths.

## 2) Add patch helpers
Copy these from **this Greg repo** into the new project:
- `scripts/save-chat-patch.sh` and `scripts/save-chat-patch.ps1`
- `scripts/apply-patch.v2.sh` and `scripts/apply-patch.v2.ps1`
- `.gitattributes` entries for `*.patch`, `*.diff`, `*.sh`, `*.ps1` → LF

## 3) Verify pipeline
In the project repo:
    ./scripts/save-chat-patch.sh "docs: pipeline smoke"
    (paste a tiny two-file diff; Ctrl-D to finish / Ctrl-Z then Enter in PowerShell)

## 4) First chat message (recommended)
    Repo: <owner>/<repo>
    Branch: main (or docs/greg-onboarding)
    Delivery: unified diffs (multi-file changes.patch). If patching fails, direct writes.
    Source of truth: the repo

## 5) Security
- Never commit secrets; use env or vault.
- Add `--dry-run` to deploy scripts; require explicit flags for destructive ops.
