## Example: Greg’s Expected Kickoff Response
1️⃣ He should first locate the project in project-index.json

✅ Found project entry
Project: WP AI CommerceHub
Repo: meloyelo51/wp-ai-commercehub
Default branch: main
Review profile: wp-plugin
Primary paths: wp-content/plugins/wp-ai-commercehub

If not found, he should ask:

“I can’t find that project in project-index.json — do you want to import it?”

2️⃣ Then he should read its roadmap and summarize tickets by status

Example output (generated from your memory repo layout):
## Roadmap — WP AI CommerceHub

### Active
- [ ] tickets/feature-product-sync.md — WooCommerce product sync service (⚙️ In Progress)
- [ ] tickets/feature-ai-pricing.md — AI-based dynamic pricing module (🧩 Stuck)

### Backlog
- [ ] tickets/feature-bulk-import.md — Import existing catalog (💡 Backlog)

### Done
- [x] tickets/feature-plugin-bootstrap.md — Base plugin scaffolding (✅ Complete)

Then Greg summarizes:

✅ 1 completed feature (bootstrap)

⚙️ 1 active feature (product sync)

🧩 1 stuck (AI pricing)

💡 1 backlog (bulk import)

No paused tickets detected.

Regression sentinels found for: /wp-json/, /, /admin.

3️⃣ He then asks which ticket to pick up

“Which ticket would you like to work on next?
(Active: feature-product-sync | Stuck: feature-ai-pricing | Backlog: feature-bulk-import)”

If you choose one (say, feature-product-sync), he should immediately restate:

## Ticket: feature-product-sync
### User Story
As a store admin, I want products to sync automatically between WordPress and an external API
so that inventory and pricing remain consistent without manual updates.

### Acceptance Criteria
- [ ] Sync runs automatically on schedule.
- [ ] Sync can also be triggered manually.
- [ ] Only changed products are updated.

### Out of Scope
- Styling or dashboard UX improvements.

### Impact Map
- wp-ai-commercehub/includes/sync-service.php
- wp-ai-commercehub/cron-hooks.php

### Implementation Plan (proposed)
1. Add CRON hook to run `SyncService::run()`.
2. Use WP-Cron or Action Scheduler.
3. Create minimal logging to `wp-content/uploads/commercehub-logs/sync.log`.
4. Verify on staging before enabling in production.

### Risk / Regression Checklist
- Ensure CRON frequency not too high.
- Avoid duplicate product creation.
- Test rollback via disable CRON.

### Apply Method
- Python one-shot for single new files.
- Bash `save-chat-patch.sh` for multi-file diffs.

### Next Step
Confirm this plan before I start coding.

4️⃣ He pauses and waits for you to confirm

Greg must not write code yet.
He will explicitly ask something like:

“Confirm that the above implementation plan looks good, or tell me what to adjust. Once confirmed, I’ll start the patch using the declared apply method.”

✅ Summary — What You Should See Before Any Code

Project resolved from project-index.json

Roadmap summarized with statuses and ticket counts

Feature selection prompt

Ticket restatement + Implementation Plan + Risk list

A confirmation question before proceeding with code

If Greg skips any of those or dives into code prematurely, it means his context wasn’t initialized correctly — you can re-paste the kickoff prompt to reset him.