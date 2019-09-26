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

" assign Alt modifier plus navigation key to terminal output
" map Alt + hjkl to resize the current window
" exec "set <M-h>=\eh"
" exec "set <M-j>=\ej"
" exec "set <M-k>=\ek"
" exec "set <M-l>=\el" asdf  asdf
" set -s escape-time 0
nnoremap <silent> <Esc>k :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Esc>j :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Esc>l :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Esc>h :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

