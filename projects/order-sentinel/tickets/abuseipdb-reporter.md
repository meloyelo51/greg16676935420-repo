# Feature: abuseipdb-reporter

## Project
- slug: order-sentinel
- repo: https://github.com/meloyelo51/wp-ordersentinel
- default_branch: main

## User Story
As an analyst, I want to report abusive IPs to AbuseIPDB from the order screen.

## Acceptance Criteria
- [ ] Server-side reporter method
- [ ] Admin notices wired
- [ ] Nonce/cap checks

## Out of Scope
- Styling/UX unless explicitly requested

## Impact Map (project repo)
- order-sentinel/includes/os-order-metabox.php
- order-sentinel/includes/osint/abuseipdb.php (if separated)

## Implementation Notes (initial)
- Status: IN PROGRESS
- Branch: feature/abuseipdb-reporter
- Apply method: python one-shot or save-chat-patch.sh if multi-file

## Rollback Notes
- Revert merge/commit; remove newly created files

## Minimal Test Plan
Report test IP; verify notice and handler call.
