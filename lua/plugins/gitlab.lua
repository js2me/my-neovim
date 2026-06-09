return {
  {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "sindrets/diffview.nvim",
      "stevearc/dressing.nvim",
    },
    build = function()
      require("gitlab.server").build()
    end,
    config = function()
      require("gitlab").setup({})
    end,
  },
}
