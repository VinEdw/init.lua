return {
  url = "https://codeberg.org/andyg/leap.nvim",
  config = function()
    local leap = require('leap')
    leap.opts.vim_opts['go.ignorecase'] = false
    vim.keymap.set({'n', 'x'}, 's',  '<Plug>(leap)')
    vim.keymap.set('o',        'z',  '<Plug>(leap)')
  end
}
