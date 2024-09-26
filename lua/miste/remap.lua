-- Leader key set to space
vim.g.mapleader = " "

-- Escape insert mode
vim.keymap.set("i", "jk", "<Esc>")
-- Turn off search highlighting
vim.keymap.set("n", "<leader>/", vim.cmd.noh)
-- Open an empty new tab
vim.keymap.set("n", "<leader>tt", vim.cmd.tabnew)
-- Open the terminal emulator in a new tab
vim.keymap.set("n", "<leader>tm", ":tabnew | term<CR>")
-- Open the buffer list and prepare to select one
vim.keymap.set("n", "<leader>b", ":buffers<CR>:b ")

-- Use vim-sneak's versions of f, F, t, & T
vim.keymap.set("n", "f", "<Plug>Sneak_f")
vim.keymap.set("n", "F", "<Plug>Sneak_F")
vim.keymap.set("n", "t", "<Plug>Sneak_t")
vim.keymap.set("n", "T", "<Plug>Sneak_T")

-- Make Y yank to the end of the line
vim.keymap.set("n", "Y", "y$")
-- Use the black hole register
vim.keymap.set("n", "<leader>k", "\"_")
vim.keymap.set("v", "<leader>k", "\"_")
-- Use the system clipboard register
vim.keymap.set("n", "<leader>s", "\"+")
vim.keymap.set("v", "<leader>s", "\"+")
-- Copy the current line to the system clipboard
vim.keymap.set("n", "<leader>j", "\"+yy")

-- Navigate splits/windows with Alt hjkl
-- Normal mode
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")
-- Insert mode
vim.keymap.set("i", "<A-h>", "<C-\\><C-N><C-w>h")
vim.keymap.set("i", "<A-j>", "<C-\\><C-N><C-w>j")
vim.keymap.set("i", "<A-k>", "<C-\\><C-N><C-w>k")
vim.keymap.set("i", "<A-l>", "<C-\\><C-N><C-w>l")
-- Terminal mode
vim.keymap.set("t", "<A-h>", "<C-\\><C-N><C-w>h")
vim.keymap.set("t", "<A-j>", "<C-\\><C-N><C-w>j")
vim.keymap.set("t", "<A-k>", "<C-\\><C-N><C-w>k")
vim.keymap.set("t", "<A-l>", "<C-\\><C-N><C-w>l")

-- Escape and switch tabs in terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "jk", "<C-\\><C-n>")
vim.keymap.set("t", "gt", "<C-\\><C-n>gt")
vim.keymap.set("t", "gT", "<C-\\><C-n>gT")
-- Use registers in the terminal with <C-R>
vim.cmd(":tnoremap <expr> <C-R> '<C-\\><C-N>\"'.nr2char(getchar()).'pi'")

-- Command to toggle between 2 space and 4 space indentation preferences
-- Note: Does not impact the current indentation of the file
vim.keymap.set("n", "<leader><>", function ()
  local old_val = vim.opt.tabstop:get()
  local new_val = 6 - old_val
  vim.opt.tabstop = new_val
  vim.opt.softtabstop = new_val
  vim.opt.shiftwidth = new_val
end)
