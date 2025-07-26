return {
  -- Disable LazyVim's default formatting on save
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = false,
    },
  },

  -- Configure null-ls for ESLint and Prettier
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          -- ESLint for diagnostics and code actions
          nls.builtins.diagnostics.eslint_d,
          nls.builtins.code_actions.eslint_d,
          -- Use ESLint's built-in formatting instead of Prettier to avoid conflicts
          nls.builtins.formatting.eslint_d,
        },
        -- Run formatting on save
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end,
      }
    end,
  },
}

