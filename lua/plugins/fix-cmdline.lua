return {
  -- Disable blink cmdline completion (causes nvim crash when typing in cmdline)
  {
    "Saghen/blink.cmp",
    opts = {
      cmdline = {
        enabled = false,
      },
    },
  },
}
