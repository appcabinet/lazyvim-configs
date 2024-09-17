local lspconfig = require("lspconfig")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        solargraph = {},
        marksman = {},
        ruby_lsp = {
          -- cmd = { "bundle", "exec", "ruby-lsp" },
          -- init_options = {
          --   formatter = "auto",
          -- },
        },
        rubocop = {
          -- See: https://docs.rubocop.org/rubocop/usage/lsp.html
          cmd = { "bundle", "exec", "rubocop", "--lsp" },
          root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "ruby" })
      end
    end,
  },
}
