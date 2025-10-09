# Feature: baked-rest-monitor

## Project
- slug: order-sentinel
- repo: https://github.com/meloyelo51/wp-ordersentinel
- default_branch: main

## User Story
As a site admin, I want the REST monitor fully baked into the plugin so I can deploy without MU plugins.

## Acceptance Criteria
- [ ] MU functionality moved into /includes
- [ ] Admin menu under WooCommerce (fallback Tools)
- [ ] No MU files present in ZIP

## Out of Scope
- Styling/UX unless explicitly requested

## Impact Map (project repo)
- order-sentinel/includes/*
- order-sentinel/order-sentinel.php

## Implementation Notes (initial)
- Status: COMPLETE
- Branch: feature/baked-rest-monitor
- Apply method: python one-shot for single-file updates

## Rollback Notes
- Revert merge/commit; remove newly created files

## Minimal Test Plan
Activate plugin; verify menu and pages load without warnings.
