# Roadmap — order-sentinel

## Project
- Name: OrderSentinel — Fraud/OSINT helper for WooCommerce orders
- Repo: https://github.com/meloyelo51/wp-ordersentinel
- Default branch: main
- Paths: order-sentinel
- Review profile: wp-plugin

## Active
- [ ] projects/order-sentinel/tickets/combined-order-metabox.md — Single metabox with IP/XFF, OSINT links, jump links; add subtable "Latest REST hits for this IP" and last report timestamp (IN PROGRESS)
- [ ] projects/order-sentinel/tickets/abuseipdb-reporter.md — Server-side reporter method; admin notices wired (IN PROGRESS)

## Done
- [x] projects/order-sentinel/tickets/baked-rest-monitor.md — MU functionality baked into /includes; menu under WooCommerce (COMPLETE)
- [x] projects/order-sentinel/tickets/ui-tabs-restored.md — Overview/Tools/Settings tabs visible; CSV column uses Status (COMPLETE)
- [x] projects/order-sentinel/tickets/timeframe-controls.md — Top IPs/Routes honor window; titles reflect timeframe (COMPLETE)
- [x] projects/order-sentinel/tickets/blacklist-import-placement.md — Import/replace UI grouped in Settings (COMPLETE)
- [x] projects/order-sentinel/tickets/checkbox-persistence-fix.md — "Store JSON on the order" persistence fixed (COMPLETE)
- [x] projects/order-sentinel/tickets/packaging-cleanup.md — MU/backup/hidden files excluded; Python build packaging (COMPLETE)
- [x] projects/order-sentinel/tickets/header-encoding-repairs.md — BOM/garbage stripped; header/class version bumps via one-shot (COMPLETE)

## Stuck / Broken
- [ ] projects/order-sentinel/tickets/abuseipdb-button-submits-wrong.md — Order screen button submits to wrong endpoint (STUCK)
- [ ] projects/order-sentinel/tickets/occasional-version-packaging-drift.md — Version mismatch / bad filenames in ZIP (STUCK)

## Paused / Removed
- [ ] projects/order-sentinel/tickets/mu-plugins-approach.md — MU testing paused; target fully baked-in (PAUSED)

## Backlog / Ideas
- [ ] projects/order-sentinel/tickets/quick-ban-allow.md — Quick ban/allow from Recent Requests and order metabox (BACKLOG)
- [ ] projects/order-sentinel/tickets/table-scroll-resize.md — Horizontal scroll + resizable columns for REST tables (BACKLOG)
- [ ] projects/order-sentinel/tickets/full-address-fields.md — Show more address fields once tables are resizable (BACKLOG)
- [ ] projects/order-sentinel/tickets/hpos-compat.md — Ensure metabox/storage work with HPOS (BACKLOG)
- [ ] projects/order-sentinel/tickets/activity-line.md — Last AbuseIPDB report timestamp in metabox (BACKLOG)
- [ ] projects/order-sentinel/tickets/debug-page.md — Small debug page under Tools (BACKLOG)

### Notes
- Preferred method: Python one-shot for single files; use Python zipfile to build dist/OrderSentinel-<ver>.zip. Avoid zip CLI and PowerShell.
- Keep main plugin minimal; logic in /includes and /assets. Primary menu under WooCommerce (fallback Tools).


## Completed
- **abuseipdb-button-submits-wrong** — fixed quick-report button to canonical admin-post handler; shipped **v1.0.38** (2025-10-09).
- **abuseipdb-reporter** — server-side reporter verified live; shipped **v1.0.38** (2025-10-09).
