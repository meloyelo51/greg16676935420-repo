## memory-repo structure checklist

meloyelo51/greg16676935420-repo/
├─ project-index.json
├─ projects/
│  ├─ wp-ai-commercehub/
│  │  ├─ docs/
│  │  │  ├─ roadmap.md
│  │  │  ├─ regression-sentinels.md
│  │  │  └─ stuck/
│  │  │     └─ feature-ai-pricing.md          # example stuck note
│  │  ├─ tickets/
│  │  │  ├─ feature-plugin-bootstrap.md       # ✅ completed
│  │  │  ├─ feature-product-sync.md           # ⚙️ in progress
│  │  │  ├─ feature-ai-pricing.md             # 🧩 stuck
│  │  │  └─ feature-bulk-import.md            # 💡 backlog
│  │  └─ CHANGELOG.d/                         # optional planning mirror (release truth lives in project repo)
│  │     └─ 2025-10-hello-placeholder.md
│  └─ another-project/                         # (if you add more projects)
│     ├─ docs/
│     │  ├─ roadmap.md
│     │  ├─ regression-sentinels.md
│     │  └─ stuck/
│     └─ tickets/
└─ README.md (optional: explain hybrid model & prompts)

## quick verification checklist
project-index.json contains your project with repo (or repo_url) and default branch (main).

Each project has its own projects/<slug>/docs/roadmap.md.

One file per feature in projects/<slug>/tickets/… (no giant catch-all tickets).

Any blocked/paused items have a projects/<slug>/docs/stuck/<feature>.md.

projects/<slug>/docs/regression-sentinels.md exists (even if minimal).

(Optional) projects/<slug>/CHANGELOG.d/ for planning notes; actual release changelog lives in the project repo.