require("miste.set")
require("miste.remap")

require('onedark').setup {
  style = 'darker'
}
require('onedark').load()

vim.cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=150})
augroup END
]]
