return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "ruby",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {},
        ruby_ls = {},

        rubocop = {
          cmd = { "bundle", "exec", "rubocop", "--lsp" },
          root_dir = require("lspconfig").util.root_pattern("Gemfile", ".git"),
        },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "olimorris/neotest-rspec",
    },
    opts = {
      adapters = {
        ["neotest-rspec"] = {
          -- Configure neotest-rspec here
        },
      },
    },
  },
}
