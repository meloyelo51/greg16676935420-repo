# Feature: packaging-cleanup

## Project
- slug: order-sentinel
- repo: https://github.com/meloyelo51/wp-ordersentinel
- default_branch: main

## User Story
As a releaser, I want clean ZIPs built via Python so distributions are reliable.

## Acceptance Criteria
- [ ] Exclude MU/backup/hidden files
- [ ] Build dist/OrderSentinel-<ver>.zip via Python

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
Run Python build; inspect ZIP contents.
