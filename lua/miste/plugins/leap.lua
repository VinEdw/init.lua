return {
  "ggandor/leap.nvim",
  config = function()
    local leap = require('leap')
    leap.opts.case_sensitive = true
    vim.keymap.set({'n', 'x'}, 's',  '<Plug>(leap-forward)')
    vim.keymap.set('o',        'z',  '<Plug>(leap-forward-till)')
    vim.keymap.set('n',        'S',  '<Plug>(leap-backward)')
    vim.keymap.set('o',        'Z',  '<Plug>(leap-backward-till)')
    vim.keymap.set('n',        'gs', '<Plug>(leap-from-window)')
  end
}
