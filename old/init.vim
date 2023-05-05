" leader
nnoremap <SPACE> <Nop>
let mapleader = " "

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction
" plugins
call plug#begin()
Plug 'tpope/vim-surround' " surround
Plug 'tpope/vim-repeat' " repeat
Plug 'justinmk/vim-sneak' " sneak
Plug 'wellle/targets.vim' " targets
Plug 'michaeljsmith/vim-indent-object' " indent object
Plug 'inkarkat/vim-ReplaceWithRegister' " replace with register
Plug 'airblade/vim-gitgutter', Cond(!exists('g:vscode')) " Git gutter
Plug 'tpope/vim-commentary', Cond(!exists('g:vscode')) " commentary
Plug 'vim-airline/vim-airline', Cond(!exists('g:vscode')) " airline
Plug 'navarasu/onedark.nvim', Cond(!exists('g:vscode')) " OneDark Theme
call plug#end()

if exists('g:vscode')
  " VSCode extension
  " Commentary
  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine

  " Open command palette
  nnoremap <leader>p <Cmd>call VSCodeNotify('workbench.action.showCommands')<CR>
  xnoremap <leader>p <Cmd>call VSCodeNotifyVisual('workbench.action.showCommands', 1)<CR>

  " Open file finder
  nnoremap <leader>f <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
  " Toggle file explorer
  nnoremap <leader>e <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
  " Toggle terminal
  nnoremap <leader>t <Cmd>call VSCodeNotify('workbench.action.togglePanel')<CR>
  " Open link
  nnoremap gx <Cmd>call VSCodeNotify('editor.action.openLink')<CR>

else
  " ordinary neovim

  " theme
  let g:onedark_config = {
        \ 'style': 'darker',
  \}
  colorscheme onedark

  " line numbers
  set number
  set relativenumber

  " indentation
  set expandtab
  set autoindent
  set shiftwidth=2
  set tabstop=2
  autocmd Filetype python setlocal shiftwidth=4 tabstop=4
  set breakindent

  " folding
  " set foldmethod=indent
  " set foldcolumn=4

  " remaps
  inoremap jk <Esc>
  nnoremap <leader>f :Explore<CR>

  " navigating splits
  nnoremap <A-h> <C-w>h
  nnoremap <A-j> <C-w>j
  nnoremap <A-k> <C-w>k
  nnoremap <A-l> <C-w>l
  inoremap <A-h> <C-\><C-N><C-w>h
  inoremap <A-j> <C-\><C-N><C-w>j
  inoremap <A-k> <C-\><C-N><C-w>k
  inoremap <A-l> <C-\><C-N><C-w>l

  " terminal
  tnoremap <A-h> <C-\><C-N><C-w>h
  tnoremap <A-j> <C-\><C-N><C-w>j
  tnoremap <A-k> <C-\><C-N><C-w>k
  tnoremap <A-l> <C-\><C-N><C-w>l
  tnoremap <Esc> <C-\><C-n>
  tnoremap jk <C-\><C-n>
  tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
  let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
  let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
  let &shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
  let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  set shellquote= shellxquote=

endif

" flash highlight on yank
augroup highlightYankedText
    autocmd!
    autocmd TextYankPost *  silent! lua require'vim.highlight'.on_yank()
augroup END

" remaps
nnoremap <leader>/ :noh<CR>
nnoremap Y y$

noremap <leader>k "_
noremap <leader>s "*
nnoremap <leader>j "*yy

nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

xmap <leader>h Stmark<CR>
xmap <leader>e S$

" smartcase
set ignorecase
set smartcase

" sneak's f and t
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" Clear registers
function! ClearRegisters()
  let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
  for r in regs
    call setreg(r, [])
  endfor
endfunction
