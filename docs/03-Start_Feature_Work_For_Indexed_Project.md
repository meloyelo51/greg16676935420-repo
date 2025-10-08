## “Start feature work” kickoff prompt (for a project that’s already indexed)

Target project: <project_slug> (from project-index.json)

Steps:
1) Read projects/<project_slug>/docs/roadmap.md and list open tickets (Active + Backlog).
2) If I pick a ticket, restate its user story, acceptance criteria, out-of-scope, impact map, target repo, and fixed apply method for this session.
3) Post an Implementation Plan + Risk/Regression checklist BEFORE any code.
4) Apply changes only to the project repo; update verification steps, regression sentinels, and changelog fragment.
5) If stuck, write projects/<project_slug>/docs/stuck/<slug>.md and present smallest next slice + revert plan.
