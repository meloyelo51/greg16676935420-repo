# Feature: <concise slug/title>

## Project
- slug: <project_slug>
- repo: <git url or identifier from project-index.json>
- default_branch: <main|develop|...>

## User Story
As a <role>, I want <goal>, so that <benefit>.

## Acceptance Criteria
- [ ] <criteria 1>
- [ ] <criteria 2>
- [ ] <criteria 3>

## Out of Scope
- <items explicitly not included>

## Impact Map (in project repo)
Likely touched:
- <files/modules/endpoints>

## Implementation Notes (initial)
- Feature branch (project repo): feature/<feature-slug>
- Apply method for this session: <python-one-shot | save-chat-patch.sh | ps1>
- Minimal slice first; add feature flag if risky.

## Rollback Notes
- Revert the feature branch merge; remove newly created files; no data migrations.

## Minimal Test Plan
Manual:
1) <step>
2) <expected>

Quick checks:
- curl GET <endpoint> returns 200 and expected marker text.

## Links
- Roadmap: projects/<project_slug>/docs/roadmap.md
- Regression sentinels: projects/<project_slug>/docs/regression-sentinels.md
