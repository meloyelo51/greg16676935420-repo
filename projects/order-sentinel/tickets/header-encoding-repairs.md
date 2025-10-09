# Feature: header-encoding-repairs

## Project
- slug: order-sentinel
- repo: https://github.com/meloyelo51/wp-ordersentinel
- default_branch: main

## User Story
As a maintainer, I need BOM/garbage stripped and version bumps to work with one-shot builds.

## Acceptance Criteria
- [ ] BOM removed
- [ ] Header/class version bumps in sync

## Out of Scope
- Styling/UX unless explicitly requested

## Impact Map (project repo)
- order-sentinel/includes/...

## Implementation Notes (initial)
- Status: COMPLETE
- Branch: <tbd>\n- Apply method: python one-shot for single-file; save-chat-patch.sh if multi-file

## Rollback Notes
- Revert merge/commit; remove newly created files

## Minimal Test Plan
Inspect headers; run build; versions match.
