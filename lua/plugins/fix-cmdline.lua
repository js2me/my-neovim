return {
  -- LazyVim nvim-cmp extra (moved from lazy.lua to fix import order warning)
  { import = "lazyvim.plugins.extras.coding.nvim-cmp" },

  -- Disable blink.cmp (crashes nvim in insert mode)
  {
    "Saghen/blink.cmp",
    enabled = false,
  },

  -- Prioritize project imports (@/) over node_modules in nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      -- Comparator: items with "@/" go first, node_modules go last
      local function prioritize_project(entry1, entry2)
        local function score(entry)
          local item = entry:get_completion_item()
          local text = (item.label or "")
            .. (item.detail or "")
            .. (item.data and vim.inspect(item.data) or "")

          if text:find("@/") then
            return 0
          elseif text:find("node_modules") then
            return 2
          else
            return 1
          end
        end

        local s1, s2 = score(entry1), score(entry2)
        if s1 ~= s2 then
          return s1 < s2
        end
      end

      -- Insert our comparator first (highest priority)
      table.insert(opts.sorting.comparators, 1, prioritize_project)
    end,
  },
}
