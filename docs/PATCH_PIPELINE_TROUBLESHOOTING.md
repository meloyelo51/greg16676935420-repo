# Patch Pipeline Troubleshooting

Symptoms
- corrupt patch at line N → truncation or CRLF
- hunks failed → context mismatch

Save safely
- Use quoted here-doc with a unique terminator (avoid PATCH)
- Ensure a final newline

Normalize
    dos2unix changes.patch 2>/dev/null || sed -i 's/\r$//' changes.patch

Validate & apply
    git apply --check changes.patch
    git apply --index changes.patch || git apply --3way --index changes.patch
    git commit -m "Apply Greg patch"

VS Code
- Disable shell integration
- files.eol="\n"; insertFinalNewline=true

If terminal keeps mangling
- Use scripts/save-chat-patch.(sh|ps1)
- Or ask Greg for direct writes
