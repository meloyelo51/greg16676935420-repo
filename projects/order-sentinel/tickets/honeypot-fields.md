# Feature: honeypot-fields

## Project
- slug: order-sentinel
- repo: https://github.com/meloyelo51/wp-ordersentinel
- default_branch: main

## User Story
As a site owner, I want configurable honeypot fields on key forms so bots trip them and I can log/ban or misdirect them without impacting real users.

## Acceptance Criteria
- [ ] Repeater config for multiple honeypot fields (name/label, placements, CSS hide toggle, “required look” toggle)
- [ ] Injected on selected forms (checkout/login/register/comment/shortcode)
- [ ] Server-side detection on submit; trip writes log row and applies configured action
- [ ] New admin tab “Honeypot” with paged log + quick actions (Ban/Allowlist/Export)
- [ ] Settings for default action + per-placement override
- [ ] Retention (rows/days) with scheduled prune
- [ ] No regressions to legitimate checkouts/logins/comments

## Compatibility
- **Gateways/Express**: Validate only when our honeypot inputs (field + nonce) are present (standard checkout). Express/offsite flows (Apple Pay / Google Pay / PayPal, etc.) untouched; per-gateway toggle available.
- **Contact Form 7**: **Default global inject** via `wpcf7_form_elements`; validate on `wpcf7_before_send_mail`. Optional `[ordersentinel_honeypot]` tag exists but is not required.
- **Themes**: Use stable Woo hooks; no template edits or custom CSS needed.

## Impact Map (project repo)
- order-sentinel/includes/
- order-sentinel/assets/
- order-sentinel/order-sentinel.php (admin menu/tabs)

## Implementation Notes (initial)
- Hooks: Woo checkout, WP login/register/comment; CF7 global inject (wpcf7_form_elements) + validate (wpcf7_before_send_mail); shortcode [ordersentinel_honeypot] optional
- New table wp_os_honeypot_logs (dbDelta)
- Settings key: ordersentinel_honeypot_options
- Stall page: static HTML (client wait) to avoid server load

## Rollback Notes
- Feature flag OFF; remove table on uninstall; remove settings

## Minimal Test Plan
1) Enable feature; add 1 honeypot field to checkout & login
2) Submit with field filled → logged + action executed
3) Submit with field empty → normal success
4) Toggle CSS hide off (manual visibility)
5) Switch actions (ban/404/403/custom/stall) verify each
6) Confirm retention pruning

## Status
- IN PLANNING
