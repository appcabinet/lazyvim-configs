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

vim.keymap.set("n", "<S-D>", function()
  -- Save the current cursor position
  local cursor_pos = vim.fn.getpos(".")

  -- Delete the entire buffer content without yanking
  vim.cmd("silent %d _")

  -- Restore the cursor position
  vim.fn.setpos(".", cursor_pos)
end, { desc = "Delete entire page without copying to clipboard" })

-- Delete word (Option+Backspace) when in insert mode
vim.keymap.set("i", "<M-BS>", "<C-w>", { noremap = true, desc = "Delete word (Option+Backspace)" })

-- Clear all mappings for 's' and reset to default behavior
vim.cmd("unmap s")
vim.cmd("unmap S")
vim.api.nvim_set_keymap("n", "s", "s", { noremap = true })
vim.api.nvim_set_keymap("n", "S", "S", { noremap = true })

-- Select all text in the current buffer
vim.keymap.set("n", "<leader>sa", "ggVG", { desc = "Select all text in buffer" })
