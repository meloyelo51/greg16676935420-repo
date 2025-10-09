# Regression Sentinels — order-sentinel

## Pages / Admin Screens
- WooCommerce -> REST Monitor (and Tools fallback)
- WooCommerce order edit screen with OrderSentinel metabox

## API / Endpoints
- /wp-json/ (core) — no warnings/notices
- admin-post.php?action=ordersentinel_report_ip — must route correctly

## Critical Flows
- REST request logging to custom table (includes code, meth, etc.) without warnings
- CSV export shows Status column; consistent tab structure
- Packaging excludes MU and backup/hidden files; header/class versions in sync
