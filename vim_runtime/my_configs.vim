if has('gui_running')
  set guifont="Monospace 10"
endif

" show line numbers
set number

" folding
let g:xml_syntax_folding=1
au FileType xsd setlocal foldmethod=syntax
au FileType xml setlocal foldmethod=syntax
au FileType arxml setlocal foldmethod=syntax
au FileType json setlocal foldmethod=syntax

" do not enable folding after file reading
set nofoldenable

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

