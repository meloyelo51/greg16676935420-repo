## Rebuild the memory-repo roadmap from tickets
# One-shot A — Rebuild the memory-repo roadmap from tickets

# Run this in the memory repo root (the one with projects/order-sentinel/...). It parses tickets/_manifest.json, reads each ticket’s - Status:, then rewrites projects/order-sentinel/docs/roadmap.md sections to match.

python - <<'PY'
import re, json
from pathlib import Path

ROOT = Path.cwd()
PROJ = ROOT / "projects" / "order-sentinel"
DOC = PROJ / "docs" / "roadmap.md"
MAN = PROJ / "tickets" / "_manifest.json"
TIX = PROJ / "tickets"

def load_manifest():
    j = json.loads(MAN.read_text(encoding="utf-8"))
    files = j.get("tickets", [])
    return [TIX / f for f in files if (TIX / f).exists()]

def status_of(md: str) -> str:
    # grab "- Status: X" (case-insensitive), fall back to buckets by keyword
    m = re.search(r"(?im)^\s*-\s*Status:\s*([A-Z \-]+)", md)
    s = (m.group(1).strip().upper() if m else "")
    if not s:
        # infer from headings
        if re.search(r"(?im)\bStatus:\s*COMPLETE\b", md): s="COMPLETE"
    return s or "BACKLOG"

def line_for_ticket(path: Path, md: str) -> tuple[str,str]:
    name = path.name
    first = md.splitlines()[0].strip()
    # human title from first line like "# Feature: abuseipdb-reporter"
    title = re.sub(r"^#+\s*", "", first)
    short = title or name.replace(".md","").replace("-"," ")
    # link style line used in memory roadmap
    ref = str(path.relative_to(ROOT)).replace("\\","/")
    s = status_of(md)
    return s, f"- [x] {ref} — {short} (COMPLETE)\n" if s=="COMPLETE" else f"- [ ] {ref} — {short} ({s})\n"

files = load_manifest()
buckets = {"ACTIVE":[],"COMPLETE":[],"STUCK":[],"PAUSED":[],"BACKLOG":[]}
for p in files:
    md = p.read_text(encoding="utf-8", errors="ignore")
    s, ln = line_for_ticket(p, md)
    if "PROGRESS" in s: buckets["ACTIVE"].append(ln)
    elif "COMPLETE" in s: buckets["COMPLETE"].append(ln)
    elif "STUCK" in s or "BROKEN" in s: buckets["STUCK"].append(ln)
    elif "PAUSED" in s or "REMOVED" in s: buckets["PAUSED"].append(ln)
    else: buckets["BACKLOG"].append(ln)

# Preserve the top “Project” section if present; replace the list sections below.
orig = DOC.read_text(encoding="utf-8", errors="ignore")
head_split = re.split(r"(?im)^\s*##\s*(Active|Done|Stuck|Paused|Backlog)\b", orig, maxsplit=1)
header = orig if len(head_split)==1 else head_split[0].rstrip() + "\n\n"

def sec(title, lines):
    if not lines: return f"## {title}\n(none)\n\n"
    return f"## {title}\n" + "".join(lines) + "\n"

new = header
new += sec("Active",  buckets["ACTIVE"])
new += sec("Done",    buckets["COMPLETE"])
new += sec("Stuck / Broken", buckets["STUCK"])
new += sec("Paused / Removed", buckets["PAUSED"])
new += sec("Backlog / Ideas", buckets["BACKLOG"])

DOC.write_text(new, encoding="utf-8")
print(f"[write] {DOC} — rebuilt from tickets/_manifest.json")
PY

git add -A
git commit -m "roadmap(memory): auto-rebuilt from ticket statuses" || echo "(no changes to commit)"
