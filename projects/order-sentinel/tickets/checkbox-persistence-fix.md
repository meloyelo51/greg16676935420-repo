# Feature: checkbox-persistence-fix

## Project
- slug: order-sentinel
- repo: https://github.com/meloyelo51/wp-ordersentinel
- default_branch: main

## User Story
As an admin, I want the "Store JSON on the order" checkbox to persist correctly.

## Acceptance Criteria
- [ ] Read/save normalizers implemented
- [ ] Strict render check

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
Toggle, save, reload; state remains correct.
