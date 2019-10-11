if has('gui_running')
  set guifont="Monospace 10"
endif

" show line numbers
set number

" folding
au FileType xsd setlocal foldmethod=syntax
au FileType xml setlocal foldmethod=syntax
au FileType arxml setlocal foldmethod=syntax
au FileType json setlocal foldmethod=syntax

" do not enable folding after file reading
set nofoldenable

nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 0
let g:fastfold_fold_command_suffixes = []
" let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
" let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

" map Alt + arrow keys to resize the current window
nnoremap <silent> <M-Up> :exe "resize " . (winheight(0) * 5/4)<CR>
nnoremap <silent> <M-Down> :exe "resize " . (winheight(0) * 4/5)<CR>
nnoremap <silent> <M-Right> :exe "vertical resize " . (winwidth(0) * 5/4)<CR>
nnoremap <silent> <M-Left> :exe "vertical resize " . (winwidth(0) * 4/5)<CR>

" remove S from short message default filnxtToOS to display search count
set shortmess=filnxtToO

" highlight trailing whitespaces in red
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" ALE config
let g:ale_linters = {'python': ['flake8', 'pylint']}

" let Ack.vim use the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" File type based dispatch
autocmd FileType rst let b:dispatch = 'cd docs && sphinx-build -W -b html . _build/html'

" F4 saves the file and runs silent Dispatch
map <F4> <ESC>:w<CR>:Dispatch!<CR>

" colorcolumn
set colorcolumn=120
highlight ColorColumn ctermbg=236 guibg=gray21
autocmd FileType gitcommit set colorcolumn=50

