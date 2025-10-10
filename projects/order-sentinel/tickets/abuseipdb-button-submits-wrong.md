# Feature: abuseipdb-button-submits-wrong

## Project
- slug: order-sentinel
- repo: https://github.com/meloyelo51/wp-ordersentinel
- default_branch: main

## User Story
As an admin, I need the 'Report to AbuseIPDB' action to submit to the correct handler.

## Acceptance Criteria
- [ ] Button/link targets admin-post.php?action=ordersentinel_report_ip
- [ ] Proper nonce/capability checks
- [ ] No redirect to edit.php

## Out of Scope
- Styling/UX unless explicitly requested

## Impact Map (project repo)
- order-sentinel/includes/...

## Implementation Notes (initial)
- Status: COMPLETE (Released v1.0.38 on 2025-10-09)
- Likely nested form issue; use formaction/formmethod, or signed GET/AJAX

## Rollback Notes
- Revert merge/commit; remove newly created files

## Minimal Test Plan
Click report; handler runs; notice appears; URL correct.


## Completion Notes
- Released in **v1.0.38** (2025-10-09).
- Verified live; handler + redirect working; nonce/caps validated.
