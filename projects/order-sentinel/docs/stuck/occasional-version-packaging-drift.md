# Stuck: occasional-version-packaging-drift — order-sentinel

## Current Blocker
Occasional mismatch between header/class version and ZIP; sometimes bad filenames (slashes).

## Smallest Next Slice
Single Python packer script: bump header + class const together, normalize filenames, exclude MU/backup/hidden.

## Options
- Python-only bump + pack (preferred) — deterministic on Windows/MINGW
- zip CLI / PowerShell — avoid due to path/encoding quirks

## Revert Plan
Rebuild from prior tag with the Python packer; verify dist contents before release.

## Ask / Decision Needed
Confirm canonical packer path and invocation; commit to avoiding zip CLI.
