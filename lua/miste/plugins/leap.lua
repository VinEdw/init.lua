return {
  url = "https://codeberg.org/andyg/leap.nvim",
  config = function()
    local leap = require('leap')
    leap.opts.vim_opts['go.ignorecase'] = false
    vim.keymap.set('n',        's',  '<Plug>(leap-forward)')
    vim.keymap.set({'o', 'x'}, 'z',  '<Plug>(leap-forward-till)')
    vim.keymap.set('n',        'S',  '<Plug>(leap-backward)')
    vim.keymap.set({'o', 'x'}, 'Z',  '<Plug>(leap-backward-till)')
  end
}
