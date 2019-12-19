if has('gui_running')
  set guifont="Monospace 10"
endif

" show line numbers
set number

" set file types
autocmd BufNewFile,BufRead *.pkg set filetype=xml

" folding
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

" Set plantuml path for plantuml-previewer.vim
autocmd FileType plantuml let g:plantuml_previewer#plantuml_jar_path = get(
    \  matchlist(system('cat `which plantuml` | grep plantuml.jar'), '\v.*\s[''"]?(\S+plantuml\.jar).*'),
    \  1,
    \  0
    \)

" F4 saves the file and runs silent Dispatch
map <F4> <ESC>:w<CR>:Dispatch!<CR>

" colorcolumn
au FileType python,rst set colorcolumn=120
highlight ColorColumn ctermbg=236 guibg=gray21
autocmd FileType gitcommit set colorcolumn=50

" shortcut to toggle fold
map <F5> za

" disable auto-pairs
let g:AutoPairs = {}

" very magic persistent search
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap >s/ >smagic/
nnoremap :g/ :g/\v
nnoremap :g// :g//

" use CTRL+PageUp/PageDown to cycle through buffers
map <C-PageUp> :bp<CR>
map <C-PageDown> :bn<CR>

" use PageUp/PageDown to react like Ctrl-U/Ctrl-D
map <PageUp> <C-U>
map <PageDown> <C-D>

" EasyGrep options
let g:EasyGrepCommand="ag"

" Specify the behavior when switching between buffers
" This removes the additional newtab option from ultimate vimrc default
try
  set switchbuf=useopen,usetab
  set stal=2
catch
endtry
