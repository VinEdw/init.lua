-- Disable mouse
-- vim.opt.mouse = ""

-- Set relative line numbers, with the current absolute line shown
vim.opt.nu = true
vim.opt.relativenumber = true
vim.g.netrw_bufsettings = "noma nomod nu rnu nowrap ro nobl"

-- Set 2 space indentation by default
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Use smart indentation when starting a new line
vim.opt.smartindent = true

-- Ignore case for searches in all lowercase, but consider case when uppercase is used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Set line wrapping
vim.opt.breakindent = true
vim.opt.breakindentopt = {'shift:2', 'min:40', 'sbr'}
vim.opt.showbreak = ">>"
vim.opt.linebreak = true

-- If the OS is Windows, then set Powershell for the terminal emulator
if (vim.loop.os_uname().sysname:find 'Windows' and true or false) then
  vim.opt.shell = 'pwsh.exe'
  vim.opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
  vim.opt.shellxquote = ''
  vim.opt.shellquote = ''
  vim.opt.shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
  vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s'
end

-- Set 4 space indentation for Python files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "py",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
  end
})

-- Turn on spell checking
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- Turn off spell checking for the terminal emulator
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.opt_local.spell = false
  end
})

-- Keep the sign column on
vim.opt.signcolumn = "yes"

-- Flash a highlight on yank
vim.cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=150})
augroup END
]]
