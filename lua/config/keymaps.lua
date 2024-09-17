-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

vim.keymap.set("n", "<leader>d", function()
  local current_buf = vim.api.nvim_get_current_buf()
  local alternative_buf = vim.fn.bufnr("#")

  if alternative_buf ~= -1 and vim.api.nvim_buf_is_valid(alternative_buf) then
    vim.api.nvim_set_current_buf(alternative_buf)
  else
    vim.cmd("enew")
  end

  vim.api.nvim_buf_delete(current_buf, { force = false })
end, { noremap = true, silent = true })

-- Bufdelete
-- vim.keymap.set("n", "<leader>d", ":Bdelete<CR>", { noremap = true, silent = true })
--
-- Delete word (Option+Backspace) when in insert mode
vim.keymap.set("i", "<M-BS>", "<C-w>", { noremap = true, desc = "Delete word (Option+Backspace)" })
