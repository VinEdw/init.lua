return {
  "justinmk/vim-sneak",
  lazy = false,
  config = function()
    -- Use vim-sneak's versions of f, F, t, & T
    vim.keymap.set("n", "f", "<Plug>Sneak_f")
    vim.keymap.set("n", "F", "<Plug>Sneak_F")
    vim.keymap.set("n", "t", "<Plug>Sneak_t")
    vim.keymap.set("n", "T", "<Plug>Sneak_T")
    -- Set the coloring
    vim.cmd[[highlight Sneak guifg=black guibg=lightyellow ctermfg=black ctermbg=lightyellow]]
  end
}
