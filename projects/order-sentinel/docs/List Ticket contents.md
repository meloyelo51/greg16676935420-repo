## Export all tickets and contents
echo '# Exporting all tickets:'
for f in projects/order-sentinel/tickets/*.md; do
  echo -e "\n\n# ===== $(basename "$f") =====" >> all_tickets_export.md
  cat "$f" >> all_tickets_export.md
  echo >> all_tickets_export.md
  echo "Exported: $f"
done

##Ex