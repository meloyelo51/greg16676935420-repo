## Convert ideas to tickets” (from project roadmap)
# One-shot B — “Convert ideas to tickets” (from project roadmap)

# If/when you want to turn your project-repo roadmap items into real tickets, run this in the memory repo after you paste a copy of that doc to projects/order-sentinel/docs/project_roadmap.md. It will:

# parse headings/bullets,

# create ticket files (status BACKLOG) for items not already in _manifest.json,

# update tickets/_manifest.json.

python - <<'PY'
import re, json, hashlib
from pathlib import Path

ROOT = Path.cwd()
PROJ = ROOT / "projects" / "order-sentinel"
SRC  = PROJ / "docs" / "project_roadmap.md"   # paste your project roadmap here first
TIX  = PROJ / "tickets"
MAN  = PROJ / "tickets" / "_manifest.json"

if not SRC.exists():
    print(f"[skip] {SRC} not found — copy your project roadmap here first."); raise SystemExit(0)

j = json.loads(MAN.read_text(encoding="utf-8")) if MAN.exists() else {"tickets":[]}
have = set(j.get("tickets", []))

txt = SRC.read_text(encoding="utf-8", errors="ignore")
# grab bullet lines under headings; simple heuristic: lines that start with '-' and have text
bullets = [re.sub(r"^\s*-\s*", "", l).strip() for l in txt.splitlines() if re.match(r"^\s*-\s+\S", l)]
created = []

def slug(s:str)->str:
    s = re.sub(r"[^a-z0-9]+","-", s.lower()).strip("-")
    if not s: s = "item-" + hashlib.sha1(s.encode()).hexdigest()[:8]
    return s

for b in bullets:
    title = b.split("—",1)[0].strip()
    s = slug(title)[:64]
    fn = f"{s}.md"
    if fn in have: continue
    path = TIX / fn
    if path.exists(): continue
    # minimal ticket scaffold
    md = f"""# Feature: {title}

## Project
- slug: order-sentinel
- repo: https://github.com/meloyelo51/wp-ordersentinel
- default_branch: main

## User Story
As a user, I want {title.lower()} so that <value/impact>.

## Acceptance Criteria
- [ ] Define success criteria

## Implementation Notes
- Status: BACKLOG
- Source: project roadmap idea
"""
    path.write_text(md, encoding="utf-8")
    created.append(fn)

if created:
    j["tickets"].extend(created)
    (TIX / "_manifest.json").write_text(json.dumps(j, indent=2), encoding="utf-8")
    print("[add] tickets:", ", ".join(created))
else:
    print("[ok] no new tickets needed (all present)")

PY

git add -A
git commit -m "tickets: converted project roadmap ideas into BACKLOG tickets" || echo "(no changes to commit)"
