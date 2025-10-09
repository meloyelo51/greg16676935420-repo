# Feature: timeframe-controls

## Project
- slug: order-sentinel
- repo: https://github.com/meloyelo51/wp-ordersentinel
- default_branch: main

## User Story
As an analyst, I want Top IPs/Routes to honor a timeframe so reports are relevant.

## Acceptance Criteria
- [ ] Controls set a time window
- [ ] Titles reflect timeframe

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
Adjust timeframe; verify tables/titles update.
