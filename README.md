# My Neovim Config

Based on [LazyVim](https://github.com/LazyVim/LazyVim).

## Установка на другой компьютер (Ubuntu)

### 1. Установить системные зависимости

```bash
sudo apt update
sudo apt install -y git curl ripgrep fd-find fzf build-essential
```

### 2. Установить Node.js (нужен для LSP-серверов: typescript, tailwindcss, html, css, json)

```bash
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs
```

### 3. Установить Neovim >= 0.10

Ubuntu даёт устаревший neovim 0.9.x — LazyVim требует 0.10+. Ставим через PPA:

```bash
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt update
sudo apt install -y neovim
```

Проверить: `nvim --version` должен показать 0.10+.

### 4. Клонировать конфиг

```bash
# Бэкап текущего конфига (если есть)
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
mv ~/.local/share/nvim ~/.local/share/nvim.bak 2>/dev/null
mv ~/.local/state/nvim ~/.local/state/nvim.bak 2>/dev/null
mv ~/.cache/nvim ~/.cache/nvim.bak 2>/dev/null

# Клонирование
git clone git@github.com:js2me/my-neovim.git ~/.config/nvim
```

### 5. Первый запуск

```bash
nvim
```

LazyVim автоматически:
- Установит `lazy.nvim` (менеджер плагинов)
- Установит все плагины из `lazy-lock.json` (фиксированные версии)
- Скачает treesitter-парсеры (tsx, typescript, javascript, html, css и др.)
- Mason установит LSP-серверы: `typescript-language-server`, `tailwindcss-language-server`, `json-lsp`, `html-lsp`, `css-lsp`

Дождись окончания всех установок (статус внизу экрана). Перезапусти nvim после завершения.

## Автосинхронизация

Скрипт `sync.sh` копирует `~/.config/nvim/` обратно в репозиторий, коммитит и пушит изменения.

Настроен systemd timer (раз в неделю, воскресенье 20:00), который догоняет пропущенные запуски (`Persistent=true`):

```bash
mkdir -p ~/.config/systemd/user/
cp ~/.config/nvim/sync.service ~/.config/systemd/user/nvim-sync.service
cp ~/.config/nvim/sync.timer ~/.config/systemd/user/nvim-sync.timer
systemctl --user daemon-reload
systemctl --user enable --now nvim-sync.timer

# Проверить статус
systemctl --user list-timers nvim-sync.timer
```
