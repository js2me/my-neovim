-- bootstrap lazy.nvim, LazyVim and your plugins
vim.opt.swapfile = false

-- Insert mode: word movement
vim.keymap.set("i", "<C-Left>", "<C-O>b", { desc = "Word left" })
vim.keymap.set("i", "<C-Right>", "<C-O>w", { desc = "Word right" })

-- Duplicate line (VSCode-style Ctrl+D)
vim.keymap.set("n", "<C-D>", "yyp", { desc = "Duplicate line" })
vim.keymap.set("i", "<C-D>", "<C-O>yyp", { desc = "Duplicate line" })

require("config.lazy")
