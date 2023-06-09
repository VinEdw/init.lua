vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>/", vim.cmd.noh)
vim.keymap.set("n", "<leader>tt", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>tm", ":tabnew | term<CR>")

vim.keymap.set("n", "f", "<Plug>Sneak_f")
vim.keymap.set("n", "F", "<Plug>Sneak_F")
vim.keymap.set("n", "t", "<Plug>Sneak_t")
vim.keymap.set("n", "T", "<Plug>Sneak_T")

vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "<leader>k", "\"_")
vim.keymap.set("v", "<leader>k", "\"_")
vim.keymap.set("n", "<leader>s", "\"*")
vim.keymap.set("v", "<leader>s", "\"*")
vim.keymap.set("n", "<leader>j", "\"*yy")

vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>O", "O<Esc>")

vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")

vim.keymap.set("i", "<A-h>", "<C-\\><C-N><C-w>h")
vim.keymap.set("i", "<A-j>", "<C-\\><C-N><C-w>j")
vim.keymap.set("i", "<A-k>", "<C-\\><C-N><C-w>k")
vim.keymap.set("i", "<A-l>", "<C-\\><C-N><C-w>l")

vim.keymap.set("t", "<A-h>", "<C-\\><C-N><C-w>h")
vim.keymap.set("t", "<A-j>", "<C-\\><C-N><C-w>j")
vim.keymap.set("t", "<A-k>", "<C-\\><C-N><C-w>k")
vim.keymap.set("t", "<A-l>", "<C-\\><C-N><C-w>l")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "jk", "<C-\\><C-n>")
vim.keymap.set("t", "gt", "<C-\\><C-n>gt")
vim.keymap.set("t", "gT", "<C-\\><C-n>gT")
vim.cmd(":tnoremap <expr> <C-R> '<C-\\><C-N>\"'.nr2char(getchar()).'pi'")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "tex",
	callback = function()
    vim.keymap.set("n", "<leader>xe", ":!xelatex %:t<CR>")
	end
})
