-- Use the other files in this directory
require("miste.set")
require("miste.remap")

-- Use the onedark darker theme
require('onedark').setup {
  style = 'darker'
}
require('onedark').load()

-- Flash a highlight on yank
vim.cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=150})
augroup END
]]
