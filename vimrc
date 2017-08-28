" Ansible managed: /useblocks/dev/ansible_init/roles/bash_vim_screen/templates/.vimrc modified on 2016-10-19 09:55:20 by marco on knecht

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'Rykka/riv.vim'                  " work with rst files
Plugin 'airblade/vim-gitgutter'         " show git diff on the left column
Plugin 'aklt/plantuml-syntax'           " syntax highlighting for puml files
Plugin 'altercation/vim-colors-solarized'       " solarized color scheme
Plugin 'ctrlpvim/ctrlp.vim'             " fuzzy search files
Plugin 'dhruvasagar/vim-table-mode.git' " create tables as you type (setup for .rst)
Plugin 'dkprice/vim-easygrep'           " find and replace across files
Plugin 'godlygeek/tabular'              " align text in collumns
Plugin 'klen/python-mode'               " python language tools
Plugin 'mileszs/ack.vim'                " search recursive through across files
Plugin 'plasticboy/vim-markdown'        " markdown syntax highlighting
Plugin 'scrooloose/nerdtree'            " file browser
Plugin 'tpope/vim-fugitive'             " Git plugin
Plugin 'tpope/vim-vinegar'              " Improve netrw Vim internal plugin
Plugin 'vim-airline/vim-airline'        " Light status line
Plugin 'vim-scripts/VisINcr'            " Produce column of increasing numbers/dates/...
Plugin 'morhetz/gruvbox'                " Another color schema

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" General
set encoding=utf-8
set number          " Show line numbers
set linebreak       " Break lines at word (requires Wrap lines)

set wildmenu                    " Use wildmenu
set wildmode=longest,list,full  " Change completion to be bash-like

set showbreak=+++   " Wrap-broken line prefix
set showmatch       " Highlight matching brace
set visualbell      " Use visual bell (no beeping)

set hlsearch        " Highlight all search results
set smartcase       " Enable smart-case search
set ignorecase      " Always case-insensitive
set incsearch       " Searches for strings incrementally

set autoindent      " Auto-indent new lines
set expandtab       " Use spaces instead of tabs
set shiftwidth=4    " Number of auto-indent spaces
set smartindent     " Enable smart-indent
set smarttab        " Enable smart-tabs
set softtabstop=4   " Number of spaces per Tab
set hidden          " Don't force me to save on buffer switch

set ruler           " Show row and column ruler information
set undolevels=1000             " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour
set clipboard=unnamed           " Use global clipboard for copy and paste

let mapleader=","   " Set leader key
map ü <C-]>
map ö [
map ä ]
map Ö {
map Ä }
map ß /

" Folding
set foldmethod=syntax
set foldlevelstart=1

let javaScript_fold=1       " JavaScript
let sh_fold_enabled=1       " sh
let vimsyn_folding='af'     " Vim script
let xml_syntax_folding=1    " XML
let html_syntax_folding=1   " HTML
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" resize current buffer by +/- 5
nnoremap <A-left> :vertical resize -5<cr>
nnoremap <A-up> :resize +5<cr>
nnoremap <A-down> :resize -5<cr>
nnoremap <A-right> :vertical resize +5<cr>

" easy buffer switching
" See http://stackoverflow.com/questions/16082991/vim-switching-between-files-rapidly-using-vanilla-vim-no-plugins
nnoremap gb :ls<CR>:b<Space>
nnoremap <C-left>   :bprevious<CR>
nnoremap <C-right> :bnext<CR>

" Plugin vim-table-mode
" Generate rst type tables
let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="

" Plugin vim-easygrep
let g:EasyGrepFileAssociations='/home/marco/.vim/bundle/vim-easygrep/plugin/EasyGrepFileAssociations'
let g:EasyGrepMode=0
let g:EasyGrepCommand=0
let g:EasyGrepRecursive=1
let g:EasyGrepSearchCurrentBufferDir=1
let g:EasyGrepPerlStyle=1
let g:EasyGrepIgnoreCase=1
let g:EasyGrepHidden=0
let g:EasyGrepBinary=0
let g:EasyGrepFilesToInclude=''
let g:EasyGrepFilesToExclude=''
let g:EasyGrepAllOptionsInExplorer=1
let g:EasyGrepWindow=0
let g:EasyGrepReplaceWindowMode=0
let g:EasyGrepOpenWindowOnMatch=1
let g:EasyGrepEveryMatch=0
let g:EasyGrepJumpToMatch=1
let g:EasyGrepInvertWholeWord=0
let g:EasyGrepPatternType='regex'
let g:EasyGrepFileAssociationsInExplorer=0
let g:EasyGrepExtraWarnings=0
let g:EasyGrepOptionPrefix='<leader>vy'
let g:EasyGrepReplaceAllPerFile=0

" Plugin Ack
" Never jump to first result automatically
cnoreabbrev ag Ack!
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'    " Let ack use ag (silver searcher)
endif
set shellpipe=>             " Avoid result terminal stdout
let g:ackhighlight = 1      " Highlight search term

" Airline
set laststatus=2   " Needed to show airline without having a split
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <leader>n :NERDTreeToggle<CR>
nnoremap <leader>q :bp\|bd #<CR>
let NERDTreeShowHidden=1
" autocmd bufenter *
"     \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) |
"     \   q |
"     \ endif " Close Nerdtree when last window
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '<'
map <leader>r :NERDTreeFind<cr> " show active file in NERDTree

" ctrlp
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 0  " don't search for project root

" Colors
syntax enable
set hlsearch
set background=dark
" let g:gruvbox_contrast_dark="hard"
" let g:gruvbox_contrast_light="soft"
" set t_Co=16
" colorscheme solarized
colorscheme gruvbox
call togglebg#map("<F5>")

" Backup, Swap and Undo

" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" Set smoooth scrolling using CTRL-u (up) and CTRL-d (down)
function SmoothScroll(up)
    if a:up
        let scrollaction="\<C-y>"
    else
        let scrollaction="^\<C-e>"
    endif
    exec "normal " . scrollaction
    redraw
    let counter=1
    while counter<&scroll
        let counter+=1
        sleep 5m
        redraw
        exec "normal " . scrollaction
    endwhile
endfunction

nnoremap <C-U> :call SmoothScroll(1)<Enter>
nnoremap <C-D> :call SmoothScroll(0)<Enter>
inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>i
inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>i

" Change working directory automatically to the shown file
" set autochdir

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Highlight trailing whitespaces in red
highlight ExtraWhitespace ctermbg=blue guibg=blue
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Type ':C' to erase last search term (disables highlighting)
command C let @/=""

" Capitalize word
nmap <F3> m`b~``

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" enable project specific .vimrc files
set exrc

" disable :autocmd, shell and write commands from project specific .vimrc
" files unless they are mine
set secure

