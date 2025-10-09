# Feature: combined-order-metabox

## Project
- slug: order-sentinel
- repo: https://github.com/meloyelo51/wp-ordersentinel
- default_branch: main

## User Story
As a store admin, I want a single OrderSentinel metabox showing IP/XFF, OSINT links, jump links, and AbuseIPDB action.

## Acceptance Criteria
- [ ] Metabox shows IP/XFF & OSINT links
- [ ] Jump links to REST/Tools
- [ ] AbuseIPDB action
- [ ] Subtable: latest REST hits for this IP
- [ ] Show last AbuseIPDB report timestamp

## Out of Scope
- Styling/UX unless explicitly requested

## Impact Map (project repo)
- order-sentinel/includes/os-order-metabox.php
- order-sentinel/includes/class-os-rest-monitor.php

## Implementation Notes (initial)
- Status: IN PROGRESS
- Branch: feature/combined-order-metabox
- Apply method: python one-shot for single files; save-chat-patch.sh if multiple

## Rollback Notes
- Feature-flag metabox; remove registration if needed

## Minimal Test Plan
Open order edit; verify metabox; confirm no nested forms.
