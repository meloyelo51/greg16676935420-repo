# Feature: blacklist-import-placement

## Project
- slug: order-sentinel
- repo: https://github.com/meloyelo51/wp-ordersentinel
- default_branch: main

## User Story
As an admin, I want import/replace UI grouped in Settings to reduce confusion.

## Acceptance Criteria
- [ ] Import/replace controls located in Settings

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
Open Settings; import controls are grouped there.
