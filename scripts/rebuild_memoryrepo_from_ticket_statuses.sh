## Perfect—here’s a single one-shot that (1) auto-rebuilds the memory-repo roadmap from ticket statuses
## adds a small “sync policy” note at the top, and (2) regenerates the all_tickets_export.md
## (both in the project folder and a convenience copy at repo root). It’s idempotent and only touches the memory repo.

## Run this from the memory repo root (where projects/order-sentinel/... lives):
python - <<'PY'
import re, json, datetime
from pathlib import Path

ROOT = Path.cwd()
PROJ = ROOT / "projects" / "order-sentinel"
DOCS = PROJ / "docs"
TIXD = PROJ / "tickets"
ROADMAP = DOCS / "roadmap.md"
MANIFEST = TIXD / "_manifest.json"

now = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

def load_manifest():
    if MANIFEST.exists():
        try:
            j = json.loads(MANIFEST.read_text(encoding="utf-8"))
            items = j.get("tickets", [])
            return [TIXD / f for f in items if (TIXD / f).exists()]
        except Exception:
            pass
    # fallback: all *.md
    return sorted(TIXD.glob("*.md"))

def status_of(md: str) -> str:
    m = re.search(r"(?im)^\s*-\s*Status:\s*([A-Z \-]+)", md)
    s = (m.group(1).strip().upper() if m else "")
    if not s:
        # infer if body mentions "COMPLETE"
        if re.search(r"(?im)\bCOMPLETE\b", md):
            s = "COMPLETE"
    return s or "BACKLOG"

def first_heading(md: str) -> str:
    for ln in md.splitlines():
        if ln.strip().startswith("#"):
            return re.sub(r"^#+\s*", "", ln.strip())
    return ""

def roadmap_line(path: Path, md: str) -> tuple[str,str]:
    s = status_of(md)
    title = first_heading(md) or path.name.replace(".md","").replace("-", " ")
    ref = str(path.relative_to(ROOT)).replace("\\","/")
    # Memory roadmap wants checklist style with a trailing status
    checked = "[x]" if s=="COMPLETE" else "[ ]"
    trailer = {
        "IN PROGRESS":"(IN PROGRESS)",
        "COMPLETE":"(COMPLETE)",
        "STUCK":"(STUCK)",
        "BROKEN":"(BROKEN)",
        "PAUSED":"(PAUSED)",
        "REMOVED":"(REMOVED)",
        "BACKLOG":"(BACKLOG)",
    }.get(s, f"({s})")
    return s, f"- {checked} {ref} — {title} {trailer}\n"

def rebuild_roadmap():
    files = load_manifest()
    buckets = {"ACTIVE":[], "COMPLETE":[], "STUCK":[], "PAUSED":[], "BACKLOG":[]}
    for p in files:
        md = p.read_text(encoding="utf-8", errors="ignore")
        s, line = roadmap_line(p, md)
        if "PROGRESS" in s:
            buckets["ACTIVE"].append(line)
        elif "COMPLETE" in s:
            buckets["COMPLETE"].append(line)
        elif "STUCK" in s or "BROKEN" in s:
            buckets["STUCK"].append(line)
        elif "PAUSED" in s or "REMOVED" in s:
            buckets["PAUSED"].append(line)
        else:
            buckets["BACKLOG"].append(line)

    sync_note = (
        f"<!-- SYNC NOTE: This roadmap is generated from tickets/_manifest.json and ticket Status lines. -->\n"
        f"<!-- Source of truth = tickets/*.md. Last sync: {now}. Do not hand-edit sections below. -->\n"
    )

    if ROADMAP.exists():
        header = ROADMAP.read_text(encoding="utf-8", errors="ignore")
        # Keep everything above the first known section header; replace lists after.
        cut = re.split(r"(?im)^\s*##\s*(Active|Done|Stuck|Paused|Backlog)\b", header, maxsplit=1)
        head = cut[0].rstrip() if len(cut) > 1 else header.rstrip()
        # Ensure sync note once
        if "SYNC NOTE" not in head:
            head = head.rstrip() + "\n\n" + sync_note
        else:
            head = re.sub(r"(?s)<!-- SYNC NOTE:.*?-->\s*", sync_note + "\n", head, count=1)
    else:
        DOCS.mkdir(parents=True, exist_ok=True)
        head = f"# Roadmap — order-sentinel\n\n{sync_note}\n"

    def sec(title, lines):
        if not lines: return f"## {title}\n(none)\n\n"
        return f"## {title}\n" + "".join(lines) + "\n"

    # Build normalized sections
    body = ""
    body += sec("Active", buckets["ACTIVE"])
    body += sec("Done", buckets["COMPLETE"])
    body += sec("Stuck / Broken", buckets["STUCK"])
    body += sec("Paused / Removed", buckets["PAUSED"])
    body += sec("Backlog / Ideas", buckets["BACKLOG"])

    ROADMAP.write_text(head.rstrip() + "\n\n" + body, encoding="utf-8")
    print(f"[write] {ROADMAP} — rebuilt from tickets")

def export_all_tickets():
    files = load_manifest()
    stamp = now

    # Primary export in project folder
    proj_out = PROJ / "all_tickets_export.md"
    proj_out.parent.mkdir(parents=True, exist_ok=True)
    with proj_out.open("w", encoding="utf-8", newline="\n") as out:
        out.write("# OrderSentinel — Tickets Export\n")
        out.write(f"_Generated: {stamp}_\n\n")
        for f in files:
            out.write(f"\n\n# ===== {f.name} =====\n")
            out.write(f.read_text(encoding='utf-8', errors='ignore'))
            out.write("\n")
    print(f"[write] {proj_out}")

    # Convenience copy at repo root
    root_out = ROOT / "all_tickets_export.md"
    root_out.write_text(proj_out.read_text(encoding="utf-8"), encoding="utf-8")
    print(f"[write] {root_out}")

rebuild_roadmap()
export_all_tickets()
print("[done] roadmap synced + tickets exported")
PY

git add -A
git commit -m "chore(memory): sync roadmap from tickets + regenerate all_tickets_export.md" || echo "(no changes to commit)"
