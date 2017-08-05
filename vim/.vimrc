" Settings only or home use, comment out where no plugins should be installed
source ~/.vim/plugins.vim

" Set leader to ','
let mapleader = ","
let g:mapleader = ","

source ~/.vim/homesettings.vim

" Set how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Turn on the WiLd menu
set wildmenu

" Always show current position
set ruler

" Toggle number
map <leader>n :set number! relativenumber!<cr>

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Height of the command bar
set cmdheight=1

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable syntax highlighting
syntax enable 

" Set the background to dark
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set shiftround

" When moving vertically move the screen at the 7th last line
set so=7

" Set autoindent and smartindent
set ai
set si

" Set default clipboard to system
set clipboard=unnamed

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

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

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

" When you press <leader>f you can search and replace the selected text
vnoremap <silent> <leader>f :call VisualSelection('replace', '')<CR>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?
" Clear highlighted search
noremap <leader><space> :set hlsearch! hlsearch?<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Open empty vertical/horizontal split
map <leader>v :vne<cr>
map <leader>h :new<cr>

" Resize windows easily
nnoremap <silent> + :exe "vertical resize +5"<cr>
nnoremap <silent> - :exe "vertical resize -5"<cr>
nnoremap <silent> <leader>+ :exe "resize +5"<cr>
nnoremap <silent> <leader>- :exe "resize -5"<cr>
nnoremap <silent> <leader>0 <C-W>=

" Close all windows but the current one
nnoremap <silent> <leader>c <C-W>o

" New splits get opened on the right/below
set splitbelow
set splitright

" Toggle cursorline/column
if $TERM == "xterm-256color"
  set cursorline
endif
map <leader>ll :set cursorline!<cr>
map <leader>lc :set cursorcolumn!<cr>

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Moving up, down, to end/beginning works as expected
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" Always show the status line
set laststatus=2


function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Move a line of text using ALT+[jk], unfortunately on terminal vim this will
" also move lines when pressing [jk] after pressing escape in normal mode.
" In gvim replace j with <A-j> or <M-j>
nmap j mz:m+<cr>`z
nmap k mz:m-2<cr>`z
vmap j :m'>+<cr>`<my`>mzgv`yo`z
vmap k :m'<-2<cr>`>my`<mzgv`yo`z

" For use with console vim in Conemu
if has("win32")
  set term=xterm
  set t_Co=256
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"

  inoremap <Char-0x07F> <BS>
  nnoremap <Char-0x07F> <BS>
endif
