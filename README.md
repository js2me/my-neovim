# My Neovim Config

LazyVim-based config for React/TypeScript frontend development with GitLab integration.

## Features

- TypeScript + Tailwind CSS LSP (autocompletion, go-to-definition, hover)
- JSX/TSX auto-close tags
- Git inline blame
- GitLab merge requests (via gitlab.nvim)
- Oxlint linter
- Transparent theme (tokyonight)
- Snacks picker for git branches (`<leader>gb`)
- nvim-cmp with project import prioritization (`@/` first, `node_modules` last)

## Install on a new machine

### Prerequisites

```bash
# Neovim >= 0.11
curl -sL https://github.com/neovim/neovim/releases/download/v0.11.3/nvim-linux-x86_64.tar.gz | tar xz -C ~/.local --strip-components=1

# Go >= 1.25 (for gitlab.nvim)
curl -sL https://go.dev/dl/go1.26.4.linux-amd64.tar.gz | tar -C ~/.local -xzf -

# Node.js + npm (for Mason LSP servers)
# Install via nvm/fnm/brew
```

### Setup

```bash
# 1. Clone this repo
git clone <repo-url> ~/.config/nvim

# 2. Start nvim — plugins will auto-install on first launch
nvim

# 3. (Optional) Set GitLab token for gitlab.nvim
echo 'export GITLAB_TOKEN="your-token"' >> ~/.zshrc
# For self-hosted GitLab also:
# echo 'export GITLAB_URL="https://gitlab.your-company.com"' >> ~/.zshrc
```

## Keymaps

| Key | Action |
|-----|--------|
| `<leader>gb` | Git branches (checkout/create) |
| `<leader>ft` | Open terminal |
| `<leader>ot` | Floating terminal |
| `gd` | Go to definition |
| `gr` | Find references |
| `<C-o>` / `<C-i>` | Navigate back / forward |
| `<leader>ui` | Inspect under cursor |

## Plugin files

| File | Purpose |
|------|---------|
| `lua/plugins/frontend.lua` | TypeScript, Tailwind, oxlint, treesitter parsers |
| `lua/plugins/fix-cmdline.lua` | Disable blink.cmp, nvim-cmp with project import priority |
| `lua/plugins/gitsigns.lua` | Inline git blame |
| `lua/plugins/gitlab.lua` | GitLab MR integration |
| `lua/plugins/snacks.lua` | Snacks explorer (show hidden files) |
| `lua/plugins/theme.lua` | TokyoNight transparent theme |
