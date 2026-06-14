return {
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = "ClaudeCode",
    keys = {
      { "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
    },
    config = function()
      require("claude-code").setup({
        window = {
          position = "right",
          size = 50,
        },
        command = "claude",
        auto_insert = true,
      })
    end,
  },
}
