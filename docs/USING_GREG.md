# Using Greg
 
## First message in a new chat
    Repo: meloyelo51/greg16676935420-repo
    Branch: docs/greg-onboarding (or feature/greg-demo)
    Delivery: unified diffs (multi-file changes.patch). Fallback to direct writes if needed.
 
## Apply
    git apply --check changes.patch
    git apply --index changes.patch || git apply --3way --index changes.patch
    git commit -m "Apply Greg patch"
 
## Helpers
    ./scripts/apply-patch.sh "Apply Greg patch"
    # or
    pwsh ./apply-patch.ps1 -Message "Apply Greg patch"
 
## Large/Binary
