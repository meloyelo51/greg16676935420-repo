

# ===== abuseipdb-button-submits-wrong.md =====
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
- Status: STUCK
- Likely nested form issue; use formaction/formmethod, or signed GET/AJAX

## Rollback Notes
- Revert merge/commit; remove newly created files

## Minimal Test Plan
Click report; handler runs; notice appears; URL correct.



# ===== abuseipdb-reporter.md =====
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



# ===== activity-line.md =====
# Feature: activity-line

## Project
- slug: order-sentinel
- repo: https://github.com/meloyelo51/wp-ordersentinel
- default_branch: main

## User Story
As an analyst, I want to see the last AbuseIPDB report timestamp in the metabox.

## Acceptance Criteria
- [ ] Last report timestamp displayed

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



# ===== baked-rest-monitor.md =====
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



# ===== blacklist-import-placement.md =====
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



# ===== checkbox-persistence-fix.md =====
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



# ===== combined-order-metabox.md =====
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



# ===== debug-page.md =====
# Bug: debug-page

## Project
- slug: order-sentinel
- repo: https://github.com/meloyelo51/wp-ordersentinel
- default_branch: main

## User Story
As a developer, I want a small debug page under Tools.

## Acceptance Criteria
- [ ] Tools -> OrderSentinel Debug page exists
- [ ] Shows environment/status checks

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



# ===== full-address-fields.md =====
# Feature: full-address-fields

## Project
- slug: order-sentinel
- repo: https://github.com/meloyelo51/wp-ordersentinel
- default_branch: main

## User Story
As a reviewer, I want additional address fields once tables are resizable.

## Acceptance Criteria
- [ ] Additional fields visible without layout breakage

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



# ===== header-encoding-repairs.md =====
# Feature: header-encoding-repairs

## Project
- slug: order-sentinel
- repo: https://github.com/meloyelo51/wp-ordersentinel
- default_branch: main

## User Story
As a maintainer, I need BOM/garbage stripped and version bumps to work with one-shot builds.

## Acceptance Criteria
- [ ] BOM removed
- [ ] Header/class version bumps in sync

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
Inspect headers; run build; versions match.



# ===== hpos-compat.md =====
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



# ===== mu-plugins-approach.md =====
# Feature: mu-plugins-approach

## Project
- slug: order-sentinel
- repo: https://github.com/meloyelo51/wp-ordersentinel
- default_branch: main

## User Story
As a developer, I want to pause MU-plugin testing and ship fully baked-in.

## Acceptance Criteria
- [ ] No MU files in ZIP
- [ ] Plugin functions independently

## Out of Scope
- Styling/UX unless explicitly requested

## Impact Map (project repo)
- order-sentinel/includes/...

## Implementation Notes (initial)
- Status: PAUSED
- Decision captured; no code until changed

## Rollback Notes
- Revert merge/commit; remove newly created files

## Minimal Test Plan
1) <step>\n2) <expected>



# ===== occasional-version-packaging-drift.md =====
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



# ===== packaging-cleanup.md =====
# Feature: packaging-cleanup

## Project
- slug: order-sentinel
- repo: https://github.com/meloyelo51/wp-ordersentinel
- default_branch: main

## User Story
As a releaser, I want clean ZIPs built via Python so distributions are reliable.

## Acceptance Criteria
- [ ] Exclude MU/backup/hidden files
- [ ] Build dist/OrderSentinel-<ver>.zip via Python

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
Run Python build; inspect ZIP contents.



# ===== quick-ban-allow.md =====
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



# ===== table-scroll-resize.md =====
# Feature: table-scroll-resize

## Project
- slug: order-sentinel
- repo: https://github.com/meloyelo51/wp-ordersentinel
- default_branch: main

## User Story
As an analyst, I want horizontal scroll and resizable columns.

## Acceptance Criteria
- [ ] Tables support horizontal scroll
- [ ] Columns resizable

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



# ===== timeframe-controls.md =====
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



# ===== ui-tabs-restored.md =====
# Feature: ui-tabs-restored

## Project
- slug: order-sentinel
- repo: https://github.com/meloyelo51/wp-ordersentinel
- default_branch: main

## User Story
As a user, I want Overview/Tools/Settings tabs visible so navigation is clear.

## Acceptance Criteria
- [ ] Tabs render consistently
- [ ] CSV column label uses Status

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
Open REST Monitor; confirm tabs and CSV label.

