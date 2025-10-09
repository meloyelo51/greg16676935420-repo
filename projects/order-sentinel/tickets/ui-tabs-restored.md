# Feature: ui-tabs-restored

## Project
- slug: order-sentinel
- repo: https://github.com/meloyelo51/wp-ordersentinel
- default_branch: main

## User Story
As a user, I want Overview/Tools/Settings tabs visible so navigation is clear.

## Acceptance Criteria
- [ ] Tabs render consistently
- [ ] CSV column label uses Status

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
Open REST Monitor; confirm tabs and CSV label.
