# Feature: hpos-compat

## Project
- slug: order-sentinel
- repo: https://github.com/meloyelo51/wp-ordersentinel
- default_branch: main

## User Story
As a store owner, I want the metabox and storage to work with HPOS enabled.

## Acceptance Criteria
- [ ] HPOS-compatible metabox
- [ ] Storage reads/writes under HPOS

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
1) <step>\n2) <expected>
