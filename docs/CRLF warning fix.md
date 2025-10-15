## CRLF warning (Fix for "CRLF will be replaced by LF…”)
## Set a repo-local policy and normalize once.
## Pick one policy (recommended): keep LF in repo, and do not auto-convert on checkout/commit.
## Run in each repo (memory + project):

# 1) Write a .gitattributes that enforces LF in repo
printf '* text=auto eol=lf\n*.sh text eol=lf\n*.php text eol=lf\n*.md text eol=lf\n*.json text eol=lf\n' > .gitattributes

# 2) Ensure Git won’t surprise-convert on your machine
git config core.autocrlf false
git config core.eol lf

# 3) Renormalize working tree -> index using the new attributes
git add --renormalize .
git commit -m "chore: enforce LF via .gitattributes and renormalize" || echo "(no changes to commit)"



## If you prefer Git to convert CRLF→LF on commit only (and leave existing working files alone), use:
git config core.autocrlf input

## …but keep the .gitattributes either way—that is the real source of truth across collaborators.