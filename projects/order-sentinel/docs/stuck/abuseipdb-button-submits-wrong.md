# Stuck: abuseipdb-button-submits-wrong — order-sentinel

## Current Blocker
From order edit, "Report to AbuseIPDB" redirects to edit.php instead of admin-post.php. Likely nested <form>; inner form ignored.

## Smallest Next Slice
Use a <button> with formaction="admin-post.php" and formmethod="post" with hidden action=ordersentinel_report_ip + nonce; or signed GET; or AJAX.

## Options
- Button + formaction — simple; ensure nonce/cap checks
- Signed GET — simpler DOM; ensure capability + nonce in URL
- AJAX — flexible; needs handler + feedback

## Revert Plan
Hide/disable the button until handler is correct; keep OSINT links.

## Ask / Decision Needed
Choose approach (formaction vs signed GET vs AJAX) and confirm nonce/capability strategy.
