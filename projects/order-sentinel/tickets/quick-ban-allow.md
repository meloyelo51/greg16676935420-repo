# Feature: quick-ban-allow

## Project
- slug: order-sentinel
- repo: https://github.com/meloyelo51/wp-ordersentinel
- default_branch: main

## User Story
As an admin, I want quick ban/allow actions from Recent Requests and the order metabox.

## Acceptance Criteria
- [ ] Actions visible in both locations
- [ ] Persist to list storage

## Out of Scope
- Styling/UX unless explicitly requested

## Impact Map (project repo)
- order-sentinel/includes/...

## Implementation Notes (initial)
- Status: BACKLOG
- Branch: <tbd>\n- Apply method: python one-shot for single-file; save-chat-patch.sh if multi-file

## Rollback Notes
- Revert merge/commit; remove newly created files

## Minimal Test Plan
Ban/allow; lists update; UI reflects state.
