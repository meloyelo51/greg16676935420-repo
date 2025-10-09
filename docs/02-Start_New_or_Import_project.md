## “Start a new project/import” kickoff prompt (copy-paste for a new chat)

We’re using the hybrid model.

Memory repo: meloyelo51/greg16676935420-repo
Use `project-index.json` (array form) to resolve projects. Default branch = main unless specified.

Task: Import or start a project.
If the project is missing in the index, ask your import questionnaire (name/slug, repo URL, default branch, local path?, primary code paths?, review_profile) and propose the new index entry. Then create:
- projects/<slug>/docs/roadmap.md
- projects/<slug>/docs/regression-sentinels.md
- (optional) projects/<slug>/tickets/<slug>-setup.md

Rules:
- One ticket per feature/bugfix, under projects/<slug>/tickets/.
- Don’t change scope mid-feature. If I say “capture idea: …”, create a Backlog ticket and resume.
- Apply method (fixed per session): single-file → Python one-shot; multi-file → save-chat-patch.sh (or .ps1 on Windows). Don’t mix PS in Bash. Only switch on failure, and say why.

At start:
1) Read project-index.json and confirm the target project.
2) If missing, run the import flow above.
3) Show roadmap Active and Backlog tickets for that project and ask which to work on.
4) If none, propose the smallest new ticket and draft it from the template.
