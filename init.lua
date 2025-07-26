-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.signcolumn = "yes"
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  callback = function()
    vim.lsp.start({
      name = "rubocop",
      cmd = { "bundle", "exec", "rubocop", "--lsp" },
    })
  end,
})

-- Example: mapping gx to followNextLink
vim.api.nvim_set_keymap("n", "gx", ":FollowNextLink<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "ga", ":FollowNextLink<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", ":FollowNextLink<CR>", { noremap = true, silent = true })
