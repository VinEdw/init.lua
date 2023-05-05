vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>/", vim.cmd.noh)

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
vim.opt.shell = 'pwsh.exe'
vim.opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
vim.opt.shellxquote = ''
vim.opt.shellquote = ''
vim.opt.shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s'
