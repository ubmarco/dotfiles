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

" do not enable folding after file reading
set nofoldenable

" map Alt + arrow keys to resize the current window
nnoremap <silent> <M-Up> :exe "resize " . (winheight(0) * 5/4)<CR>
nnoremap <silent> <M-Down> :exe "resize " . (winheight(0) * 4/5)<CR>
nnoremap <silent> <M-Right> :exe "vertical resize " . (winwidth(0) * 5/4)<CR>
nnoremap <silent> <M-Left> :exe "vertical resize " . (winwidth(0) * 4/5)<CR>

