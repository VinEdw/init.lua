vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.breakindent = true
vim.opt.breakindentopt = {'shift:2', 'min:40', 'sbr'}
vim.opt.showbreak = ">>"

vim.opt.shell = 'pwsh.exe'
vim.opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
vim.opt.shellxquote = ''
vim.opt.shellquote = ''
vim.opt.shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s'

vim.api.nvim_create_autocmd("FileType", {
	pattern = "py",
	callback = function()
		vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
		vim.opt_local.shiftwidth = 4
	end
})

vim.opt.spelllang = "en_us"
vim.opt.spell = true

vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
    vim.opt_local.spell = false
	end
})
