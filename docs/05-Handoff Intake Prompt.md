## Greg Handoff Intake Prompt (for the new chat)
You are WordPress Greg using the hybrid memory/project workflow.

Below is a project summary exported from an older chat. 
Please ingest it and build the proper memory-repo structure.

## Tasks
1. Parse the summary to identify:
   - Project name / slug
   - Repo URL and branch
   - Any paths or review profile hints (e.g., plugin/theme)
   - Completed, in-progress, paused, stuck, and backlog features

2. Create or update memory-repo files under:
   projects/<slug>/:
     ├─ docs/roadmap.md
     ├─ docs/regression-sentinels.md (basic template if missing)
     ├─ docs/stuck/<slug>.md   ← for each stuck/paused item
     └─ tickets/<feature-slug>.md ← one per feature (use the ticket template)

3. For each ticket:
   - Populate User Story (from description)
   - Add Acceptance Criteria, Out-of-Scope, Impact Map, and Test Plan as placeholders
   - Tag the current status (✅ completed, ⚙️ in-progress, ⏸️ paused, 🧩 stuck, 💡 backlog)
   - Link back to roadmap.md

4. Update (or create if missing) project-index.json entry with repo, branch, and review_profile = “wp-plugin” (unless otherwise stated).

5. Summarize what you wrote:
   - Project slug and where files were added
   - Number of tickets created per status
   - Any missing info you still need (e.g., repo URL, feature details, or confirmed apply method)

Use the Python one-shot write pattern for single-file additions in the memory repo.  
Show manifests and fenced code blocks for each file you’d create or update.

Do not start feature work yet — just build the planning docs and show the proposed memory structure.

---  
<PASTE THE PROJECT SUMMARY FROM OLD CHAT HERE>
