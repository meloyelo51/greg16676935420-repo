# Feature: occasional-version-packaging-drift

## Project
- slug: order-sentinel
- repo: https://github.com/meloyelo51/wp-ordersentinel
- default_branch: main

## User Story
As a releaser, I need version and filenames consistent in build artifacts.

## Acceptance Criteria
- [ ] Header & class const bumped together
- [ ] ZIP names normalized
- [ ] Excludes enforced

## Out of Scope
- Styling/UX unless explicitly requested

## Impact Map (project repo)
- order-sentinel/includes/...

## Implementation Notes (initial)
- Status: STUCK
- Preferred Python-only packer

## Rollback Notes
- Revert merge/commit; remove newly created files

## Minimal Test Plan
Run packer; compare versions and ZIP name.
