-- Smart explorer: close if focused on explorer, otherwise focus/open it
vim.keymap.set("n", "<leader>e", function()
  local explorer = Snacks.picker.get({ source = "explorer" })[1]
  if explorer and not explorer.closed then
    if vim.bo.filetype == "snacks_picker_list" then
      explorer:close()
    else
      explorer:focus()
    end
  else
    Snacks.explorer({ cwd = LazyVim.root() })
  end
end, { desc = "Explorer Snacks (root dir)" })

vim.keymap.set("n", "<leader>E", function()
  local explorer = Snacks.picker.get({ source = "explorer" })[1]
  if explorer and not explorer.closed then
    if vim.bo.filetype == "snacks_picker_list" then
      explorer:close()
    else
      explorer:focus()
    end
  else
    Snacks.explorer()
  end
end, { desc = "Explorer Snacks (cwd)" })
