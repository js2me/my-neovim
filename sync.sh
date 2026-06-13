#!/bin/bash
cd ~/projects/open-source/my-neovim || exit 1
rsync -av --exclude='.git' --exclude='.neoconf.json' ~/.config/nvim/ ~/projects/open-source/my-neovim/ 2>/dev/null
git add -A
git diff --cached --quiet || git commit -m "auto-sync nvim config $(date +%Y-%m-%d)"
git push
