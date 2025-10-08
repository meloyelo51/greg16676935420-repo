## Suggested project-index.json (keep your array style)
{
  "projects": [
    {
      "name": "WP AI CommerceHub",
      "repo": "meloyelo51/wp-ai-commercehub",
      "branch": "main",
      "paths": ["wp-content/plugins/wp-ai-commercehub"],
      "review_profile": "wp-plugin"
    }
  ]
}


## Optional: map style (if you ever prefer slugs as keys)
{
  "wp-ai-commercehub": {
    "repo_url": "git@github.com:meloyelo51/wp-ai-commercehub.git",
    "default_branch": "main",
    "paths": ["wp-content/plugins/wp-ai-commercehub"],
    "review_profile": "wp-plugin"
  }
}


## Either schema works as long as Greg knows which one you’re using. If he doesn’t find the slug in the index, he’ll ask a short import questionnaire (below) and propose an entry.
Guided project import / new project flow (what Greg will auto-ask)

When you say “import a project” or start a new one, he’ll prompt:

Project name/slug

Repo URL (or org/repo)

Default branch (default: main)

Local path (optional)

Primary code paths (e.g., wp-content/plugins/my-plugin)

Review profile (wp-plugin | wp-theme | generic)

Then he will:

Add/append to project-index.json

Create memory namespace:
projects/<slug>/docs/roadmap.md,
projects/<slug>/docs/regression-sentinels.md, and (if needed) tickets/<slug>-setup.md.


## Mid-feature new idea (no derail!)
When a new idea pops up mid-feature:

Say “capture idea: …” or “new ticket: …” or “backlog: …”.

Greg creates a Backlog ticket stub under the same project using the template, adds it to roadmap → Backlog, then returns to the current ticket.

This prevents scope creep and keeps the current feature stable.

Backlog ticket stub includes: Project, short user story, 2–3 acceptance criteria, out-of-scope line, initial impact map, and “Apply method: (inherited next session)”.