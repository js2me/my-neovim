return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        hidden = true,
        ignored = true,
      },
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
        },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    keys = {
      { "<leader>e", false },
      { "<leader>E", false },
      { "<leader>fe", false },
      { "<leader>fE", false },
    },
  },
}
