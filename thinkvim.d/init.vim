""""""""""""""""""""""""""""""
" => Global settings
""""""""""""""""""""""""""""""
" Scroll if only 7 lines are left to the top/bottom - when moving vertically using j/k
set so=7

" maximum memory for pattern matching (2MB)
" the default (1000) showed problems with riv.vim for RST files
set maxmempattern=4000

" colorcolumn
autocmd FileType python,rst,vim set colorcolumn=120
autocmd FileType gitcommit set colorcolumn=50
autocmd ColorScheme PaperColor highlight ColorColumn ctermbg=236 guibg=gray15

""""""""""""""""""""""""""""""
" => File types
""""""""""""""""""""""""""""""
" set file types
autocmd BufNewFile,BufRead *.pkg set filetype=xml
autocmd BufNewFile,BufRead *.dvgroovy set filetype=groovy
autocmd FileType vue set expandtab

" Fix indentation problem for lists in RST files
" See here https://vi.stackexchange.com/q/16190
autocmd FileType rst set formatoptions+=n

" File type based dispatch
autocmd FileType rst let b:dispatch = 'cd docs && sphinx-build -W -b html . _build/html'

" Set plantuml path for plantuml-previewer.vim
autocmd FileType plantuml let g:plantuml_previewer#plantuml_jar_path = get(
    \  matchlist(system('cat `which plantuml` | grep plantuml.jar'), '\v.*\s[''"]?(\S+plantuml\.jar).*'),
    \  1,
    \  0
    \)

""""""""""""""""""""""""""""""
" => Folding
""""""""""""""""""""""""""""""
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
au FileType json setlocal foldmethod=syntax

" do not enable folding after file reading
set nofoldenable

nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 0
let g:fastfold_fold_command_suffixes = []
" let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
" let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

""""""""""""""""""""""""""""""
" => keymaps
""""""""""""""""""""""""""""""
" map Alt + arrow keys to resize the current window
nnoremap <silent> <M-Up> :exe "resize +5"<CR>
nnoremap <silent> <M-Down> :exe "resize -5"<CR>
nnoremap <silent> <M-Right> :exe "vertical resize +5"<CR>
nnoremap <silent> <M-Left> :exe "vertical resize -5"<CR>

" use CTRL+PageUp/PageDown to cycle through buffers
map <C-PageDown> :bn<CR>
imap <C-PageDown> <ESC>:bn<CR>
map <C-PageUP> :bp<CR>
imap <C-PageUp> <ESC>:bp<CR>

" use PageUp/PageDown to react like Ctrl-U/Ctrl-D
map <PageUp> <C-U>
map <PageDown> <C-D>

" very magic persistent search
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap >s/ >smagic/
nnoremap :g/ :g/\v
nnoremap :g// :g//

" show available key maps for buffer
nmap <LocalLeader>h :map <buffer><CR>

" <leader>cff formats the whole file instead of the selection which is
" <leader>cf in thinkvim and which does not work with black
""
vmap <Leader>cff  :Format<CR>
nmap <Leader>cff  :Format<CR>

" auto-save if vim window loses focus
autocmd FocusLost * silent! wa

" Exit enter mode in terminal
:tnoremap <Esc> <C-\><C-n>

" defx set global current working directory
autocmd FileType defx nmap <buffer><expr> W     defx#do_action('change_vim_cwd')

""""""""""""""""""""""""""""""
" => Visual mode in-buffer searching
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:footer = [
    \ '               _._',
    \ '           __.{,_.).__',
    \ '        .-"           "-.',
    \ '      .''  __.........__  ''.',
    \ '     /.-''`___.......___`''-.\',
    \ '    /_.-''` /   \ /   \ `''-._\',
    \ '    |     |   ''/ \''   |     |',
    \ '    |      ''-''     ''-''      |',
    \ '    ;                       ;',
    \ '    _\         ___         /_',
    \ '   /  ''.''-.__  ___  __.-''.''  \',
    \ ' _/_    `''-..._____...-''`    _\_',
    \ '/   \           .           /   \',
    \ '\____)         .           (____/',
    \ '    \___________.___________/',
    \ '      \___________________/',
    \ '     (_____________________)',
    \ '  "I''m not fat, I''m big boned!"',
    \ ]
let s:header = [
    \ '        [ team useblocks ]',
    \ ]

let g:dashboard_custom_header = s:header
let g:dashboard_custom_footer = s:footer

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimsepctor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Below mappings might be reactivated once Vimspector works without issues
nmap <F3>     <Plug>VimspectorStop
nmap <F4>     <Plug>VimspectorRestart
nmap <F5>     <Plug>VimspectorToggleBreakpoint
nmap <F6>     <Plug>VimspectorAddFunctionBreakpoint
nmap <F6>     <Plug>VimspectorPause
nmap <F7>     <Plug>VimspectorStepInto
nmap <F8>     <Plug>VimspectorStepOver
nmap <F9>     <Plug>VimspectorContinue
nmap <S-F8>   <Plug>VimspectorStepOut

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spaceline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" override default separator as slant types are drawn wrong
let g:spaceline_seperate_style = 'arrow'

" set horizontal scrollbar to 4 characters
let g:spaceline_scroll_bar_chars = [
  \ '    ', '▏   ', '▎   ', '▍   ', '▌   ',
  \ '▋   ', '▊   ', '▉   ', '█   ', '█▏  ',
  \ '█▎  ', '█▍  ', '█▌  ', '█▋  ', '█▊  ',
  \ '█▉  ', '██  ', '██▏ ', '██▎ ', '██▍ ',
  \ '██▌ ', '██▋ ', '██▊ ', '██▉ ', '███ ',
  \ '███ ', '███▎', '███▍', '███▌', '███▋',
  \ '███▊', '███▉', '████', '████',
  \ ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" deactivate setting conceallevel and concealcursor by the plugin
let g:indentLine_setConceal = 0
" keep concealed character width (line don't jump horizontally)
autocmd FileType json setlocal conceallevel=1

