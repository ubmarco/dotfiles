" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" set file types
autocmd BufNewFile,BufRead *.pkg set filetype=xml

let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

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
nnoremap <silent> <M-Up> :exe "resize +5"<CR>
nnoremap <silent> <M-Down> :exe "resize -5"<CR>
nnoremap <silent> <M-Right> :exe "vertical resize +5"<CR>
nnoremap <silent> <M-Left> :exe "vertical resize -5"<CR>

" ALE config
let g:ale_linters = {'python': ['flake8', 'pylint']}


" File type based dispatch
autocmd FileType rst let b:dispatch = 'cd docs && sphinx-build -W -b html . _build/html'

" Set plantuml path for plantuml-previewer.vim
autocmd FileType plantuml let g:plantuml_previewer#plantuml_jar_path = get(
    \  matchlist(system('cat `which plantuml` | grep plantuml.jar'), '\v.*\s[''"]?(\S+plantuml\.jar).*'),
    \  1,
    \  0
    \)

" colorcolumn
" au FileType python,rst set colorcolumn=120
" highlight ColorColumn ctermbg=236 guibg=gray21
" autocmd FileType gitcommit set colorcolumn=50

" shortcut to toggle fold
map <F5> za

" very magic persistent search
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap >s/ >smagic/
nnoremap :g/ :g/\v
nnoremap :g// :g//

" use CTRL+PageUp/PageDown to cycle through buffers
map <C-PageDown> :bn<CR>
imap <C-PageDown> <ESC>:bn<CR>
map <C-PageUP> :bp<CR>
imap <C-PageUp> <ESC>:bp<CR>

" use PageUp/PageDown to react like Ctrl-U/Ctrl-D
map <PageUp> <C-U>
map <PageDown> <C-D>

" Fix indentation problem for lists in RST files
" See here https://vi.stackexchange.com/q/16190
autocmd FileType rst set formatoptions+=n

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
