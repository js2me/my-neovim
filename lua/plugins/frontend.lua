-- TypeScript + React frontend development
return {
  -- LazyVim TypeScript extra: ts_ls LSP, treesitter, mason, typescript.nvim
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- Tailwind CSS intellisense
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {},
      },
    },
  },

  -- Tailwind color previews in editor
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },

  -- JSX/TSX auto-close and rename matching tags
  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },

  -- Treesitter parsers for frontend
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
        "javascript",
        "jsx",
        "html",
        "css",
        "scss",
        "json",
        "jsonc",
        "graphql",
        "markdown",
        "markdown_inline",
        "yaml",
      })
    end,
  },

  -- Mason: auto-install frontend LSPs and tools
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "tailwindcss-language-server",
        "json-lsp",
        "html-lsp",
        "css-lsp",
      },
    },
  },

  -- oxlint via conform/lint
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        javascript = { "oxlint" },
        javascriptreact = { "oxlint" },
        typescript = { "oxlint" },
        typescriptreact = { "oxlint" },
      },
    },
  },

  -- JSON extra with schemastore
  { import = "lazyvim.plugins.extras.lang.json" },

  -- Disable GitHub PR keymap (using GitLab, not GitHub)
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>gP", false },
    },
  },

  -- Fix E464: :G is ambiguous (GrugFar + GrugFarWithin) and crashes nvim
  -- Disable GrugFar since we don't use it for search/replace
  {
    "MagicDuck/grug-far.nvim",
    enabled = false,
  },

  -- Git branch checkout under <leader>g
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    },
    opts = {
      picker = {
        exclude = {
          "node_modules",
          ".git",
          "dist",
          ".next",
          ".nuxt",
          "build",
          ".cache",
        },
      },
    },
  },
}
