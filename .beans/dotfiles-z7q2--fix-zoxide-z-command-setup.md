---
# dotfiles-z7q2
title: Fix zoxide z command setup
status: in-progress
type: bug
priority: normal
created_at: 2026-11-11T12:00:00Z
updated_at: 2026-11-11T12:00:00Z
---

The `z` command was missing on a machine where bootstrap.sh had not been run, and the
lazy-loaded zoxide wrapper meant directories were never recorded until `z` was first
called, so fresh setups had an empty database.

## Checklist

- [x] Initialise zoxide eagerly so the cd hook records directories from the first prompt
- [x] Point dot/batcave aliases at ~/Projects/dotfiles
- [ ] bootstrap.sh: exclude repo-only files from rsync
- [ ] bootstrap.sh: back up an existing non-symlink ~/.zshrc before linking
