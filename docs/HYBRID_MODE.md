# Hybrid Mode (Multi-Project Index)

Greg supports both **single-repo** and **hybrid index** modes.

## Single-repo
- Each project has its own repo; Greg targets that repo directly.
- Easiest patch pipeline; docs live beside code.

## Hybrid index repo
- Keep a coordination repo (e.g., `greg-hub`) with:
  - `/projects/<slug>/context.md` per project
  - `/projects/index.yml` mapping repo → default branch
  - shared helpers/docs
- Benefits: one place to start chats, shared standards.
- Trade-offs: one extra hop; keep project repos in sync.

## Recommended workflow
1. Index repo holds authoritative context and helpers.
2. Each project repo has a minimal `.ai/assistant-context.md` pointing back to index.
3. Always deliver patches **against the project repo**.
4. Use Base64 + reassembler for binaries in the project repo.

## Migration path
- Start single-repo.
- Introduce an index later; copy helpers/docs; add `projects/index.yml`.
